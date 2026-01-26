import { config } from 'dotenv';
config({ path: '.env.local' });
import Anthropic from '@anthropic-ai/sdk';
import { createPerplexity } from '@ai-sdk/perplexity';
import { generateText } from 'ai';
import { readFileSync, writeFileSync, existsSync } from 'fs';
import { jsonrepair } from 'jsonrepair';

const anthropic = new Anthropic();
const perplexity = createPerplexity({
  apiKey: process.env.PERPLEXITY_API_KEY,
});

const ANTHROPIC_MODEL = 'claude-opus-4-5-20251101';
const MAX_RETRIES = 3;
const INITIAL_RETRY_DELAY_MS = 5000;

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
const PERPLEXITY_MODEL = 'sonar-reasoning-pro';

function stripMarkdownFences(text: string): string {
  // Remove ```json ... ``` or ``` ... ``` wrapping
  return text.replace(/^```(?:json)?\s*\n?/i, '').replace(/\n?```\s*$/i, '').trim();
}

function parseJsonSafe(jsonStr: string, context: string): BlogPost {
  try {
    return JSON.parse(jsonStr) as BlogPost;
  } catch (firstError) {
    // Try to repair the JSON using jsonrepair library
    console.log(`JSON parse failed, attempting repair with jsonrepair...`);
    try {
      const repaired = jsonrepair(jsonStr);
      const result = JSON.parse(repaired) as BlogPost;
      console.log(`JSON repair successful`);
      return result;
    } catch (repairError) {
      // Log the problematic JSON for debugging
      console.error(`JSON parse error in ${context}:`);
      console.error(`Error: ${firstError}`);
      console.error(`JSON length: ${jsonStr.length}`);
      console.error(`Last 200 chars: ${jsonStr.slice(-200)}`);
      // Write raw JSON to file for debugging
      writeFileSync('debug-json-output.txt', jsonStr);
      console.error(`Raw JSON written to debug-json-output.txt`);
      throw firstError;
    }
  }
}

function stripThinkingTags(text: string): string {
  // Remove <think>...</think> sections from sonar-reasoning-pro responses
  return text.replace(/<think>[\s\S]*?<\/think>\s*/gi, '').trim();
}

interface BlogPostTranslation {
  title: string;
  excerpt: string;
  content: string;
  meta_title: string;
  meta_description: string;
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

const NEWS_PROMPT = `Generate a comprehensive and structured news report focused on today's tech news across web development, mobile development, security, AI/ML, and DevOps/cloud areas. For each area, provide 2-3 significant news items with brief explanations of why they matter.

## Important: Connect to ITGuys Services
For each news item, add a "How ITGuys helps" section explaining how our services relate to this news. Be specific and practical, not salesy.

### About ITGuys
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

### Connection examples:
- Security vulnerability news → "ITGuys helps teams identify these issues before attackers do through pen testing and security reviews"
- Framework/library updates → "ITGuys helps teams plan and execute migrations safely"
- Cloud/infrastructure news → "ITGuys builds and secures cloud infrastructure on AWS"
- Mobile platform changes → "ITGuys develops native iOS/Android apps that stay current with platform requirements"
- Compliance/regulation → "ITGuys works with Swiss enterprise clients on compliance-ready systems"

Focus on actionable insights and practical implications for developers and tech teams.`;

const BRAND_VOICE_PROMPT = `
## ITGuys Brand Voice
- Direct and honest - no fluff, no buzzwords
- Security-first perspective - weave security implications into the narrative
- Pragmatic - focus on practical implications for developers and teams
- Professionally casual tone - "Let's Talk" not "Contact Us"
- Experience-driven - reference real-world scenarios
`;

const BLOG_POST_PROMPT = `
You are generating a blog post for ITGuys from a news report that already includes "How ITGuys helps" sections.

${BRAND_VOICE_PROMPT}

## Content Requirements
1. Transform the news report into an engaging, well-structured blog post
2. Keep the ITGuys service connections from the source - weave them naturally into the narrative
3. Don't sound salesy - the connections should feel like helpful context, not a pitch
4. End with a soft CTA like "If [specific challenge from the news] sounds familiar, let's talk"

## Output Format
Output a single valid JSON object (no markdown fencing) matching this exact structure.

CRITICAL JSON RULES:
- All strings must use double quotes
- Escape special characters: use \\n for newlines, \\" for quotes inside strings
- No trailing commas
- No comments

{
  "slug": "YYYY-MM-DD-tech-news-roundup",
  "image_path": null,
  "author_id": null,
  "published_at": "ISO8601 timestamp",
  "is_published": 1,
  "tags": ["tech-news", "daily-roundup", ...relevant tags],
  "translations": {
    "en": {
      "title": "...",
      "excerpt": "2-3 sentence summary",
      "content": "Full markdown content",
      "meta_title": "Max 60 chars for SEO",
      "meta_description": "Max 155 chars for SEO"
    },
    "ro": { ...Romanian translation... },
    "fr": { ...French translation... },
    "de": { ...German translation... },
    "it": { ...Italian translation... },
    "es": { ...Spanish translation... }
  }
}

Use today's date for the slug and published_at.

## News Report to Transform:
`;

async function fetchTechNews(): Promise<string> {
  console.log('Fetching tech news from Perplexity...');

  return withRetry(async () => {
    const { text } = await generateText({
      model: perplexity(PERPLEXITY_MODEL),
      prompt: NEWS_PROMPT,
    });

    // Strip thinking tags from sonar-reasoning-pro response
    const newsContent = stripThinkingTags(text);
    console.log(`Fetched news content (${newsContent.length} chars)`);
    return newsContent;
  }, 'fetchTechNews');
}

async function generateBlogPost(newsContent: string): Promise<BlogPost> {
  console.log('Generating blog post from news content...');

  return withRetry(async () => {
    const stream = anthropic.messages.stream({
      model: ANTHROPIC_MODEL,
      max_tokens: 32000,
      messages: [
        {
          role: 'user',
          content: BLOG_POST_PROMPT + newsContent,
        },
        {
          role: 'assistant',
          content: '{',
        },
      ],
    });

    const response = await stream.finalMessage();

    if (response.stop_reason !== 'end_turn') {
      console.error(`Warning: Response stopped due to ${response.stop_reason}`);
    }

    const textContent = response.content.find((block) => block.type === 'text');
    if (!textContent || textContent.type !== 'text') {
      throw new Error('No text content in response');
    }

    // Parse the JSON response (prepend the '{' we used as prefill)
    const jsonStr = '{' + stripMarkdownFences(textContent.text);
    return parseJsonSafe(jsonStr, 'generateBlogPost');
  }, 'generateBlogPost');
}

async function humanizeBlogPost(
  blogPost: BlogPost,
  humanizerRules: string
): Promise<BlogPost> {
  console.log('Applying humanizer patterns to blog post...');

  const humanizePrompt = `Apply humanization patterns to remove AI writing artifacts from this blog post.

Rules summary: Remove AI vocabulary (additionally, crucial, delve, landscape, tapestry, testament, underscore, etc.), remove -ing phrase padding, remove em dash overuse, remove rule-of-three patterns, remove "Not only...but also" constructions, use simple "is/are" instead of "serves as/stands as", vary sentence rhythm, add personality.

Process all 6 locale translations. For each, humanize: title, excerpt, content, meta_description.
Do NOT change: slug, image_path, author_id, published_at, is_published, tags, meta_title.

IMPORTANT: Output ONLY valid JSON. No explanation, no preamble, no markdown fencing.
JSON RULES: Use double quotes, escape \\n for newlines and \\" for quotes in strings, no trailing commas.

${JSON.stringify(blogPost, null, 2)}`;

  return withRetry(async () => {
    const stream = anthropic.messages.stream({
      model: ANTHROPIC_MODEL,
      max_tokens: 32000,
      messages: [
        {
          role: 'user',
          content: humanizePrompt,
        },
        {
          role: 'assistant',
          content: '{',
        },
      ],
    });

    const response = await stream.finalMessage();

    if (response.stop_reason !== 'end_turn') {
      console.error(`Warning: Response stopped due to ${response.stop_reason}`);
    }

    const textContent = response.content.find((block) => block.type === 'text');
    if (!textContent || textContent.type !== 'text') {
      throw new Error('No text content in response');
    }

    // Parse the JSON response (prepend the '{' we used as prefill)
    const jsonStr = '{' + stripMarkdownFences(textContent.text);
    return parseJsonSafe(jsonStr, 'humanizeBlogPost');
  }, 'humanizeBlogPost');
}

async function main() {
  // 1. Fetch news from Perplexity
  const newsContent = await fetchTechNews();

  // 2. Generate blog post with brand voice
  const blogPost = await generateBlogPost(newsContent);
  console.log(`Generated blog post with slug: ${blogPost.slug}`);

  // 3. Read humanizer skill
  const humanizerPath = 'vendor/humanizer/SKILL.md';
  if (!existsSync(humanizerPath)) {
    throw new Error(`Humanizer skill not found: ${humanizerPath}`);
  }
  const humanizerRules = readFileSync(humanizerPath, 'utf-8');
  console.log(`Read humanizer rules (${humanizerRules.length} chars)`);

  // 4. Apply humanization
  const humanizedPost = await humanizeBlogPost(blogPost, humanizerRules);
  console.log('Humanization complete');

  // 5. Write blog-post.json
  writeFileSync('blog-post.json', JSON.stringify(humanizedPost, null, 2));
  console.log('Wrote blog-post.json');
}

main().catch((error) => {
  console.error('Error:', error);
  process.exit(1);
});
