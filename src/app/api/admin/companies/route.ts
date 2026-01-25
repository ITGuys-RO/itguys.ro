import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';
import {
  getAllCompaniesWithTranslations,
  createCompany,
} from '@/lib/db';
import type { CompanyInput } from '@/lib/db';

export async function GET(request: NextRequest) {
  try {
    requireAdmin(request);
    const companies = await getAllCompaniesWithTranslations();
    return NextResponse.json(companies);
  } catch (error) {
    return handleApiError(error);
  }
}

export async function POST(request: NextRequest) {
  try {
    requireAdmin(request);
    const input = (await request.json()) as CompanyInput;

    if (!input.slug || !input.translations) {
      return NextResponse.json({ error: 'Missing required fields' }, { status: 400 });
    }

    const id = await createCompany(input);
    return NextResponse.json({ id }, { status: 201 });
  } catch (error) {
    return handleApiError(error);
  }
}
