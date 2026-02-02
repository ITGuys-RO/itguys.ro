import { NextRequest, NextResponse } from 'next/server';

export async function PUT(request: NextRequest) {
  const key = request.headers.get('X-Image-Key');
  const contentType = request.headers.get('Content-Type') || 'image/jpeg';

  if (!key) {
    return NextResponse.json({ error: 'X-Image-Key header required' }, { status: 400 });
  }

  try {
    const { getCloudflareContext } = await import('@opennextjs/cloudflare');
    const { env } = await getCloudflareContext({ async: true });

    if (!env.BLOG_IMAGES) {
      return NextResponse.json({ error: 'R2 not configured' }, { status: 500 });
    }

    const buffer = await request.arrayBuffer();
    await env.BLOG_IMAGES.put(key, buffer, {
      httpMetadata: { contentType },
    });

    return NextResponse.json({ success: true, key });
  } catch {
    return NextResponse.json({ error: 'Upload failed' }, { status: 500 });
  }
}
