import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError, parseId } from '@/lib/admin-auth';
import {
  getFaqWithTranslations,
  updateFaq,
  deleteFaq,
} from '@/lib/db';
import type { FaqInput } from '@/lib/db';

type RouteParams = { params: Promise<{ id: string }> };

export async function GET(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;
    const item = await getFaqWithTranslations(parseId(id));

    if (!item) {
      return NextResponse.json({ error: 'Not found' }, { status: 404 });
    }

    return NextResponse.json(item);
  } catch (error) {
    return handleApiError(error);
  }
}

export async function PUT(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;
    const input = (await request.json()) as Partial<FaqInput>;

    await updateFaq(parseId(id), input);
    return NextResponse.json({ success: true });
  } catch (error) {
    return handleApiError(error);
  }
}

export async function DELETE(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;

    await deleteFaq(parseId(id));
    return NextResponse.json({ success: true });
  } catch (error) {
    return handleApiError(error);
  }
}
