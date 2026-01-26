import { NextRequest, NextResponse } from 'next/server';
import { createPost } from '@/lib/db/posts';
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

    // Create the post
    const postId = await createPost(input);

    // Trigger IndexNow if published
    if (input.is_published === 1) {
      submitBlogPostToIndexNow(input.slug).catch(console.error);
    }

    return NextResponse.json({ id: postId, success: true });
  } catch (error) {
    console.error('Automation post creation failed:', error);
    return NextResponse.json(
      { error: 'Failed to create post' },
      { status: 500 }
    );
  }
}
