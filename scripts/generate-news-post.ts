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
          error.message.includes('other side closed'));

      if (!isRetryable || attempt === MAX_RETRIES) {
        throw error;
      }

      const delay = INITIAL_RETRY_DELAY_MS * Math.pow(2, attempt - 1);
      console.log(
        `${context}: Attempt ${attempt} failed, retrying in ${delay}ms...`
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

interface BlogPostTranslation {
  title: string;
  excerpt: string;
  content: string;
  meta_title: string;
  meta_description: string;
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

function getPerplexityPrompt(): string {
  const today = new Date().toISOString().split('T')[0];
  const timestamp = new Date().toISOString();
  const humanizerRules = loadHumanizerRules();

  return `You are a tech news blogger for ITGuys. Your task is to:
1. Research today's most significant tech news
2. Write an engaging blog post about it
3. Output valid JSON

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

## News Topics to Cover
Focus on today's tech news across: web development, mobile development, security, AI/ML, and DevOps/cloud.
For each topic, briefly explain why it matters and how ITGuys can help (be specific, not salesy).

## Content Requirements
1. Write an engaging, well-structured blog post
2. Weave ITGuys service connections naturally into the narrative
3. Don't sound salesy - connections should feel like helpful context
4. End with a soft CTA like "If [specific challenge] sounds familiar, [let's talk](/contact)" - make "let's talk" a markdown link to /contact

## Humanizer Rules - CRITICAL: Sound Human, Not AI
${humanizerRules}

## Output Format
Output ONLY a valid JSON object (no markdown fencing, no explanation before or after).

CRITICAL JSON RULES:
- All strings must use double quotes
- Escape special characters: use \\n for newlines, \\" for quotes inside strings
- No trailing commas
- No comments

{
  "slug": "${today}-tech-news-roundup",
  "image_path": null,
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
- meta_description: MUST be 155 characters or less
`;
}

async function generateEnglishPost(): Promise<BlogPostEnglish> {
  console.log('Generating English blog post from Perplexity...');

  return withRetry(async () => {
    const { text } = await generateText({
      model: perplexity(PERPLEXITY_MODEL),
      prompt: getPerplexityPrompt(),
    });

    const cleaned = stripThinkingTags(text);
    const jsonStr = stripMarkdownFences(cleaned);

    try {
      return JSON.parse(jsonStr) as BlogPostEnglish;
    } catch {
      console.log('JSON parse failed, attempting repair...');
      const repaired = jsonrepair(jsonStr);
      return JSON.parse(repaired) as BlogPostEnglish;
    }
  }, 'generateEnglishPost');
}

async function translateToLocale(
  englishContent: BlogPostTranslation,
  locale: string
): Promise<BlogPostTranslation> {
  const localeNames: Record<string, string> = {
    ro: 'Romanian',
    fr: 'French',
    de: 'German',
    it: 'Italian',
    es: 'Spanish',
  };

  const response = await anthropic.messages.create({
    model: ANTHROPIC_MODEL,
    max_tokens: 8000,
    messages: [
      {
        role: 'user',
        content: `Translate this blog post content to ${localeNames[locale]}.

Maintain the same tone, formatting, and markdown structure. Keep URLs unchanged.

STRICT LENGTH LIMITS:
- meta_title: MUST be 60 characters or less
- meta_description: MUST be 155 characters or less

Output ONLY valid JSON with this structure:
{
  "title": "translated title",
  "excerpt": "translated excerpt",
  "content": "translated content with \\n for newlines",
  "meta_title": "translated meta title (max 60 chars)",
  "meta_description": "translated meta description (max 155 chars)"
}

Content to translate:
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
    const repaired = jsonrepair(jsonStr);
    return JSON.parse(repaired) as BlogPostTranslation;
  }
}

async function translateAll(
  englishContent: BlogPostTranslation
): Promise<Record<string, BlogPostTranslation>> {
  console.log('Translating to other languages...');

  const translations: Record<string, BlogPostTranslation> = {
    en: englishContent,
  };

  // Translate in parallel
  const results = await Promise.all(
    LOCALES.map(async (locale) => {
      console.log(`  Translating to ${locale}...`);
      const translated = await withRetry(
        () => translateToLocale(englishContent, locale),
        `translate-${locale}`
      );
      return { locale, translated };
    })
  );

  for (const { locale, translated } of results) {
    translations[locale] = translated;
  }

  return translations;
}

function validateAndFixBlogPost(post: BlogPost): BlogPost {
  const today = new Date().toISOString().split('T')[0];
  const warnings: string[] = [];

  // Fix slug date
  const slugDateMatch = post.slug.match(/^\d{4}-\d{2}-\d{2}/);
  if (slugDateMatch && slugDateMatch[0] !== today) {
    warnings.push(`Fixed slug date: ${slugDateMatch[0]} -> ${today}`);
    post.slug = post.slug.replace(slugDateMatch[0], today);
  }

  // Fix published_at date
  if (!post.published_at.startsWith(today)) {
    warnings.push(`Fixed published_at date to ${today}`);
    post.published_at = new Date().toISOString();
  }

  // Validate and truncate meta fields
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
    }
  }

  if (warnings.length > 0) {
    console.log('Validation fixes applied:');
    warnings.forEach(w => console.log(`  - ${w}`));
  }

  return post;
}

async function main() {
  // 1. Generate English blog post from Perplexity (news + writing in one call)
  const englishPost = await generateEnglishPost();
  console.log(`Generated English post with slug: ${englishPost.slug}`);

  // 2. Translate to other languages using Claude
  const allTranslations = await translateAll(englishPost.translations.en);

  // 3. Combine into final blog post
  let blogPost: BlogPost = {
    ...englishPost,
    translations: allTranslations,
  };

  // 4. Validate and fix any issues
  blogPost = validateAndFixBlogPost(blogPost);

  // 5. Write blog-post.json
  writeFileSync('blog-post.json', JSON.stringify(blogPost, null, 2));
  console.log('Wrote blog-post.json');
}

main().catch((error) => {
  console.error('Error:', error);
  process.exit(1);
});
