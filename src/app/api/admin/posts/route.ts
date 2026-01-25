import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';
import {
  getAllPostsWithTranslations,
  createPost,
} from '@/lib/db';
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
    return NextResponse.json({ id }, { status: 201 });
  } catch (error) {
    return handleApiError(error);
  }
}
