import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError, parseId } from '@/lib/admin-auth';
import {
  getProjectWithTranslations,
  updateProject,
  deleteProject,
} from '@/lib/db';
import type { ProjectInput } from '@/lib/db';

type RouteParams = { params: Promise<{ id: string }> };

export async function GET(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;
    const project = await getProjectWithTranslations(parseId(id));

    if (!project) {
      return NextResponse.json({ error: 'Not found' }, { status: 404 });
    }

    return NextResponse.json(project);
  } catch (error) {
    return handleApiError(error);
  }
}

export async function PUT(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;
    const input = (await request.json()) as Partial<ProjectInput>;

    await updateProject(parseId(id), input);
    return NextResponse.json({ success: true });
  } catch (error) {
    return handleApiError(error);
  }
}

export async function DELETE(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;

    await deleteProject(parseId(id));
    return NextResponse.json({ success: true });
  } catch (error) {
    return handleApiError(error);
  }
}
