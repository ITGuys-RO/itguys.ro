import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';
import { query, execute } from '@/lib/db/client';

interface IndexNowEntry {
  url: string;
  submitted_at: string;
}

export async function GET(request: NextRequest) {
  try {
    requireAdmin(request);

    const entries = await query<IndexNowEntry>(
      'SELECT url, submitted_at FROM indexnow_submitted ORDER BY submitted_at DESC'
    );

    return NextResponse.json(entries);
  } catch (error) {
    return handleApiError(error);
  }
}

export async function DELETE(request: NextRequest) {
  try {
    requireAdmin(request);

    const { searchParams } = new URL(request.url);
    const url = searchParams.get('url');

    if (url) {
      // Delete specific URL
      await execute('DELETE FROM indexnow_submitted WHERE url = ?', [url]);
    } else {
      // Clear all
      await execute('DELETE FROM indexnow_submitted');
    }

    return NextResponse.json({ success: true });
  } catch (error) {
    return handleApiError(error);
  }
}
