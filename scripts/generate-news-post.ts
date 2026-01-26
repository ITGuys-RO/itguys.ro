import Anthropic from '@anthropic-ai/sdk';
import { createPerplexity } from '@ai-sdk/perplexity';
import { generateText } from 'ai';
import { readFileSync, writeFileSync, existsSync } from 'fs';

const anthropic = new Anthropic();
const perplexity = createPerplexity({
  apiKey: process.env.PERPLEXITY_API_KEY,
});

const ANTHROPIC_MODEL = 'claude-opus-4-5-20251101';
const PERPLEXITY_MODEL = 'sonar-reasoning-pro';

function stripMarkdownFences(text: string): string {
  // Remove ```json ... ``` or ``` ... ``` wrapping
  return text.replace(/^```(?:json)?\s*\n?/i, '').replace(/\n?```\s*$/i, '').trim();
}

function parseJsonSafe(jsonStr: string, context: string): BlogPost {
  try {
    return JSON.parse(jsonStr) as BlogPost;
  } catch (error) {
    // Log the problematic JSON for debugging
    console.error(`JSON parse error in ${context}:`);
    console.error(`Error: ${error}`);
    console.error(`JSON length: ${jsonStr.length}`);
    console.error(`Last 200 chars: ${jsonStr.slice(-200)}`);
    throw error;
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

const NEWS_PROMPT = `Generate a comprehensive and structured news report focused on today's tech news across web development, mobile development, security, AI/ML, and DevOps/cloud areas. For each area, provide 2-3 significant news items with brief explanations of why they matter. Focus on actionable insights and practical implications for developers and tech teams.`;

const BRAND_VOICE_PROMPT = `
## ITGuys Brand Voice
- Direct and honest - no fluff, no buzzwords
- Security-first perspective - weave security implications into the narrative
- Pragmatic - focus on practical implications for developers and teams
- Professionally casual tone - "Let's Talk" not "Contact Us"
- Experience-driven - reference real-world scenarios
`;

const BLOG_POST_PROMPT = `
You are generating a blog post for ITGuys, a tech consultancy focused on web development, security, and DevOps.

${BRAND_VOICE_PROMPT}

## Content Requirements
1. Transform the news report into an engaging daily tech roundup
2. Add ITGuys perspective on security implications where relevant
3. Include practical takeaways for readers

## Output Format
Output a single JSON object (no markdown fencing) matching this exact structure:

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

  const { text } = await generateText({
    model: perplexity(PERPLEXITY_MODEL),
    prompt: NEWS_PROMPT,
  });

  // Strip thinking tags from sonar-reasoning-pro response
  const newsContent = stripThinkingTags(text);
  console.log(`Fetched news content (${newsContent.length} chars)`);
  return newsContent;
}

async function generateBlogPost(newsContent: string): Promise<BlogPost> {
  console.log('Generating blog post from news content...');

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

IMPORTANT: Output ONLY the JSON object. No explanation, no preamble, no markdown fencing.

${JSON.stringify(blogPost, null, 2)}`;

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
