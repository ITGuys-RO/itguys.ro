import Anthropic from '@anthropic-ai/sdk';
import { readFileSync, writeFileSync, existsSync } from 'fs';

const client = new Anthropic();
const MODEL = 'claude-opus-4-5-20251101';

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

async function generateBlogPost(newsContent: string): Promise<BlogPost> {
  console.log('Generating blog post from news content...');

  const response = await client.messages.create({
    model: MODEL,
    max_tokens: 16000,
    messages: [
      {
        role: 'user',
        content: BLOG_POST_PROMPT + newsContent,
      },
    ],
  });

  const textContent = response.content.find((block) => block.type === 'text');
  if (!textContent || textContent.type !== 'text') {
    throw new Error('No text content in response');
  }

  // Parse the JSON response
  const jsonStr = textContent.text.trim();
  return JSON.parse(jsonStr) as BlogPost;
}

async function humanizeBlogPost(
  blogPost: BlogPost,
  humanizerRules: string
): Promise<BlogPost> {
  console.log('Applying humanizer patterns to blog post...');

  const humanizePrompt = `
You are an expert editor applying humanization patterns to remove AI writing artifacts.

## Humanizer Rules
${humanizerRules}

## Task
Apply ALL humanizer patterns to the blog post content below. Process all 6 locale translations (en, ro, fr, de, it, es).

For each translation, humanize:
- title
- excerpt
- content
- meta_description

Do NOT change: slug, image_path, author_id, published_at, is_published, tags, or meta_title.

Output the humanized blog post as a JSON object with the exact same structure.

## Blog Post to Humanize:
${JSON.stringify(blogPost, null, 2)}
`;

  const response = await client.messages.create({
    model: MODEL,
    max_tokens: 16000,
    messages: [
      {
        role: 'user',
        content: humanizePrompt,
      },
    ],
  });

  const textContent = response.content.find((block) => block.type === 'text');
  if (!textContent || textContent.type !== 'text') {
    throw new Error('No text content in response');
  }

  // Parse the JSON response
  const jsonStr = textContent.text.trim();
  return JSON.parse(jsonStr) as BlogPost;
}

async function main() {
  // 1. Read news from perplexity-news.md
  const newsPath = 'perplexity-news.md';
  if (!existsSync(newsPath)) {
    throw new Error(`News file not found: ${newsPath}`);
  }
  const newsContent = readFileSync(newsPath, 'utf-8');
  console.log(`Read news content (${newsContent.length} chars)`);

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
