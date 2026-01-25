import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';
import {
  getAllTeamMembersWithTranslations,
  createTeamMember,
} from '@/lib/db';
import type { TeamMemberInput } from '@/lib/db';

export const runtime = 'edge';

export async function GET(request: NextRequest) {
  try {
    requireAdmin(request);
    const members = await getAllTeamMembersWithTranslations();
    return NextResponse.json(members);
  } catch (error) {
    return handleApiError(error);
  }
}

export async function POST(request: NextRequest) {
  try {
    requireAdmin(request);
    const input = (await request.json()) as TeamMemberInput;

    if (!input.slug || !input.translations) {
      return NextResponse.json({ error: 'Missing required fields' }, { status: 400 });
    }

    const id = await createTeamMember(input);
    return NextResponse.json({ id }, { status: 201 });
  } catch (error) {
    return handleApiError(error);
  }
}
