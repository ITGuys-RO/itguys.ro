import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';
import {
  getServiceWithTranslations,
  updateService,
  deleteService,
} from '@/lib/db';
import type { ServiceInput } from '@/lib/db';

export const runtime = 'edge';

type RouteParams = { params: Promise<{ id: string }> };

export async function GET(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;
    const service = await getServiceWithTranslations(parseInt(id, 10));

    if (!service) {
      return NextResponse.json({ error: 'Not found' }, { status: 404 });
    }

    return NextResponse.json(service);
  } catch (error) {
    return handleApiError(error);
  }
}

export async function PUT(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;
    const input = (await request.json()) as Partial<ServiceInput>;

    await updateService(parseInt(id, 10), input);
    return NextResponse.json({ success: true });
  } catch (error) {
    return handleApiError(error);
  }
}

export async function DELETE(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;

    await deleteService(parseInt(id, 10));
    return NextResponse.json({ success: true });
  } catch (error) {
    return handleApiError(error);
  }
}
