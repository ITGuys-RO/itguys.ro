import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';
import {
  getAllPostsWithTranslations,
  createPost,
} from '@/lib/db';
import { submitBlogPostToIndexNow } from '@/lib/indexnow';
import type { PostInput } from '@/lib/db';

export async function GET(request: NextRequest) {
  try {
    requireAdmin(request);
    const posts = await getAllPostsWithTranslations();
    return NextResponse.json(posts);
  } catch (error) {
    return handleApiError(error);
  }
}

export async function POST(request: NextRequest) {
  try {
    requireAdmin(request);
    const input = (await request.json()) as PostInput;

    if (!input.slug || !input.translations) {
      return NextResponse.json({ error: 'Missing required fields' }, { status: 400 });
    }

    const id = await createPost(input);

    // Submit to IndexNow if post is published (fire and forget)
    if (input.is_published === 1) {
      submitBlogPostToIndexNow(input.slug).catch((err) => {
        console.error('IndexNow submission failed:', err);
      });
    }

    return NextResponse.json({ id }, { status: 201 });
  } catch (error) {
    return handleApiError(error);
  }
}
