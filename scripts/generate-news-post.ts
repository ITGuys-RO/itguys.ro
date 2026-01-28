import { config } from 'dotenv';
config({ path: '.env.local' });
import Anthropic from '@anthropic-ai/sdk';
import { createPerplexity } from '@ai-sdk/perplexity';
import { generateText } from 'ai';
import { readFileSync, writeFileSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import { jsonrepair } from 'jsonrepair';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const anthropic = new Anthropic();
const perplexity = createPerplexity({
  apiKey: process.env.PERPLEXITY_API_KEY,
});

const ANTHROPIC_MODEL = 'claude-sonnet-4-20250514';
const PERPLEXITY_MODEL = 'sonar-reasoning-pro';
const MAX_RETRIES = 3;
const INITIAL_RETRY_DELAY_MS = 5000;

const LOCALES = ['ro', 'fr', 'de', 'it', 'es'] as const;

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
          error.message.includes('missing required fields'));

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

function stripThinkingTags(text: string): string {
  return text.replace(/<think>[\s\S]*?<\/think>\s*/gi, '').trim();
}

function stripCitationMarkers(text: string): string {
  return text.replace(/\[\d+\]/g, '');
}

interface BlogPostTranslation {
  title: string;
  excerpt: string;
  content: string;
  meta_title: string;
  meta_description: string;
  slug?: string;
}

interface BlogPostBase {
  slug: string;
  image_path: string | null;
  author_id: string | null;
  published_at: string;
  is_published: number;
  tags: string[];
}

interface BlogPostEnglish extends BlogPostBase {
  translations: {
    en: BlogPostTranslation;
  };
}

interface BlogPost extends BlogPostBase {
  translations: Record<string, BlogPostTranslation>;
}

function isValidBlogPostEnglish(obj: unknown): obj is BlogPostEnglish {
  if (!obj || typeof obj !== 'object') return false;
  const post = obj as Record<string, unknown>;

  if (typeof post.slug !== 'string' || !post.slug) return false;
  if (typeof post.is_published !== 'number') return false;
  if (!Array.isArray(post.tags)) return false;

  if (!post.translations || typeof post.translations !== 'object') return false;
  const translations = post.translations as Record<string, unknown>;
  if (!translations.en || typeof translations.en !== 'object') return false;

  const en = translations.en as Record<string, unknown>;
  if (typeof en.title !== 'string' || !en.title) return false;
  if (typeof en.content !== 'string' || !en.content) return false;
  if (typeof en.excerpt !== 'string') return false;

  return true;
}

function loadHumanizerRules(): string {
  const skillPath = join(__dirname, '..', 'vendor', 'humanizer', 'SKILL.md');
  try {
    const content = readFileSync(skillPath, 'utf-8');
    const withoutFrontmatter = content.replace(/^---[\s\S]*?---\s*/, '');
    return withoutFrontmatter;
  } catch (error) {
    console.error(`Warning: Could not load humanizer rules from ${skillPath}`);
    console.error(error);
    return '';
  }
}

function getResearchPrompt(): string {
  return `Search for today's most significant tech news in these categories ONLY:
- Security vulnerabilities, breaches, or patches
- DDoS attacks, CDN, or WAF topics (Akamai, Cloudflare)
- Cloud infrastructure: AWS, Docker, Kubernetes
- PHP framework updates or vulnerabilities
- Native iOS/Android development: Swift, Kotlin, mobile security
- API security, authentication flaws, OAuth/JWT
- Enterprise compliance: GDPR, SOC2, HIPAA
- Web application security: XSS, SQLi, CSRF

If nothing relevant is trending today, find the most recent security advisory or CVE affecting PHP, AWS, iOS, or Android.

Return your findings as PLAIN TEXT (not JSON) with:
- Headline: what happened
- Summary: 2-3 paragraphs explaining the news
- Key facts: bullet points of important details
- Sources: URLs where you found this information
- Why it matters: practical implications for developers and teams
- Image: ONE landscape image URL (min 1200×630px) directly related to the topic. Must be from a source that allows hotlinking (vendor blogs, official press releases, GitHub, wikimedia). NOT from Getty, Shutterstock, or paywalled sites. If no suitable image, write "No image available."`;
}

async function researchNews(): Promise<string> {
  console.log('Step 1: Researching news with Perplexity...');
  try {
    return await withRetry(async () => {
      const { text } = await generateText({
        model: perplexity(PERPLEXITY_MODEL),
        prompt: getResearchPrompt(),
      });
      return stripThinkingTags(text);
    }, 'researchNews');
  } catch (error) {
    console.warn('Perplexity failed, falling back to Claude knowledge:', (error as Error).message);
    return 'FALLBACK: No live research available. Write about a recent security advisory, CVE, or notable tech development from your knowledge. Focus on practical implications for web developers, mobile developers, and security teams.';
  }
}

function getWritePostPrompt(research: string): string {
  const today = new Date().toISOString().split('T')[0];
  const timestamp = new Date().toISOString();
  const humanizerRules = loadHumanizerRules();

  return `You are a tech news blogger for ITGuys. Write a blog post based on the research below.

## Research
${research}

## About ITGuys
ITGuys is a tech consultancy with 30+ combined years of experience from Electronic Arts, TUI, and Nagarro.

**Services:**
- Web Applications: Custom web apps, APIs, cloud infrastructure (PHP, Docker, AWS)
- Native Mobile Apps: iOS and Android (Swift, Kotlin) - real native development
- Security Services: Penetration testing, Akamai/Cloudflare configuration, cloud security reviews, DDoS protection

**Background:**
- Penetration testing at Electronic Arts
- DDoS protection systems at TUI
- 5+ years native mobile at Nagarro (IoT, healthcare, e-commerce)
- Swiss enterprise clients with compliance requirements

**Who we help:** Startups (MVP to scale) and Enterprise teams (secure integrations, compliance)

## ITGuys Brand Voice
- Direct and honest - no fluff, no buzzwords
- Security-first perspective - weave security implications into the narrative
- Pragmatic - focus on practical implications for developers and teams
- Professionally casual tone - "Let's Talk" not "Contact Us"
- Experience-driven - reference real-world scenarios

## Content Requirements
1. Write an engaging, well-structured blog post
2. Weave ITGuys service connections naturally into the narrative
3. Don't sound salesy - connections should feel like helpful context
4. End with a soft CTA like "If [specific challenge] sounds familiar, [let's talk](/contact)" - make "let's talk" a markdown link to /contact

## Internal Linking (SEO)
Include 1-3 relevant internal links naturally within the content:
- /services - General services overview
- /development - Web & mobile development services
- /portfolio - Case studies and past work
- /about - Team background and experience
- /contact - Contact page

## Humanizer Rules - Sound Human, Not AI
${humanizerRules}

## Key Writing Fixes
- Replace em dashes (—) with commas or periods
- Remove AI vocabulary (additionally, crucial, delve, landscape, testament, etc.)
- Fix copula avoidance (replace "serves as", "stands as" with "is")
- Remove promotional language (groundbreaking, vibrant, nestled, etc.)

## Output Format
Output ONLY a valid JSON object (no markdown fencing, no explanation before or after).

CRITICAL JSON RULES:
- All strings must use double quotes
- Escape special characters: use \\n for newlines, \\" for quotes inside strings
- No trailing commas
- No comments

{
  "slug": "${today}-descriptive-slug-here",
  "image_path": "Extract a landscape image URL from the research if available, or null if none found",
  "author_id": null,
  "published_at": "${timestamp}",
  "is_published": 1,
  "tags": ["tech-news", "daily-roundup", ...relevant tags],
  "translations": {
    "en": {
      "title": "Your title here",
      "excerpt": "2-3 sentence summary",
      "content": "Full markdown content with \\n for newlines",
      "meta_title": "Max 60 chars for SEO",
      "meta_description": "Max 155 chars for SEO"
    }
  }
}

## STRICT LENGTH LIMITS
- meta_title: MUST be 60 characters or less
- meta_description: MUST be 155 characters or less`;
}

function buildMinimalPost(title: string, excerpt: string, content: string): BlogPostEnglish {
  const today = new Date().toISOString().split('T')[0];
  const slug = today + '-' + generateSlug(title);
  return {
    slug,
    image_path: null,
    author_id: null,
    published_at: new Date().toISOString(),
    is_published: 1,
    tags: ['tech-news', 'daily-roundup'],
    translations: {
      en: {
        title,
        excerpt,
        content,
        meta_title: title.length > 60 ? title.substring(0, 57) + '...' : title,
        meta_description: excerpt.length > 155 ? excerpt.substring(0, 152) + '...' : excerpt,
      },
    },
  };
}

async function writeEnglishPost(research: string): Promise<BlogPostEnglish> {
  console.log('Step 2: Writing blog post with Claude...');

  try {
    return await withRetry(async () => {
      const response = await anthropic.messages.create({
        model: ANTHROPIC_MODEL,
        max_tokens: 8000,
        messages: [
          {
            role: 'user',
            content: getWritePostPrompt(research),
          },
        ],
      });

      const textContent = response.content.find((block) => block.type === 'text');
      if (!textContent || textContent.type !== 'text') {
        throw new Error('No text content in Claude response');
      }

      const jsonStr = stripCitationMarkers(stripMarkdownFences(textContent.text));

      let parsed: unknown;
      try {
        parsed = JSON.parse(jsonStr);
      } catch {
        console.log('JSON parse failed, attempting repair...');
        const repaired = jsonrepair(jsonStr);
        parsed = JSON.parse(repaired);
      }

      if (!isValidBlogPostEnglish(parsed)) {
        console.error('Parsed JSON is missing required fields');
        writeFileSync('debug-write-response.txt', textContent.text);
        throw new Error('Claude response missing required fields');
      }

      return parsed;
    }, 'writeEnglishPost');
  } catch (error) {
    console.warn('Full structured write failed, trying minimal schema...', (error as Error).message);

    // Fallback: ask for just title/excerpt/content, build the rest programmatically
    const response = await anthropic.messages.create({
      model: ANTHROPIC_MODEL,
      max_tokens: 8000,
      messages: [
        {
          role: 'user',
          content: `Write a blog post based on this research. Return ONLY a JSON object with exactly three fields: "title", "excerpt", "content". Use \\n for newlines in content. No other fields, no markdown fencing.

Research:
${research}`,
        },
      ],
    });

    const textContent = response.content.find((block) => block.type === 'text');
    if (!textContent || textContent.type !== 'text') {
      throw new Error('No text content in minimal fallback response');
    }

    const jsonStr = stripMarkdownFences(textContent.text);
    let minimal: { title: string; excerpt: string; content: string };
    try {
      minimal = JSON.parse(jsonStr);
    } catch {
      const repaired = jsonrepair(jsonStr);
      minimal = JSON.parse(repaired);
    }

    console.log('Built post from minimal fallback');
    return buildMinimalPost(minimal.title, minimal.excerpt, minimal.content);
  }
}

async function humanizeEnglishPost(
  englishContent: BlogPostTranslation
): Promise<BlogPostTranslation> {
  console.log('Step 3: Humanizing English content with Claude...');

  const response = await anthropic.messages.create({
    model: ANTHROPIC_MODEL,
    max_tokens: 8000,
    messages: [
      {
        role: 'user',
        content: `You are a writing editor. Review and fix any AI writing patterns in this blog post.

## Key Fixes to Apply
- Replace em dashes (—) with commas or periods
- Remove AI vocabulary (additionally, crucial, delve, landscape, testament, revolutionize, robust, comprehensive, cutting-edge, leverage, streamline, spearhead, paradigm, synergy, elevate, foster, empower, navigate, seamlessly, holistic)
- Fix copula avoidance (replace "serves as", "stands as", "acts as a" with "is")
- Remove promotional language (groundbreaking, vibrant, nestled, game-changing, world-class)
- Don't start sentences with "In today's..." or "In the ever..."
- Avoid "It's worth noting that" and "It's important to note that"
- Keep the same meaning and tone, just make it sound human

## Length Limits (STRICT)
- meta_title: MAX 60 characters
- meta_description: MAX 155 characters

## Output
Output ONLY valid JSON with the fixed content. Keep all fields, just fix the text:
{
  "title": "...",
  "excerpt": "...",
  "content": "... use \\n for newlines ...",
  "meta_title": "...",
  "meta_description": "..."
}

## Content to Humanize
${JSON.stringify(englishContent, null, 2)}`,
      },
    ],
  });

  const textContent = response.content.find((block) => block.type === 'text');
  if (!textContent || textContent.type !== 'text') {
    throw new Error('No text content in humanizer response');
  }

  const jsonStr = stripMarkdownFences(textContent.text);
  try {
    return JSON.parse(jsonStr) as BlogPostTranslation;
  } catch (parseError) {
    console.log('  JSON parse failed for humanizer, attempting repair...');
    try {
      const repaired = jsonrepair(jsonStr);
      return JSON.parse(repaired) as BlogPostTranslation;
    } catch (repairError) {
      console.error('  Failed to repair JSON from humanizer:');
      console.error(`  Raw response length: ${jsonStr.length}`);
      console.error(`  First 500 chars: ${jsonStr.slice(0, 500)}`);
      writeFileSync('debug-humanizer.txt', textContent.text);
      console.error('  Full response saved to debug-humanizer.txt');
      throw repairError;
    }
  }
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

  const jsonStr = stripCitationMarkers(stripMarkdownFences(textContent.text));
  try {
    return JSON.parse(jsonStr) as BlogPostTranslation;
  } catch (parseError) {
    console.log(`  JSON parse failed for ${locale}, attempting repair...`);
    try {
      const repaired = jsonrepair(jsonStr);
      return JSON.parse(repaired) as BlogPostTranslation;
    } catch (repairError) {
      console.error(`  Failed to repair JSON for ${locale}:`);
      console.error(`  Raw response length: ${jsonStr.length}`);
      console.error(`  First 500 chars: ${jsonStr.slice(0, 500)}`);
      console.error(`  Last 500 chars: ${jsonStr.slice(-500)}`);
      writeFileSync(`debug-translation-${locale}.txt`, textContent.text);
      console.error(`  Full response saved to debug-translation-${locale}.txt`);
      throw repairError;
    }
  }
}

async function translateAll(
  englishContent: BlogPostTranslation
): Promise<Record<string, BlogPostTranslation>> {
  console.log('Step 4: Translating to other languages...');

  const translations: Record<string, BlogPostTranslation> = {
    en: englishContent,
  };

  const results = await Promise.allSettled(
    LOCALES.map(async (locale) => {
      console.log(`  Translating to ${locale}...`);
      const translated = await withRetry(
        () => translateToLocale(englishContent, locale),
        `translate-${locale}`
      );
      return { locale, translated };
    })
  );

  for (const result of results) {
    if (result.status === 'fulfilled') {
      translations[result.value.locale] = result.value.translated;
    } else {
      console.warn(`  Translation failed, skipping: ${result.reason}`);
    }
  }

  return translations;
}

function generateSlug(text: string): string {
  return text
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9\s-]/g, '')
    .trim()
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-');
}

async function validateImageUrl(url: string): Promise<boolean> {
  try {
    const controller = new AbortController();
    const timeout = setTimeout(() => controller.abort(), 5000);
    const response = await fetch(url, {
      method: 'HEAD',
      signal: controller.signal,
    });
    clearTimeout(timeout);
    if (response.status !== 200) return false;
    const contentType = response.headers.get('content-type') || '';
    return contentType.startsWith('image/');
  } catch {
    return false;
  }
}

async function validateAndFixBlogPost(post: BlogPost): Promise<BlogPost> {
  console.log('Step 5: Validating and fixing blog post...');
  const today = new Date().toISOString().split('T')[0];
  const warnings: string[] = [];

  const slugDateMatch = post.slug.match(/^\d{4}-\d{2}-\d{2}/);
  if (slugDateMatch && slugDateMatch[0] !== today) {
    warnings.push(`Fixed slug date: ${slugDateMatch[0]} -> ${today}`);
    post.slug = post.slug.replace(slugDateMatch[0], today);
  }

  if (!post.published_at.startsWith(today)) {
    warnings.push(`Fixed published_at date to ${today}`);
    post.published_at = new Date().toISOString();
  }

  if (typeof post.image_path === 'string') {
    const valid = await validateImageUrl(post.image_path);
    if (!valid) {
      warnings.push(`Invalid image URL, setting to null: ${post.image_path}`);
      post.image_path = null;
    }
  }

  const MAX_META_TITLE = 60;
  const MAX_META_DESC = 155;

  for (const [locale, translation] of Object.entries(post.translations)) {
    if (translation) {
      if (translation.meta_title && translation.meta_title.length > MAX_META_TITLE) {
        warnings.push(`Truncated meta_title (${locale}): ${translation.meta_title.length} -> ${MAX_META_TITLE} chars`);
        translation.meta_title = translation.meta_title.substring(0, MAX_META_TITLE - 3) + '...';
      }
      if (translation.meta_description && translation.meta_description.length > MAX_META_DESC) {
        warnings.push(`Truncated meta_description (${locale}): ${translation.meta_description.length} -> ${MAX_META_DESC} chars`);
        translation.meta_description = translation.meta_description.substring(0, MAX_META_DESC - 3) + '...';
      }

      if (locale === 'en') {
        translation.slug = post.slug;
      } else if (translation.slug) {
        const datePrefix = post.slug.match(/^\d{4}-\d{2}-\d{2}-/)?.[0] || '';
        const slugWithoutDate = translation.slug.replace(/^\d{4}-\d{2}-\d{2}-/, '');
        const cleanSlug = generateSlug(slugWithoutDate);
        const fixedSlug = datePrefix + cleanSlug;

        if (fixedSlug !== translation.slug) {
          warnings.push(`Fixed slug (${locale}): ${translation.slug} -> ${fixedSlug}`);
          translation.slug = fixedSlug;
        }
      } else {
        const datePrefix = post.slug.match(/^\d{4}-\d{2}-\d{2}-/)?.[0] || '';
        translation.slug = datePrefix + generateSlug(translation.title);
        warnings.push(`Generated slug (${locale}): ${translation.slug}`);
      }
    }
  }

  if (warnings.length > 0) {
    console.log('Validation fixes applied:');
    warnings.forEach(w => console.log(`  - ${w}`));
  }

  return post;
}

async function main() {
  // Step 1: Research news (Perplexity, plain text)
  const research = await researchNews();
  console.log(`Research complete (${research.length} chars)`);

  // Step 2: Write structured blog post (Claude)
  const englishPost = await writeEnglishPost(research);
  console.log(`Generated English post with slug: ${englishPost.slug}`);

  // Step 3: Humanize English content (Claude, with fallback to skip)
  let humanized: BlogPostTranslation;
  try {
    humanized = await withRetry(
      () => humanizeEnglishPost(englishPost.translations.en),
      'humanizeEnglishPost'
    );
    console.log('Humanized English content');
  } catch (error) {
    console.warn('Humanizer failed, using original content:', (error as Error).message);
    humanized = englishPost.translations.en;
  }

  // Step 4: Translate to other languages (parallel, partial OK)
  const allTranslations = await translateAll(humanized);

  // Step 5: Combine and validate
  let blogPost: BlogPost = {
    ...englishPost,
    translations: allTranslations,
  };

  blogPost = await validateAndFixBlogPost(blogPost);

  writeFileSync('blog-post.json', JSON.stringify(blogPost, null, 2));
  console.log(`Wrote blog-post.json with ${Object.keys(blogPost.translations).length} translations`);
}

main().catch((error) => {
  console.error('Error:', error);
  process.exit(1);
});
