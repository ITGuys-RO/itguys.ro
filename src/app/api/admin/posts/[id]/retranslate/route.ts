import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';
import { getPostById } from '@/lib/db/posts';

const VALID_LOCALES = ['ro', 'fr', 'de', 'it', 'es'];

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

    const { locales } = await request.json();
    if (!Array.isArray(locales) || locales.length === 0) {
      return NextResponse.json({ error: 'locales must be a non-empty array' }, { status: 400 });
    }

    for (const locale of locales) {
      if (!VALID_LOCALES.includes(locale)) {
        return NextResponse.json({ error: `Invalid locale: ${locale}` }, { status: 400 });
      }
    }

    const ghToken = process.env.GITHUB_TOKEN;
    if (!ghToken) {
      return NextResponse.json({ error: 'GITHUB_TOKEN not configured' }, { status: 500 });
    }

    const response = await fetch(
      'https://api.github.com/repos/ITGuys-RO/itguys.ro/actions/workflows/retranslate-post.yml/dispatches',
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
            locales: locales.join(','),
          },
        }),
      }
    );

    if (!response.ok && response.status !== 204) {
      console.error(`GitHub API error: ${response.status}`);
      return NextResponse.json(
        { error: 'Failed to trigger retranslate workflow' },
        { status: 502 }
      );
    }

    return NextResponse.json({ success: true, message: 'Retranslate workflow triggered' });
  } catch (error) {
    return handleApiError(error);
  }
}
