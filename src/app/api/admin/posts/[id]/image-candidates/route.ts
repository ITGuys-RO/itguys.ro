import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError, parseId } from '@/lib/admin-auth';
import { getPostById, updatePost } from '@/lib/db';
import { getImageCandidates, selectImageCandidate, deleteImageCandidate } from '@/lib/db/image-candidates';

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

export async function DELETE(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;
    const postId = parseId(id);

    const { candidateId } = await request.json();
    if (!candidateId) {
      return NextResponse.json({ error: 'candidateId required' }, { status: 400 });
    }

    const deleted = await deleteImageCandidate(candidateId, postId);
    if (!deleted) {
      return NextResponse.json({ error: 'Candidate not found' }, { status: 404 });
    }

    // Delete image from R2 if it's stored there
    const r2PublicUrl = process.env.R2_PUBLIC_URL;
    const r2Key = r2PublicUrl && deleted.image_url.startsWith(r2PublicUrl)
      ? deleted.image_url.slice(r2PublicUrl.length + 1) // strip prefix + leading slash
      : deleted.image_url.startsWith('/api/images/')
        ? deleted.image_url.slice('/api/images/'.length)
        : null;

    if (r2Key) {
      try {
        const { getCloudflareContext } = await import('@opennextjs/cloudflare');
        const { env } = await getCloudflareContext({ async: true });
        if (env.BLOG_IMAGES) {
          await env.BLOG_IMAGES.delete(r2Key);
        }
      } catch {
        // R2 deletion is best-effort; don't fail the request
      }
    }

    // If deleted candidate was the post's current image, clear it
    if (deleted.is_selected) {
      const post = await getPostById(postId);
      if (post && post.image_path === deleted.image_url) {
        await updatePost(postId, { image_path: null });
      }
    }

    return NextResponse.json({ success: true, wasSelected: deleted.is_selected === 1 });
  } catch (error) {
    return handleApiError(error);
  }
}
