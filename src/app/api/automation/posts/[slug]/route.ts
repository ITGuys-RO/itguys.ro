import { NextRequest, NextResponse } from 'next/server';
import { getPostBySlug, getPostTranslations, getPostTags } from '@/lib/db/posts';
import type { PostInput } from '@/lib/db/schema';
import { validateAutomationKey } from '@/lib/automation-auth';
import { checkRateLimit, getClientIp } from '@/lib/rate-limit';

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> }
) {
  const clientIp = getClientIp(request);
  const rateLimit = checkRateLimit(clientIp, { maxRequests: 60, windowMs: 60_000 });
  if (!rateLimit.allowed) {
    return NextResponse.json({ error: 'Rate limit exceeded' }, { status: 429 });
  }

  if (!(await validateAutomationKey(request))) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  try {
    const { slug } = await params;
    const post = await getPostBySlug(slug);
    if (!post) {
      return NextResponse.json({ error: 'Post not found' }, { status: 404 });
    }

    const [translations, tags] = await Promise.all([
      getPostTranslations(post.id),
      getPostTags(post.id),
    ]);

    // Return in the same shape as blog-post.json
    const translationsMap: Record<string, Omit<PostInput['translations']['en'], 'slug'> & { slug?: string | null }> = {};
    for (const t of translations) {
      translationsMap[t.locale] = {
        title: t.title,
        excerpt: t.excerpt,
        content: t.content,
        meta_title: t.meta_title,
        meta_description: t.meta_description,
        slug: t.slug,
      };
    }

    return NextResponse.json({
      slug: post.slug,
      image_path: post.image_path,
      author_id: post.author_id,
      published_at: post.published_at,
      is_published: post.is_published,
      tags,
      translations: translationsMap,
    });
  } catch (error) {
    const message = error instanceof Error ? error.message : 'Unknown error';
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
