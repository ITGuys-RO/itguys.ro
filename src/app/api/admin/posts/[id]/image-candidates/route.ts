import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError, parseId } from '@/lib/admin-auth';
import { getPostById, updatePost } from '@/lib/db';
import { getImageCandidates, selectImageCandidate } from '@/lib/db/image-candidates';

type RouteParams = { params: Promise<{ id: string }> };

export async function GET(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;
    const postId = parseId(id);

    const candidates = await getImageCandidates(postId);
    return NextResponse.json(candidates);
  } catch (error) {
    return handleApiError(error);
  }
}

export async function POST(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;
    const postId = parseId(id);

    const post = await getPostById(postId);
    if (!post) {
      return NextResponse.json({ error: 'Post not found' }, { status: 404 });
    }

    const { candidateId } = await request.json();
    if (!candidateId) {
      return NextResponse.json({ error: 'candidateId required' }, { status: 400 });
    }

    // Mark candidate as selected
    await selectImageCandidate(postId, candidateId);

    // Get the candidate's image_url and update the post
    const candidates = await getImageCandidates(postId);
    const selected = candidates.find(c => c.id === candidateId);

    if (!selected) {
      return NextResponse.json({ error: 'Candidate not found' }, { status: 404 });
    }

    await updatePost(postId, { image_path: selected.image_url });

    return NextResponse.json({ success: true, image_path: selected.image_url });
  } catch (error) {
    return handleApiError(error);
  }
}
