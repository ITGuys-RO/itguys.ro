import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';
import {
  getCompanyWithTranslations,
  updateCompany,
  deleteCompany,
} from '@/lib/db';
import type { CompanyInput } from '@/lib/db';

type RouteParams = { params: Promise<{ id: string }> };

export async function GET(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;
    const company = await getCompanyWithTranslations(parseInt(id, 10));

    if (!company) {
      return NextResponse.json({ error: 'Not found' }, { status: 404 });
    }

    return NextResponse.json(company);
  } catch (error) {
    return handleApiError(error);
  }
}

export async function PUT(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;
    const input = (await request.json()) as Partial<CompanyInput>;

    await updateCompany(parseInt(id, 10), input);
    return NextResponse.json({ success: true });
  } catch (error) {
    return handleApiError(error);
  }
}

export async function DELETE(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;

    await deleteCompany(parseInt(id, 10));
    return NextResponse.json({ success: true });
  } catch (error) {
    return handleApiError(error);
  }
}
