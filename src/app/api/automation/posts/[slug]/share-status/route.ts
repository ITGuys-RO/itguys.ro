import { NextRequest, NextResponse } from 'next/server';
import { getPostBySlug } from '@/lib/db/posts';
import { upsertSocialShare } from '@/lib/db/social-shares';
import { validateAutomationKey } from '@/lib/automation-auth';
import { checkRateLimit, getClientIp } from '@/lib/rate-limit';

export async function POST(
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

    const body = await request.json();
    const { platform, platform_post_id } = body;

    if (!platform || !['twitter', 'facebook'].includes(platform)) {
      return NextResponse.json({ error: 'Invalid platform' }, { status: 400 });
    }

    await upsertSocialShare(
      post.id,
      platform,
      platform_post_id ?? null,
      'automation'
    );

    return NextResponse.json({ success: true });
  } catch (error) {
    console.error('Share status update failed:', error);
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 });
  }
}
