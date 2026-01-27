import { NextRequest, NextResponse } from 'next/server';
import { createPost, getPostBySlug, updatePost } from '@/lib/db/posts';
import { submitBlogPostToIndexNow } from '@/lib/indexnow';
import { PostInput } from '@/lib/db/schema';

function validateApiKey(request: NextRequest): boolean {
  const authHeader = request.headers.get('Authorization');
  if (!authHeader?.startsWith('Bearer ')) {
    return false;
  }
  const apiKey = authHeader.slice(7);
  return apiKey === process.env.AUTOMATION_API_KEY;
}

export async function POST(request: NextRequest) {
  // Validate API key
  if (!validateApiKey(request)) {
    return NextResponse.json(
      { error: 'Unauthorized' },
      { status: 401 }
    );
  }

  try {
    const input: PostInput = await request.json();

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

    // Trigger IndexNow if published
    if (input.is_published === 1) {
      submitBlogPostToIndexNow(input.slug).catch(console.error);
    }

    return NextResponse.json({ id: postId, success: true, action });
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : 'Unknown error';
    console.error('Automation post creation failed:', errorMessage, error);
    return NextResponse.json(
      { error: 'Failed to create post', details: errorMessage },
      { status: 500 }
    );
  }
}
