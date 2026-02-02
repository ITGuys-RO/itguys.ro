import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';
import {
  getAllPostsWithTranslations,
  createPost,
} from '@/lib/db';
import { createImageCandidates, type PostImageCandidateInput } from '@/lib/db/image-candidates';
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
    const body = await request.json();
    const { imageCandidates, ...input } = body as PostInput & { imageCandidates?: PostImageCandidateInput[] };

    if (!input.slug || !input.translations) {
      return NextResponse.json({ error: 'Missing required fields' }, { status: 400 });
    }

    const id = await createPost(input);

    if (imageCandidates && imageCandidates.length > 0) {
      await createImageCandidates(id, imageCandidates);
    }

    return NextResponse.json({ id }, { status: 201 });
  } catch (error) {
    return handleApiError(error);
  }
}
