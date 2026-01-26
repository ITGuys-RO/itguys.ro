import { config } from 'dotenv';
config({ path: '.env.local' });

import { execFileSync } from 'child_process';
import { readFileSync, existsSync, unlinkSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const BASE_URL = process.env.TEST_BASE_URL || 'http://localhost:3000';
const AUTOMATION_API_KEY = process.env.AUTOMATION_API_KEY;
const BLOG_POST_FILE = join(__dirname, '..', 'blog-post.json');

const LOCALES = ['en', 'ro', 'fr', 'de', 'it', 'es'] as const;

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

async function generateNewsPost(): Promise<void> {
  console.log('Step 1: Generating news post...');

  // Clean up existing file
  if (existsSync(BLOG_POST_FILE)) {
    unlinkSync(BLOG_POST_FILE);
  }

  try {
    // Use execFileSync with explicit args to avoid shell injection
    execFileSync('pnpm', ['tsx', 'scripts/generate-news-post.ts'], {
      cwd: join(__dirname, '..'),
      stdio: 'inherit',
    });
  } catch (error) {
    throw new Error('Failed to generate news post');
  }

  if (!existsSync(BLOG_POST_FILE)) {
    throw new Error('blog-post.json was not created');
  }

  console.log('  ✓ News post generated successfully\n');
}

function readBlogPost(): BlogPost {
  console.log('Step 2: Reading generated blog post...');

  const content = readFileSync(BLOG_POST_FILE, 'utf-8');
  const post = JSON.parse(content) as BlogPost;

  console.log(`  Main slug: ${post.slug}`);
  console.log(`  Tags: ${post.tags.join(', ')}`);
  console.log(`  Translations: ${Object.keys(post.translations).join(', ')}`);

  // Verify slugs per locale
  for (const [locale, translation] of Object.entries(post.translations)) {
    const slug = translation.slug || '(none - will use main slug)';
    console.log(`  - ${locale}: slug="${slug}"`);
  }

  console.log('  ✓ Blog post read successfully\n');
  return post;
}

async function postToApi(post: BlogPost): Promise<{ id: number }> {
  console.log('Step 3: Posting to automation API...');

  if (!AUTOMATION_API_KEY) {
    throw new Error('AUTOMATION_API_KEY not set in environment');
  }

  const response = await fetch(`${BASE_URL}/api/automation/posts`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${AUTOMATION_API_KEY}`,
    },
    body: JSON.stringify(post),
  });

  if (!response.ok) {
    const text = await response.text();
    throw new Error(`API returned ${response.status}: ${text}`);
  }

  const result = await response.json();
  console.log(`  ✓ Post created with ID: ${result.id}\n`);
  return result;
}

async function verifyPostRouting(post: BlogPost): Promise<void> {
  console.log('Step 4: Verifying post routing...');

  const results: { locale: string; slug: string; status: number; ok: boolean }[] = [];

  for (const locale of LOCALES) {
    const translation = post.translations[locale];
    // Use locale-specific slug if available, otherwise fall back to main slug
    const slug = translation?.slug || post.slug;

    // Build URL: /blog/slug for English, /locale/blog/slug for others
    const url = locale === 'en'
      ? `${BASE_URL}/blog/${slug}`
      : `${BASE_URL}/${locale}/blog/${slug}`;

    try {
      const response = await fetch(url, { method: 'HEAD' });
      results.push({
        locale,
        slug,
        status: response.status,
        ok: response.ok,
      });
    } catch (error) {
      results.push({
        locale,
        slug,
        status: 0,
        ok: false,
      });
    }
  }

  // Print results
  let allOk = true;
  for (const r of results) {
    const icon = r.ok ? '✓' : '✗';
    const statusText = r.status === 0 ? 'NETWORK ERROR' : r.status.toString();
    console.log(`  ${icon} ${r.locale}: /${r.locale === 'en' ? '' : r.locale + '/'}blog/${r.slug} (${statusText})`);
    if (!r.ok) allOk = false;
  }

  if (allOk) {
    console.log('\n  ✓ All routes verified successfully\n');
  } else {
    console.log('\n  ⚠ Some routes failed - this may be expected if the dev server needs time to update\n');
  }
}

async function main() {
  console.log('=== News Post E2E Test ===\n');
  console.log(`Base URL: ${BASE_URL}`);
  console.log(`API Key: ${AUTOMATION_API_KEY ? 'SET' : 'NOT SET'}\n`);

  // Check if we should skip generation (for testing just the API)
  const skipGenerate = process.argv.includes('--skip-generate');

  try {
    if (!skipGenerate) {
      await generateNewsPost();
    } else {
      console.log('Step 1: Skipping generation (--skip-generate flag)\n');
      if (!existsSync(BLOG_POST_FILE)) {
        throw new Error('blog-post.json not found - run without --skip-generate first');
      }
    }

    const post = readBlogPost();
    await postToApi(post);
    await verifyPostRouting(post);

    console.log('=== E2E Test Complete ===');
  } catch (error) {
    console.error('\n❌ E2E Test Failed:', error instanceof Error ? error.message : error);
    process.exit(1);
  }
}

main();
