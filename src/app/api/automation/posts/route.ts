import { NextRequest, NextResponse } from 'next/server';
import { createPost, getPostBySlug, updatePost, getPostById } from '@/lib/db/posts';
import { createImageCandidates, getImageCandidates, selectImageCandidate, type PostImageCandidateInput } from '@/lib/db/image-candidates';
import { PostInput } from '@/lib/db/schema';
import { validateAutomationKey } from '@/lib/automation-auth';
import { checkRateLimit, getClientIp } from '@/lib/rate-limit';

export async function POST(request: NextRequest) {
  const clientIp = getClientIp(request);
  const rateLimit = checkRateLimit(clientIp, { maxRequests: 60, windowMs: 60_000 });
  if (!rateLimit.allowed) {
    return NextResponse.json({ error: 'Rate limit exceeded' }, { status: 429 });
  }

  if (!(await validateAutomationKey(request))) {
    return NextResponse.json(
      { error: 'Unauthorized' },
      { status: 401 }
    );
  }

  try {
    const body = await request.json();
    const { imageCandidates, ...input } = body as PostInput & { imageCandidates?: PostImageCandidateInput[] };

    // Check if post with this slug already exists
    const existingPost = await getPostBySlug(input.slug);

    let postId: number;
    let action: 'created' | 'updated';

    if (existingPost) {
      // Update existing post
      await updatePost(existingPost.id, input);
      postId = existingPost.id;
      action = 'updated';
    } else {
      // Create new post
      postId = await createPost(input);
      action = 'created';
    }

    // Store image candidates if provided
    if (imageCandidates && imageCandidates.length > 0) {
      await createImageCandidates(postId, imageCandidates);

      // Auto-select the first candidate (highest score) if image_path is empty
      const post = await getPostById(postId);
      if (post && !post.image_path) {
        const candidates = await getImageCandidates(postId);
        if (candidates.length > 0) {
          const best = candidates[0]; // sorted by sort_order ASC = highest score first
          await selectImageCandidate(postId, best.id);
          await updatePost(postId, { image_path: best.image_url });
          console.log(`Auto-selected best image candidate (id=${best.id}) for post ${postId}`);
        }
      }
    }

    return NextResponse.json({ id: postId, success: true, action });
  } catch (error) {
    console.error('Automation post creation failed:', error);
    return NextResponse.json(
      { error: 'Failed to create post' },
      { status: 500 }
    );
  }
}
