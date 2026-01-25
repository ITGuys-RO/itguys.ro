import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';
import { searchAllEntities } from '@/lib/db/search';

export async function GET(request: NextRequest) {
  try {
    requireAdmin(request);

    const { searchParams } = new URL(request.url);
    const query = searchParams.get('q') || '';

    if (query.length < 2) {
      return NextResponse.json({
        results: [],
        query,
        error: 'Search query must be at least 2 characters',
      });
    }

    const results = await searchAllEntities(query);

    return NextResponse.json({
      results,
      query,
    });
  } catch (error) {
    return handleApiError(error);
  }
}
