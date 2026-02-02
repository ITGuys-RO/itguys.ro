import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError, parseId } from '@/lib/admin-auth';
import {
  getPostWithTranslations,
  updatePost,
  deletePost,
} from '@/lib/db';
import { submitBlogPostToIndexNow } from '@/lib/indexnow';
import type { PostInput } from '@/lib/db';

type RouteParams = { params: Promise<{ id: string }> };

export async function GET(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;
    const post = await getPostWithTranslations(parseId(id));

    if (!post) {
      return NextResponse.json({ error: 'Not found' }, { status: 404 });
    }

    return NextResponse.json(post);
  } catch (error) {
    return handleApiError(error);
  }
}

export async function PUT(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;
    const input = (await request.json()) as Partial<PostInput>;

    // Get current post to check if publishing status changed
    const currentPost = await getPostWithTranslations(parseId(id));
    const wasUnpublished = currentPost && currentPost.is_published === 0;
    const isNowPublished = input.is_published === 1;

    await updatePost(parseId(id), input);

    // Submit to IndexNow if post is being published for the first time
    if (wasUnpublished && isNowPublished && (input.slug || currentPost?.slug)) {
      const slug = input.slug || currentPost!.slug;
      submitBlogPostToIndexNow(slug).catch((err) => {
        console.error('IndexNow submission failed:', err);
      });
    }

    return NextResponse.json({ success: true });
  } catch (error) {
    return handleApiError(error);
  }
}

export async function DELETE(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;

    await deletePost(parseId(id));
    return NextResponse.json({ success: true });
  } catch (error) {
    return handleApiError(error);
  }
}
