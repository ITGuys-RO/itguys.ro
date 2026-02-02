import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';
import { getPostById, updatePost } from '@/lib/db';

type RouteParams = { params: Promise<{ id: string }> };

const ALLOWED_TYPES = ['image/jpeg', 'image/png', 'image/webp', 'image/gif'];
const MAX_SIZE = 10 * 1024 * 1024; // 10MB

export async function POST(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;
    const postId = parseInt(id, 10);

    const post = await getPostById(postId);
    if (!post) {
      return NextResponse.json({ error: 'Post not found' }, { status: 404 });
    }

    const formData = await request.formData();
    const file = formData.get('file') as File | null;

    if (!file) {
      return NextResponse.json({ error: 'No file provided' }, { status: 400 });
    }

    if (!ALLOWED_TYPES.includes(file.type)) {
      return NextResponse.json(
        { error: `Invalid file type: ${file.type}. Allowed: ${ALLOWED_TYPES.join(', ')}` },
        { status: 400 }
      );
    }

    if (file.size > MAX_SIZE) {
      return NextResponse.json(
        { error: `File too large: ${(file.size / 1024 / 1024).toFixed(1)}MB. Max: 10MB` },
        { status: 400 }
      );
    }

    // Determine extension
    const extMap: Record<string, string> = {
      'image/jpeg': '.jpg',
      'image/png': '.png',
      'image/webp': '.webp',
      'image/gif': '.gif',
    };
    const ext = extMap[file.type] || '.jpg';
    const key = `blog/${post.slug}${ext}`;

    // Upload to R2
    const { getCloudflareContext } = await import('@opennextjs/cloudflare');
    const { env } = await getCloudflareContext({ async: true });

    if (!env.BLOG_IMAGES) {
      return NextResponse.json(
        { error: 'R2 bucket not configured' },
        { status: 500 }
      );
    }

    const buffer = await file.arrayBuffer();
    await env.BLOG_IMAGES.put(key, buffer, {
      httpMetadata: { contentType: file.type },
    });

    const publicUrl = `${process.env.R2_PUBLIC_URL || ''}/blog/${post.slug}${ext}`;

    // Update post image_path
    await updatePost(postId, { image_path: publicUrl });

    return NextResponse.json({ success: true, image_path: publicUrl });
  } catch (error) {
    return handleApiError(error);
  }
}
