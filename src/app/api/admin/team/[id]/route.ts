import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError, parseId } from '@/lib/admin-auth';
import {
  getTeamMemberWithTranslations,
  updateTeamMember,
  deleteTeamMember,
} from '@/lib/db';
import type { TeamMemberInput } from '@/lib/db';

type RouteParams = { params: Promise<{ id: string }> };

export async function GET(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;
    const member = await getTeamMemberWithTranslations(parseId(id));

    if (!member) {
      return NextResponse.json({ error: 'Not found' }, { status: 404 });
    }

    return NextResponse.json(member);
  } catch (error) {
    return handleApiError(error);
  }
}

export async function PUT(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;
    const input = (await request.json()) as Partial<TeamMemberInput>;

    await updateTeamMember(parseId(id), input);
    return NextResponse.json({ success: true });
  } catch (error) {
    return handleApiError(error);
  }
}

export async function DELETE(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;

    await deleteTeamMember(parseId(id));
    return NextResponse.json({ success: true });
  } catch (error) {
    return handleApiError(error);
  }
}
