import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';
import {
  getAllProjectsWithTranslations,
  createProject,
} from '@/lib/db';
import type { ProjectInput } from '@/lib/db';

export async function GET(request: NextRequest) {
  try {
    requireAdmin(request);
    const projects = await getAllProjectsWithTranslations();
    return NextResponse.json(projects);
  } catch (error) {
    return handleApiError(error);
  }
}

export async function POST(request: NextRequest) {
  try {
    requireAdmin(request);
    const input = (await request.json()) as ProjectInput;

    if (!input.slug || !input.translations) {
      return NextResponse.json({ error: 'Missing required fields' }, { status: 400 });
    }

    const id = await createProject(input);
    return NextResponse.json({ id }, { status: 201 });
  } catch (error) {
    return handleApiError(error);
  }
}
