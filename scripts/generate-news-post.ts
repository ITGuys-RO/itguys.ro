import { config } from 'dotenv';
config({ path: '.env.local' });
import Anthropic from '@anthropic-ai/sdk';
import { readFileSync, writeFileSync } from 'fs';
import { join, dirname, extname } from 'path';
import { fileURLToPath } from 'url';
import { jsonrepair } from 'jsonrepair';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const anthropic = new Anthropic();

const ANTHROPIC_MODEL = 'claude-opus-4-6';
const MAX_RETRIES = 3;
const INITIAL_RETRY_DELAY_MS = 30000;

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
          error.message.includes('missing required fields') ||
          error.message.includes('expected at position') ||
          error.message.includes('429') ||
          error.message.includes('rate_limit') ||
          error.message.includes('overloaded'));

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

function stripCitationMarkers(text: string): string {
  return text.replace(/\[\d+\]/g, '');
}

function extractJsonObject(text: string): string {
  let cleaned = stripCitationMarkers(stripMarkdownFences(text));
  // Find the first { and the matching last } to isolate the JSON object
  const firstBrace = cleaned.indexOf('{');
  if (firstBrace > 0) {
    cleaned = cleaned.substring(firstBrace);
  }
  const lastBrace = cleaned.lastIndexOf('}');
  if (lastBrace !== -1 && lastBrace < cleaned.length - 1) {
    cleaned = cleaned.substring(0, lastBrace + 1);
  }
  return cleaned;
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
  imageCandidates?: ImageCandidate[];
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

interface ImageCandidate {
  imageUrl: string;
  pageTitle: string;
  sourceUrl: string;
}

interface ImageScore {
  candidate: ImageCandidate;
  score: number;
  rejected: boolean;
  reason?: string;
}

async function scoreImageCandidate(
  candidate: ImageCandidate,
  articleTopic: string
): Promise<ImageScore> {
  try {
    const response = await anthropic.messages.create({
      model: ANTHROPIC_MODEL,
      max_tokens: 30,
      messages: [{
        role: 'user',
        content: [
          {
            type: 'image',
            source: { type: 'url', url: candidate.imageUrl },
          },
          {
            type: 'text',
            text: `Rate this image as a blog hero image for an article about: ${articleTopic.substring(0, 300)}

Check these criteria:
1. No visible URLs, watermarks, or overlaid text
2. Relevant to the article topic
3. Looks like a hero/banner image (not a tiny icon, avatar, or logo)

Answer in EXACTLY this format (nothing else):
SCORE: 0-10
REJECT: yes/no
REASON: one short phrase`,
          },
        ],
      }],
    });

    const answer = response.content[0]?.type === 'text' ? response.content[0].text.trim() : '';
    const scoreMatch = answer.match(/SCORE:\s*(\d+)/i);
    const rejectMatch = answer.match(/REJECT:\s*(yes|no)/i);
    const reasonMatch = answer.match(/REASON:\s*(.+)/i);

    const score = scoreMatch ? parseInt(scoreMatch[1], 10) : 5;
    const rejected = rejectMatch ? rejectMatch[1].toLowerCase() === 'yes' : false;
    const reason = reasonMatch?.[1]?.trim();

    return { candidate, score, rejected, reason };
  } catch {
    return { candidate, score: 5, rejected: false };
  }
}

async function scoreAndFilterCandidates(
  candidates: ImageCandidate[],
  articleTopic: string
): Promise<ImageCandidate[]> {
  if (candidates.length === 0) return candidates;

  console.log('  Scoring candidates with vision...');
  const results = await Promise.allSettled(
    candidates.map(c => scoreImageCandidate(c, articleTopic))
  );

  const scores: ImageScore[] = [];
  for (const result of results) {
    if (result.status === 'fulfilled') {
      const s = result.value;
      const status = s.rejected ? 'REJECTED' : `score=${s.score}`;
      console.log(`  ${status}${s.reason ? ` (${s.reason})` : ''}: ${s.candidate.imageUrl}`);
      scores.push(s);
    }
  }

  // Filter rejected, sort by score descending
  return scores
    .filter(s => !s.rejected)
    .sort((a, b) => b.score - a.score)
    .map(s => s.candidate);
}

async function extractImageCandidates(sourceUrls: string[]): Promise<ImageCandidate[]> {
  const candidates: ImageCandidate[] = [];

  const results = await Promise.allSettled(
    sourceUrls.slice(0, 10).map(async (url) => {
      const controller = new AbortController();
      const timeout = setTimeout(() => controller.abort(), 5000);
      const response = await fetch(url, {
        signal: controller.signal,
        headers: { 'User-Agent': 'Mozilla/5.0 (compatible; bot)' },
      });
      clearTimeout(timeout);

      if (!response.ok) return null;
      const html = await response.text();

      const ogMatch = html.match(/<meta[^>]*property=["']og:image["'][^>]*content=["']([^"']+)["']/i)
        || html.match(/<meta[^>]*content=["']([^"']+)["'][^>]*property=["']og:image["']/i);

      if (!ogMatch?.[1]) return null;

      const imageUrl = ogMatch[1].startsWith('http') ? ogMatch[1] : new URL(ogMatch[1], url).href;
      const valid = await validateImageUrl(imageUrl);
      if (!valid) return null;

      const titleMatch = html.match(/<meta[^>]*property=["']og:title["'][^>]*content=["']([^"']+)["']/i)
        || html.match(/<title[^>]*>([^<]+)<\/title>/i);
      const pageTitle = titleMatch?.[1]?.trim() || '';

      return { imageUrl, pageTitle, sourceUrl: url };
    })
  );

  for (const result of results) {
    if (result.status === 'fulfilled' && result.value) {
      candidates.push(result.value);
    }
  }

  return candidates;
}

function pickBestImage(candidates: ImageCandidate[]): string | null {
  if (candidates.length === 0) return null;
  // Candidates are already sorted by score from scoreAndFilterCandidates
  console.log(`  Using best candidate: "${candidates[0].pageTitle}"`);
  return candidates[0].imageUrl;
}

async function searchFallbackImage(articleTopic: string): Promise<ImageCandidate[]> {
  console.log('  Searching for fallback image via Claude web search...');
  try {
    const queryResponse = await anthropic.messages.create({
      model: ANTHROPIC_MODEL,
      max_tokens: 50,
      messages: [{
        role: 'user',
        content: `Based on this tech article topic, write a short image search query (5-10 words) to find a relevant, high-quality photo. Focus on the core technology or concept, not the news event itself. Return ONLY the search query, nothing else.

Topic: ${articleTopic.substring(0, 500)}`,
      }],
    });
    const searchQuery = queryResponse.content[0]?.type === 'text'
      ? queryResponse.content[0].text.trim()
      : articleTopic.substring(0, 100);

    console.log(`  Search query: "${searchQuery}"`);

    const result = await withRetry(async () => {
      return await anthropic.messages.create({
        model: ANTHROPIC_MODEL,
        max_tokens: 1024,
        tools: [{
          type: 'web_search_20250305' as const,
          name: 'web_search',
          max_uses: 2,
        }],
        messages: [{
          role: 'user',
          content: `Find web pages with high-quality images related to: ${searchQuery}`,
        }],
      });
    }, 'searchFallbackImage');

    const urls = extractSourceUrls(result.content);
    if (urls.length === 0) {
      console.log('  No source URLs from fallback search');
      return [];
    }

    console.log(`  Found ${urls.length} source URL(s) for fallback images`);
    return await extractImageCandidates(urls);
  } catch (err) {
    console.warn(`  Fallback image search failed: ${(err as Error).message}`);
    return [];
  }
}

function getWritePostPrompt(): string {
  const today = new Date().toISOString().split('T')[0];
  const timestamp = new Date().toISOString();
  const humanizerRules = loadHumanizerRules();

  return `You are a senior tech consultant at ITGuys. Your task: use web search to find today's most significant tech news, then write an expert commentary blog post about it.

## Step 1: Research

Search the web for today's most important tech news, rotating across these categories:

**Software Development (50% priority):**
- PHP framework updates: Laravel, Symfony, new features, performance improvements
- JavaScript/TypeScript ecosystem: React, Vue, Next.js, Node.js releases
- Web performance improvements, browser APIs, WebAssembly developments
- Database technology updates: PostgreSQL, MySQL, MongoDB, Redis
- API design patterns, GraphQL/REST developments, developer tooling

**Mobile Development (30% priority):**
- iOS updates: Swift improvements, Xcode releases, SwiftUI developments
- Android updates: Kotlin news, Jetpack Compose, Android Studio features
- Mobile performance optimization, battery efficiency, offline-first patterns
- App Store/Play Store policy changes affecting developers

**Security (20% priority):**
- Critical CVEs affecting PHP, Node.js, iOS, or Android platforms
- Security patches for popular frameworks and development tools
- Authentication and authorization best practices

Prioritize development-focused stories first. Only lead with security if there's a major CVE affecting common development tools or a significant breach with lessons for developers.

## Step 2: Write the Blog Post

Based on your research, write an opinionated analysis. Don't just summarize the news — explain what it means for development teams, highlight risks or opportunities, and share practical recommendations informed by ITGuys' real-world experience across web development, native mobile apps, and security.

## About ITGuys
ITGuys is a tech consultancy with 30+ combined years of experience in gaming, travel, and enterprise software.

**Services:**
- Web Applications: Custom web apps, APIs, cloud infrastructure (PHP, Docker, AWS)
- Native Mobile Apps: iOS and Android (Swift, Kotlin) - real native development
- Security Services: Penetration testing, Akamai/Cloudflare configuration, cloud security reviews, DDoS protection

**Background:**
- Penetration testing for major gaming studios
- DDoS protection for large-scale travel platforms
- 5+ years native mobile development (IoT, healthcare, e-commerce)
- Swiss enterprise clients with compliance requirements

**Who we help:** Startups (MVP to scale) and Enterprise teams (secure integrations, compliance)

IMPORTANT: Never mention other company names in the blog post. Reference experience generically (e.g., "in our work with gaming studios" not "at Electronic Arts").

## ITGuys Brand Voice
- Direct and honest - no fluff, no buzzwords
- Expert perspective across web, mobile, and security - match the angle to the topic
- Pragmatic - focus on practical implications for developers and teams
- Professionally casual tone - "Let's Talk" not "Contact Us"
- Experience-driven - reference real-world scenarios from our own work

## Content Requirements
1. Start with a brief summary of the news (1-2 paragraphs), then shift to ITGuys' expert analysis
2. Share concrete opinions - what should teams do differently? What risks should they prepare for?
3. Reference ITGuys' experience naturally across all three domains, not just security. Examples:
   - Web: "When we build cloud-native apps for enterprise clients..." / "From our PHP and Docker work..."
   - Mobile: "In our native iOS and Android projects..." / "We've seen this pattern in healthcare and IoT apps..."
   - Security: "During our penetration testing engagements..." / "When configuring Cloudflare for DDoS protection..."
   - Never use "ITGuys offers..." - frame it as lived experience
4. Provide at least one actionable recommendation readers can apply immediately
5. Match the commentary angle to the news topic - if it's about a mobile framework, lead with mobile expertise; if about a CVE, lead with security experience; if about cloud/infra, lead with web development experience
6. Don't sound salesy - connections should feel like helpful context
7. End with a soft CTA like "If [specific challenge] sounds familiar, [let's talk](/contact)" - make "let's talk" a markdown link to /contact

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
  "image_path": "A direct URL to a relevant landscape image (jpg/png/webp) from the research sources, or null if none available. Look for images in the source URLs mentioned in the research - check vendor blogs, press releases, or official announcements for hero/banner images.",
  "author_id": null,
  "published_at": "${timestamp}",
  "is_published": 1,
  "tags": ["tech-news", "expert-analysis", ...relevant tags],
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

function extractSourceUrls(content: unknown[]): string[] {
  const urls = new Set<string>();
  for (const block of content) {
    const b = block as Record<string, unknown>;
    if (b.type === 'web_search_tool_result' && Array.isArray(b.content)) {
      for (const item of b.content) {
        const r = item as Record<string, unknown>;
        if (r.type === 'web_search_result' && typeof r.url === 'string') {
          urls.add(r.url);
        }
      }
    }
  }
  return [...urls];
}

interface WriteResult {
  post: BlogPostEnglish;
  sourceUrls: string[];
}

async function writeEnglishPost(): Promise<WriteResult> {
  console.log('Step 1: Researching news + writing blog post with Claude...');

  try {
    return await withRetry(async () => {
      const response = await anthropic.messages.create({
        model: ANTHROPIC_MODEL,
        max_tokens: 8000,
        thinking: { type: 'enabled', budget_tokens: 4000 },
        tools: [{
          type: 'web_search_20250305' as const,
          name: 'web_search',
          max_uses: 5,
        }],
        messages: [
          {
            role: 'user',
            content: getWritePostPrompt(),
          },
        ],
      });

      const sourceUrls = extractSourceUrls(response.content);
      console.log(`  Web search found ${sourceUrls.length} source URL(s)`);

      // With extended thinking + web search, response has multiple content blocks.
      // Collect all text blocks and try to extract JSON from each (last to first).
      const textBlocks = response.content.filter(
        (block): block is Anthropic.TextBlock => block.type === 'text'
      );
      if (textBlocks.length === 0) {
        throw new Error('No text content in Claude response');
      }

      let parsed: unknown;
      let parseSuccess = false;
      for (let i = textBlocks.length - 1; i >= 0 && !parseSuccess; i--) {
        const jsonStr = extractJsonObject(textBlocks[i].text);
        if (!jsonStr.startsWith('{')) continue;
        try {
          parsed = JSON.parse(jsonStr);
          parseSuccess = true;
        } catch {
          try {
            const repaired = jsonrepair(jsonStr);
            parsed = JSON.parse(repaired);
            parseSuccess = true;
          } catch {
            // Try the next text block
          }
        }
      }

      if (!parseSuccess || !isValidBlogPostEnglish(parsed)) {
        const debugText = textBlocks.map(b => b.text).join('\n---\n');
        writeFileSync('debug-write-response.txt', debugText);
        throw new Error('Claude response missing required fields');
      }

      return { post: parsed, sourceUrls };
    }, 'writeEnglishPost');
  } catch (error) {
    console.warn('Full structured write failed, trying minimal schema...', (error as Error).message);

    // Fallback: ask for just title/excerpt/content with web search for research
    return await withRetry(async () => {
      const response = await anthropic.messages.create({
        model: ANTHROPIC_MODEL,
        max_tokens: 8000,
        tools: [{
          type: 'web_search_20250305' as const,
          name: 'web_search',
          max_uses: 3,
        }],
        messages: [
          {
            role: 'user',
            content: `Search the web for today's most significant tech news, then write a blog post about it. Return ONLY a JSON object with exactly three fields: "title", "excerpt", "content". Use \\n for newlines in content. No other fields, no markdown fencing.`,
          },
        ],
      });

      const sourceUrls = extractSourceUrls(response.content);
      const textBlocks = response.content.filter(
        (block): block is Anthropic.TextBlock => block.type === 'text'
      );
      const lastText = textBlocks[textBlocks.length - 1];
      if (!lastText) {
        throw new Error('No text content in minimal fallback response');
      }

      const jsonStr = extractJsonObject(lastText.text);
      let minimal: { title: string; excerpt: string; content: string };
      try {
        minimal = JSON.parse(jsonStr);
      } catch {
        const repaired = jsonrepair(jsonStr);
        minimal = JSON.parse(repaired);
      }

      console.log('Built post from minimal fallback');
      return { post: buildMinimalPost(minimal.title, minimal.excerpt, minimal.content), sourceUrls };
    }, 'writeEnglishPost-fallback');
  }
}

async function humanizeEnglishPost(
  englishContent: BlogPostTranslation
): Promise<BlogPostTranslation> {
  console.log('Step 4: Humanizing English content with Claude...');

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

const translationTool = {
  name: 'save_translation' as const,
  description: 'Save the translated blog post content',
  input_schema: {
    type: 'object' as const,
    properties: {
      title: { type: 'string' as const, description: 'Translated title' },
      excerpt: { type: 'string' as const, description: 'Translated excerpt/summary' },
      content: { type: 'string' as const, description: 'Translated markdown content' },
      meta_title: { type: 'string' as const, description: 'SEO title, max 60 characters' },
      meta_description: { type: 'string' as const, description: 'SEO description, max 155 characters' },
      slug: { type: 'string' as const, description: 'URL-friendly slug in target language' },
    },
    required: ['title', 'excerpt', 'content', 'meta_title', 'meta_description', 'slug'],
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
    tools: [translationTool],
    tool_choice: { type: 'tool', name: 'save_translation' },
    messages: [
      {
        role: 'user',
        content: `Translate this blog post to ${localeConfig.name}. Use the save_translation tool to return the result.

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

## Source Content
${JSON.stringify(englishContent, null, 2)}`,
      },
    ],
  });

  const toolUse = response.content.find((block) => block.type === 'tool_use');
  if (!toolUse || toolUse.type !== 'tool_use') {
    throw new Error(`No tool use in translation response for ${locale}`);
  }

  return toolUse.input as BlogPostTranslation;
}

async function translateAll(
  englishContent: BlogPostTranslation
): Promise<Record<string, BlogPostTranslation>> {
  console.log('Step 5: Translating to other languages...');

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
      console.warn(`  Translation failed for a locale, skipping: ${result.reason}`);
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

async function storeImage(imageUrl: string, slug: string): Promise<string | null> {
  try {
    const response = await fetch(imageUrl);
    if (!response.ok) return null;
    const buffer = Buffer.from(await response.arrayBuffer());
    const contentType = response.headers.get('content-type') || 'image/jpeg';

    // Determine extension from content-type or URL
    const extMap: Record<string, string> = {
      'image/jpeg': '.jpg',
      'image/png': '.png',
      'image/webp': '.webp',
      'image/gif': '.gif',
    };
    const ext = extMap[contentType] || extname(new URL(imageUrl).pathname) || '.jpg';
    const filename = `${slug}${ext}`;

    if (process.env.GITHUB_ACTIONS) {
      // Production: upload to R2 via S3-compatible API
      const { S3Client, PutObjectCommand } = await import('@aws-sdk/client-s3');
      const s3 = new S3Client({
        region: 'auto',
        endpoint: `https://${process.env.R2_ACCOUNT_ID}.r2.cloudflarestorage.com`,
        credentials: {
          accessKeyId: process.env.R2_ACCESS_KEY_ID!,
          secretAccessKey: process.env.R2_SECRET_ACCESS_KEY!,
        },
      });
      await s3.send(new PutObjectCommand({
        Bucket: 'itguys-blog-images',
        Key: `blog/${filename}`,
        Body: buffer,
        ContentType: contentType,
      }));
      const publicUrl = `${process.env.R2_PUBLIC_URL}/blog/${filename}`;
      console.log(`Uploaded image to R2: ${publicUrl}`);
      return publicUrl;
    } else {
      // Local: upload via admin API to local R2 emulator
      const localApiUrl = process.env.LOCAL_API_URL || 'http://localhost:8787';
      const blob = new Blob([buffer], { type: contentType });
      const form = new FormData();
      form.append('file', blob, filename);
      form.append('key', `blog/${filename}`);

      const uploadRes = await fetch(`${localApiUrl}/api/images/blog/upload`, {
        method: 'PUT',
        body: buffer,
        headers: {
          'Content-Type': contentType,
          'X-Image-Key': `blog/${filename}`,
        },
      });

      if (!uploadRes.ok) {
        console.warn(`Local R2 upload failed: ${uploadRes.status}`);
        return null;
      }

      const localPath = `/api/images/blog/${filename}`;
      console.log(`Stored image in local R2: ${localPath}`);
      return localPath;
    }
  } catch (err) {
    console.warn(`Failed to store image: ${(err as Error).message}`);
    return null;
  }
}

async function validateAndFixBlogPost(post: BlogPost): Promise<BlogPost> {
  console.log('Step 6: Validating and fixing blog post...');
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
    // Skip validation for local paths (stored on disk during local dev)
    if (!post.image_path.startsWith('/')) {
      const valid = await validateImageUrl(post.image_path);
      if (!valid) {
        warnings.push(`Invalid image URL, setting to null: ${post.image_path}`);
        post.image_path = null;
      }
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
  // Step 1: Research news + write blog post (Claude with web search)
  const { post: englishPost, sourceUrls } = await writeEnglishPost();
  console.log(`Generated post: ${englishPost.slug} (${sourceUrls.length} sources)`);

  // Step 2: Extract featured image from source URLs
  console.log('Step 2: Extracting featured image from sources...');
  const allCandidates = await extractImageCandidates(sourceUrls);
  console.log(`  Found ${allCandidates.length} OG image candidate(s) from ${sourceUrls.length} sources`);
  const articleTopic = englishPost.translations.en.title;
  const scoredCandidates = await scoreAndFilterCandidates(allCandidates, articleTopic);
  let featuredImage = pickBestImage(scoredCandidates);
  if (!featuredImage) {
    console.log('  All candidates rejected or none found, trying targeted search...');
    const fallbackCandidates = await searchFallbackImage(articleTopic);
    if (fallbackCandidates.length > 0) {
      const scored = await scoreAndFilterCandidates(fallbackCandidates, articleTopic);
      featuredImage = pickBestImage(scored);
      allCandidates.push(...fallbackCandidates);
    }
  }
  if (featuredImage) {
    console.log(`Found featured image: ${featuredImage}`);
  } else {
    console.log('No featured image found');
  }

  // Step 3: Store all candidate images locally/R2
  // Reorder candidates so scored ones come first (by score), for correct sort_order in DB
  const scoredUrls = new Set(scoredCandidates.map(c => c.imageUrl));
  const orderedCandidates = [
    ...scoredCandidates,
    ...allCandidates.filter(c => !scoredUrls.has(c.imageUrl)),
  ];

  console.log(`Storing ${orderedCandidates.length} candidate image(s)...`);
  const storedUrlMap = new Map<ImageCandidate, string>();
  for (let i = 0; i < orderedCandidates.length; i++) {
    const candidate = orderedCandidates[i];
    const originalUrl = candidate.imageUrl;
    const storedUrl = await storeImage(originalUrl, `${englishPost.slug}-${i}`);
    if (storedUrl) {
      candidate.imageUrl = storedUrl;
      storedUrlMap.set(candidate, storedUrl);
    }
  }

  // Pick the best stored image: first scored candidate that was successfully stored
  const bestStored = scoredCandidates.find(c => storedUrlMap.has(c));
  if (bestStored) {
    englishPost.image_path = storedUrlMap.get(bestStored)!;
    console.log(`  Assigned best image (score-ranked): ${englishPost.image_path}`);
  } else {
    console.log('  No candidate images could be stored');
  }
  console.log(`Post slug: ${englishPost.slug}`);

  // Step 4: Humanize English content (Claude, with fallback to skip)
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

  // Step 5: Translate to other languages (parallel, partial OK)
  const allTranslations = await translateAll(humanized);

  // Step 6: Combine and validate
  let blogPost: BlogPost = {
    ...englishPost,
    translations: allTranslations,
    imageCandidates: orderedCandidates.length > 0 ? orderedCandidates : undefined,
  };

  blogPost = await validateAndFixBlogPost(blogPost);

  writeFileSync('blog-post.json', JSON.stringify(blogPost, null, 2));
  console.log(`Wrote blog-post.json with ${Object.keys(blogPost.translations).length} translations`);

  // Submit to local API if running locally
  const localApiUrl = process.env.LOCAL_API_URL || 'http://localhost:8787';
  await submitToLocalApi(blogPost, localApiUrl);
}

async function submitToLocalApi(post: BlogPost, baseUrl: string): Promise<void> {
  const url = `${baseUrl}/api/admin/posts`;
  console.log(`Step 7: Submitting to ${url}...`);

  try {
    const response = await fetch(url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(post),
    });

    if (!response.ok) {
      const body = await response.text();
      console.error(`API responded ${response.status}: ${body}`);
      return;
    }

    const result = (await response.json()) as { id: number };
    console.log(`Post created with ID: ${result.id}`);
  } catch (error) {
    console.error(`Failed to submit to local API: ${(error as Error).message}`);
    console.log('blog-post.json was still saved. You can submit it manually.');
  }
}

main().catch((error) => {
  console.error('Error:', error);
  process.exit(1);
});
