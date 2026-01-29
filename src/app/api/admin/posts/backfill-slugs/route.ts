import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';
import { backfillTranslationSlugs } from '@/lib/db/posts';

export async function POST(request: NextRequest) {
  try {
    requireAdmin(request);
    const updated = await backfillTranslationSlugs();
    return NextResponse.json({ success: true, updated });
  } catch (error) {
    return handleApiError(error);
  }
}
