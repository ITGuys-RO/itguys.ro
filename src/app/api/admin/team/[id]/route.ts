import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';
import {
  getTeamMemberWithTranslations,
  updateTeamMember,
  deleteTeamMember,
} from '@/lib/db';
import type { TeamMemberInput } from '@/lib/db';

export const runtime = 'edge';

type RouteParams = { params: Promise<{ id: string }> };

export async function GET(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;
    const member = await getTeamMemberWithTranslations(parseInt(id, 10));

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

    await updateTeamMember(parseInt(id, 10), input);
    return NextResponse.json({ success: true });
  } catch (error) {
    return handleApiError(error);
  }
}

export async function DELETE(request: NextRequest, { params }: RouteParams) {
  try {
    requireAdmin(request);
    const { id } = await params;

    await deleteTeamMember(parseInt(id, 10));
    return NextResponse.json({ success: true });
  } catch (error) {
    return handleApiError(error);
  }
}
