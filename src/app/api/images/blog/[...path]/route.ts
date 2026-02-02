import { NextRequest, NextResponse } from 'next/server';

type RouteParams = { params: Promise<{ path: string[] }> };

export async function GET(_request: NextRequest, { params }: RouteParams) {
  const { path } = await params;

  // Validate path segments to prevent directory traversal
  for (const segment of path) {
    if (!segment || segment.includes('..') || segment.includes('/')) {
      return NextResponse.json({ error: 'Invalid path' }, { status: 400 });
    }
  }

  const key = `blog/${path.join('/')}`;

  try {
    const { getCloudflareContext } = await import('@opennextjs/cloudflare');
    const { env } = await getCloudflareContext({ async: true });

    if (!env.BLOG_IMAGES) {
      return NextResponse.json({ error: 'R2 not configured' }, { status: 500 });
    }

    const object = await env.BLOG_IMAGES.get(key);
    if (!object) {
      return new NextResponse(null, { status: 404 });
    }

    // Infer content type from extension
    const ext = key.split('.').pop()?.toLowerCase();
    const contentTypes: Record<string, string> = {
      jpg: 'image/jpeg',
      jpeg: 'image/jpeg',
      png: 'image/png',
      webp: 'image/webp',
      gif: 'image/gif',
    };
    const contentType = contentTypes[ext || ''] || 'application/octet-stream';

    // Stream response directly instead of buffering into memory
    return new Response(object.body, {
      headers: {
        'Content-Type': contentType,
        'Cache-Control': 'public, max-age=31536000, immutable',
      },
    });
  } catch {
    return new NextResponse(null, { status: 500 });
  }
}
