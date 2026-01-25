import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';
import {
  getAllServicesWithTranslations,
  createService,
} from '@/lib/db';
import type { ServiceInput } from '@/lib/db';

export async function GET(request: NextRequest) {
  try {
    requireAdmin(request);
    const services = await getAllServicesWithTranslations();
    return NextResponse.json(services);
  } catch (error) {
    return handleApiError(error);
  }
}

export async function POST(request: NextRequest) {
  try {
    requireAdmin(request);
    const input = (await request.json()) as ServiceInput;

    if (!input.slug || !input.category || !input.translations) {
      return NextResponse.json({ error: 'Missing required fields' }, { status: 400 });
    }

    const id = await createService(input);
    return NextResponse.json({ id }, { status: 201 });
  } catch (error) {
    return handleApiError(error);
  }
}
