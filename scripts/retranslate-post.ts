import Anthropic from '@anthropic-ai/sdk';
import { readFileSync, writeFileSync } from 'fs';
import { jsonrepair } from 'jsonrepair';

const anthropic = new Anthropic();
const ANTHROPIC_MODEL = 'claude-sonnet-4-20250514';
const MAX_RETRIES = 3;
const INITIAL_RETRY_DELAY_MS = 5000;

interface BlogPostTranslation {
  title: string;
  excerpt: string;
  content: string;
  meta_title: string;
  meta_description: string;
  slug?: string;
}

interface BlogPost {
  slug: string;
  image_path: string | null;
  author_id: string | null;
  published_at: string;
  is_published: number;
  tags: string[];
  translations: Record<string, BlogPostTranslation>;
}

async function withRetry<T>(
  fn: () => Promise<T>,
  context: string
): Promise<T> {
  let lastError: Error | undefined;
  for (let attempt = 1; attempt <= MAX_RETRIES; attempt++) {
    try {
      return await fn();
    } catch (error) {
      lastError = error as Error;
      const isRetryable =
        error instanceof Error &&
        (error.message.includes('terminated') ||
          error.message.includes('socket') ||
          error.message.includes('ECONNRESET') ||
          error.message.includes('other side closed') ||
          error.message.includes('Failed to parse') ||
          error.message.includes('missing required fields') ||
          error.message.includes('expected at position'));

      if (!isRetryable || attempt === MAX_RETRIES) {
        throw error;
      }

      const delay = INITIAL_RETRY_DELAY_MS * Math.pow(2, attempt - 1);
      console.log(
        `${context}: Attempt ${attempt} failed (${error.message}), retrying in ${delay}ms...`
      );
      await new Promise((resolve) => setTimeout(resolve, delay));
    }
  }
  throw lastError;
}

function stripMarkdownFences(text: string): string {
  return text.replace(/^```(?:json)?\s*\n?/i, '').replace(/\n?```\s*$/i, '').trim();
}

const LOCALE_RULES: Record<string, { name: string; rules: string }> = {
  ro: {
    name: 'Romanian',
    rules: `- Use Romanian diacritics: ă, â, î, ș, ț (notş, ţ with cedilla)
- Quotation marks: „..." (99-66 style)
- No space before punctuation marks
- Decimal separator: comma (3,14)`,
  },
  fr: {
    name: 'French',
    rules: `- Add non-breaking space BEFORE: : ; ! ? » and AFTER: «
- Quotation marks: « ... » (guillemets with spaces inside)
- Decimal separator: comma (3,14)
- Use « guillemets » not "English quotes"`,
  },
  de: {
    name: 'German',
    rules: `- Quotation marks: „..." (99-66 style) or »...«
- Compound nouns: write as one word (Datenschutzrichtlinie, not Datenschutz Richtlinie)
- Formal "Sie" for addressing readers
- Decimal separator: comma (3,14)
- No space before punctuation`,
  },
  it: {
    name: 'Italian',
    rules: `- Quotation marks: «...» (guillemets without inner spaces) or "..."
- No space before punctuation marks
- Decimal separator: comma (3,14)
- Articles before company names where grammatically natural`,
  },
  es: {
    name: 'Spanish',
    rules: `- Inverted punctuation: ¿...? and ¡...!
- Quotation marks: «...» or "..."
- No space before punctuation marks
- Decimal separator: comma (3,14)
- Use "usted" form for professional tone`,
  },
};

async function translateToLocale(
  englishContent: BlogPostTranslation,
  locale: string
): Promise<BlogPostTranslation> {
  const localeConfig = LOCALE_RULES[locale];
  if (!localeConfig) {
    throw new Error(`Unknown locale: ${locale}`);
  }

  const response = await anthropic.messages.create({
    model: ANTHROPIC_MODEL,
    max_tokens: 8000,
    messages: [
      {
        role: 'user',
        content: `Translate this blog post to ${localeConfig.name}.

## Translation Quality Rules
1. **Natural fluency over literal translation** - Write as a native speaker would, not word-for-word
2. **Maintain tone** - Keep the direct, professional-casual voice
3. **Keep unchanged**: URLs, code snippets, brand names (ITGuys, Samsung, Microsoft)
4. **Markdown** - Preserve all formatting (headers, links, bold, lists)

## ${localeConfig.name} Punctuation & Typography Rules
${localeConfig.rules}

## Length Limits (STRICT)
- meta_title: MAX 60 characters
- meta_description: MAX 155 characters

## Slug Generation
Generate a URL-friendly slug in ${localeConfig.name} based on the translated title:
- Lowercase only
- Replace spaces with hyphens
- Remove diacritics/accents (e.g., é→e, ñ→n, ü→u)
- Remove special characters except hyphens
- Keep the date prefix from English slug if present (e.g., "2025-01-26-")
- Example: "Noticias de Tecnología" → "noticias-de-tecnologia"

## Output
Output ONLY valid JSON:
{
  "title": "...",
  "excerpt": "...",
  "content": "... use \\n for newlines ...",
  "meta_title": "...",
  "meta_description": "...",
  "slug": "..."
}

## Source Content
${JSON.stringify(englishContent, null, 2)}`,
      },
    ],
  });

  const textContent = response.content.find((block) => block.type === 'text');
  if (!textContent || textContent.type !== 'text') {
    throw new Error('No text content in translation response');
  }

  const jsonStr = stripMarkdownFences(textContent.text);
  try {
    return JSON.parse(jsonStr) as BlogPostTranslation;
  } catch {
    console.log(`  JSON parse failed for ${locale}, attempting repair...`);
    try {
      const repaired = jsonrepair(jsonStr);
      return JSON.parse(repaired) as BlogPostTranslation;
    } catch (repairError) {
      console.error(`  Failed to repair JSON for ${locale}:`);
      console.error(`  Raw response length: ${jsonStr.length}`);
      console.error(`  First 500 chars: ${jsonStr.slice(0, 500)}`);
      writeFileSync(`debug-translation-${locale}.txt`, textContent.text);
      console.error(`  Full response saved to debug-translation-${locale}.txt`);
      throw repairError;
    }
  }
}

async function main() {
  const localesEnv = process.env.LOCALES;
  if (!localesEnv) {
    console.error('LOCALES env var is required (comma-separated, e.g. "ro,fr")');
    process.exit(1);
  }

  const targetLocales = localesEnv.split(',').map((l) => l.trim()).filter(Boolean);
  const validLocales = Object.keys(LOCALE_RULES);
  for (const locale of targetLocales) {
    if (!validLocales.includes(locale)) {
      console.error(`Invalid locale: ${locale}. Valid: ${validLocales.join(', ')}`);
      process.exit(1);
    }
  }

  console.log(`Retranslating to: ${targetLocales.join(', ')}`);

  const postData: BlogPost = JSON.parse(readFileSync('blog-post.json', 'utf-8'));
  const englishContent = postData.translations.en;
  if (!englishContent) {
    console.error('No English translation found in blog-post.json');
    process.exit(1);
  }

  const results = await Promise.allSettled(
    targetLocales.map(async (locale) => {
      console.log(`  Translating to ${locale}...`);
      const translated = await withRetry(
        () => translateToLocale(englishContent, locale),
        `translate-${locale}`
      );
      // Validate and fix meta field lengths
      if (translated.meta_title && translated.meta_title.length > 60) {
        translated.meta_title = translated.meta_title.slice(0, 57) + '...';
      }
      if (translated.meta_description && translated.meta_description.length > 155) {
        translated.meta_description = translated.meta_description.slice(0, 152) + '...';
      }
      return { locale, translated };
    })
  );

  let successCount = 0;
  for (const result of results) {
    if (result.status === 'fulfilled') {
      postData.translations[result.value.locale] = result.value.translated;
      successCount++;
      console.log(`  ✓ ${result.value.locale} done`);
    } else {
      console.error(`  ✗ Translation failed: ${result.reason instanceof Error ? result.reason.message : result.reason}`);
    }
  }

  if (successCount === 0) {
    console.error('All translations failed');
    process.exit(1);
  }

  writeFileSync('blog-post.json', JSON.stringify(postData, null, 2));
  console.log(`Retranslation complete: ${successCount}/${targetLocales.length} succeeded`);
}

main();
