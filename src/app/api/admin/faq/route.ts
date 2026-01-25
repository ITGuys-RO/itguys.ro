import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';
import {
  getAllFaqWithTranslations,
  createFaq,
} from '@/lib/db';
import type { FaqInput } from '@/lib/db';

export const runtime = 'edge';

export async function GET(request: NextRequest) {
  try {
    requireAdmin(request);
    const items = await getAllFaqWithTranslations();
    return NextResponse.json(items);
  } catch (error) {
    return handleApiError(error);
  }
}

export async function POST(request: NextRequest) {
  try {
    requireAdmin(request);
    const input = (await request.json()) as FaqInput;

    if (!input.slug || !input.translations) {
      return NextResponse.json({ error: 'Missing required fields' }, { status: 400 });
    }

    const id = await createFaq(input);
    return NextResponse.json({ id }, { status: 201 });
  } catch (error) {
    return handleApiError(error);
  }
}
