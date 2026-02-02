import { NextRequest, NextResponse } from 'next/server';
import { getPostBySlug, getPostTranslations, getPostTags } from '@/lib/db/posts';
import type { PostInput } from '@/lib/db/schema';

function validateApiKey(request: NextRequest): boolean {
  const authHeader = request.headers.get('Authorization');
  if (!authHeader?.startsWith('Bearer ')) return false;
  return authHeader.slice(7) === process.env.AUTOMATION_API_KEY;
}

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> }
) {
  if (!validateApiKey(request)) {
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
