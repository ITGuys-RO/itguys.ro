import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';
import {
  getPostWithTranslations,
  updatePost,
  deletePost,
} from '@/lib/db';
import type { PostInput } from '@/lib/db';

export const runtime = 'edge';

type RouteParams = { params: Promise<{ id: string }> };

export async function GET(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;
    const post = await getPostWithTranslations(parseInt(id, 10));

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

    await updatePost(parseInt(id, 10), input);
    return NextResponse.json({ success: true });
  } catch (error) {
    return handleApiError(error);
  }
}

export async function DELETE(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;

    await deletePost(parseInt(id, 10));
    return NextResponse.json({ success: true });
  } catch (error) {
    return handleApiError(error);
  }
}
