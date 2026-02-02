import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';

const MAX_UPLOAD_SIZE = 10 * 1024 * 1024; // 10MB
const ALLOWED_CONTENT_TYPES = ['image/jpeg', 'image/png', 'image/webp', 'image/gif', 'image/svg+xml'];

export async function PUT(request: NextRequest) {
  try {
    requireAdmin(request);

    const key = request.headers.get('X-Image-Key');
    const contentType = request.headers.get('Content-Type') || 'image/jpeg';

    if (!key) {
      return NextResponse.json({ error: 'X-Image-Key header required' }, { status: 400 });
    }

    if (!key.startsWith('blog/') || key.includes('..')) {
      return NextResponse.json({ error: 'Invalid image key' }, { status: 400 });
    }

    if (!ALLOWED_CONTENT_TYPES.includes(contentType)) {
      return NextResponse.json({ error: 'Invalid content type' }, { status: 400 });
    }

    const contentLength = request.headers.get('Content-Length');
    if (contentLength && parseInt(contentLength, 10) > MAX_UPLOAD_SIZE) {
      return NextResponse.json({ error: 'File too large (max 10MB)' }, { status: 400 });
    }

    const { getCloudflareContext } = await import('@opennextjs/cloudflare');
    const { env } = await getCloudflareContext({ async: true });

    if (!env.BLOG_IMAGES) {
      return NextResponse.json({ error: 'R2 not configured' }, { status: 500 });
    }

    const buffer = await request.arrayBuffer();

    if (buffer.byteLength > MAX_UPLOAD_SIZE) {
      return NextResponse.json({ error: 'File too large (max 10MB)' }, { status: 400 });
    }

    await env.BLOG_IMAGES.put(key, buffer, {
      httpMetadata: { contentType },
    });

    return NextResponse.json({ success: true, key });
  } catch (error) {
    return handleApiError(error);
  }
}
