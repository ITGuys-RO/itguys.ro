import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';
import { getPostById } from '@/lib/db/posts';

export async function POST(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    requireAdmin(request);
    const { id } = await params;
    const post = await getPostById(Number(id));
    if (!post) {
      return NextResponse.json({ error: 'Post not found' }, { status: 404 });
    }

    const { platform } = await request.json();
    if (!platform || !['twitter', 'facebook', 'all'].includes(platform)) {
      return NextResponse.json({ error: 'Invalid platform' }, { status: 400 });
    }

    const ghToken = process.env.GH_PAT_WORKFLOW;
    if (!ghToken) {
      return NextResponse.json({ error: 'GH_PAT_WORKFLOW not configured' }, { status: 500 });
    }

    const response = await fetch(
      'https://api.github.com/repos/ITGuys-RO/itguys.ro/actions/workflows/share-to-social.yml/dispatches',
      {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${ghToken}`,
          'Accept': 'application/vnd.github.v3+json',
          'User-Agent': 'ITGuys-Admin/1.0',
        },
        body: JSON.stringify({
          ref: 'master',
          inputs: {
            post_slug: post.slug,
            platform,
          },
        }),
      }
    );

    if (!response.ok && response.status !== 204) {
      console.error(`GitHub API error: ${response.status}`);
      return NextResponse.json(
        { error: 'Failed to trigger share workflow' },
        { status: 502 }
      );
    }

    return NextResponse.json({ success: true, message: 'Share workflow triggered' });
  } catch (error) {
    return handleApiError(error);
  }
}
