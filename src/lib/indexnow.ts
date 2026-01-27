import { execute } from './db/client';

const BASE_URL = 'https://itguys.ro';
const INDEXNOW_API = 'https://api.indexnow.org/IndexNow';

/**
 * Submit a URL to IndexNow for immediate indexing.
 * Only works in production (when INDEXNOW_KEY is set).
 * Stores submitted URLs in D1 to track what's been submitted.
 */
export async function submitToIndexNow(path: string): Promise<{ success: boolean; message: string }> {
  // Get the IndexNow key from Cloudflare environment
  const { getCloudflareContext } = await import('@opennextjs/cloudflare');
  const { env } = await getCloudflareContext({ async: true });

  const indexNowKey = env.INDEXNOW_KEY;

  // Skip if no key (development environment)
  if (!indexNowKey) {
    return { success: false, message: 'IndexNow key not configured (development mode)' };
  }

  const url = `${BASE_URL}${path}`;

  try {
    // Submit to IndexNow API
    const response = await fetch(INDEXNOW_API, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: JSON.stringify({
        host: 'itguys.ro',
        key: indexNowKey,
        keyLocation: `${BASE_URL}/${indexNowKey}.txt`,
        urlList: [url],
      }),
    });

    if (response.status === 200 || response.status === 202) {
      // Store in D1 to track submission
      await execute(
        'INSERT OR IGNORE INTO indexnow_submitted (url) VALUES (?)',
        [url]
      );

      return { success: true, message: `Submitted ${url} to IndexNow` };
    }

    return {
      success: false,
      message: `IndexNow returned status ${response.status}`
    };
  } catch (error) {
    console.error('IndexNow submission error:', error);
    return {
      success: false,
      message: error instanceof Error ? error.message : 'Unknown error'
    };
  }
}

/**
 * Submit a blog post URL to IndexNow.
 * Only submits URLs for locales that have actual translations,
 * using the correct locale-specific slug for each.
 */
export async function submitBlogPostToIndexNow(slug: string): Promise<void> {
  const { getPostBySlug, getPostTranslations, getPostLocaleSlugs } = await import('./db/posts');

  const post = await getPostBySlug(slug);
  if (!post) {
    console.error(`IndexNow: Post with slug "${slug}" not found`);
    return;
  }

  const translations = await getPostTranslations(post.id);
  const localeSlugs = await getPostLocaleSlugs(post.id);

  // Get locales that have translations
  const localesWithTranslations = translations.map(t => t.locale);

  for (const locale of localesWithTranslations) {
    const localeSlug = localeSlugs[locale] || slug;
    const path = locale === 'en' ? `/blog/${localeSlug}` : `/${locale}/blog/${localeSlug}`;
    const result = await submitToIndexNow(path);

    if (result.success) {
      console.log(result.message);
    }
  }
}
