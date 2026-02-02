import { query, queryFirst, execute, batch, buildUpdateStatement } from './client';
import type { Locale } from './schema';
import type {
  TeamMember,
  TeamMemberTranslation,
  TeamMemberWithTranslations,
  TeamMemberLocalized,
  TeamMemberInput,
} from './schema';

export async function getTeamMembers(): Promise<TeamMember[]> {
  return query<TeamMember>(
    'SELECT * FROM team_members WHERE is_active = 1 ORDER BY sort_order ASC'
  );
}

export async function getTeamMemberById(id: number): Promise<TeamMember | null> {
  return queryFirst<TeamMember>('SELECT * FROM team_members WHERE id = ?', [id]);
}

export async function getTeamMemberBySlug(slug: string): Promise<TeamMember | null> {
  return queryFirst<TeamMember>('SELECT * FROM team_members WHERE slug = ?', [slug]);
}

export async function getTeamMemberTranslations(teamMemberId: number): Promise<TeamMemberTranslation[]> {
  return query<TeamMemberTranslation>(
    'SELECT * FROM team_member_translations WHERE team_member_id = ?',
    [teamMemberId]
  );
}

export async function getTeamMemberWithTranslations(id: number): Promise<TeamMemberWithTranslations | null> {
  const member = await getTeamMemberById(id);
  if (!member) return null;

  const translations = await getTeamMemberTranslations(id);
  const translationsMap = translations.reduce((acc, t) => {
    acc[t.locale as Locale] = t;
    return acc;
  }, {} as Record<Locale, TeamMemberTranslation | undefined>);

  return { ...member, translations: translationsMap };
}

export async function getAllTeamMembersWithTranslations(): Promise<TeamMemberWithTranslations[]> {
  const members = await query<TeamMember>(
    'SELECT * FROM team_members ORDER BY sort_order ASC'
  );

  if (members.length === 0) return [];

  const memberIds = members.map((m) => m.id);
  const allTranslations = await query<TeamMemberTranslation>(
    `SELECT * FROM team_member_translations WHERE team_member_id IN (${memberIds.map(() => '?').join(',')})`,
    memberIds
  );

  const translationsByMember: Record<number, Record<Locale, TeamMemberTranslation | undefined>> = {};
  for (const t of allTranslations) {
    (translationsByMember[t.team_member_id] ??= {} as Record<Locale, TeamMemberTranslation | undefined>)[t.locale as Locale] = t;
  }

  return members.map((member) => ({
    ...member,
    translations: translationsByMember[member.id] ?? {} as Record<Locale, TeamMemberTranslation | undefined>,
  }));
}

export async function getTeamMembersLocalized(locale: Locale): Promise<TeamMemberLocalized[]> {
  // Use LEFT JOIN with COALESCE to fall back to English if translation is missing
  const rows = await query<TeamMember & TeamMemberTranslation>(
    `SELECT m.*,
       COALESCE(t.name, t_en.name) as name,
       COALESCE(t.role, t_en.role) as role,
       COALESCE(t.bio, t_en.bio) as bio
     FROM team_members m
     LEFT JOIN team_member_translations t ON t.team_member_id = m.id AND t.locale = ?
     LEFT JOIN team_member_translations t_en ON t_en.team_member_id = m.id AND t_en.locale = 'en'
     WHERE m.is_active = 1
     ORDER BY m.sort_order ASC`,
    [locale]
  );

  return rows.map((row) => ({
    id: row.id,
    slug: row.slug,
    email: row.email,
    gravatarEmail: row.gravatar_email,
    linkedIn: row.linkedin_url,
    imagePath: row.image_path,
    name: row.name,
    role: row.role,
    bio: row.bio,
  }));
}

export async function getTeamMemberLocalized(id: number, locale: Locale): Promise<TeamMemberLocalized | null> {
  // Use LEFT JOIN with COALESCE to fall back to English if translation is missing
  const row = await queryFirst<TeamMember & TeamMemberTranslation>(
    `SELECT m.*,
       COALESCE(t.name, t_en.name) as name,
       COALESCE(t.role, t_en.role) as role,
       COALESCE(t.bio, t_en.bio) as bio
     FROM team_members m
     LEFT JOIN team_member_translations t ON t.team_member_id = m.id AND t.locale = ?
     LEFT JOIN team_member_translations t_en ON t_en.team_member_id = m.id AND t_en.locale = 'en'
     WHERE m.id = ?`,
    [locale, id]
  );

  if (!row) return null;

  return {
    id: row.id,
    slug: row.slug,
    email: row.email,
    gravatarEmail: row.gravatar_email,
    linkedIn: row.linkedin_url,
    imagePath: row.image_path,
    name: row.name,
    role: row.role,
    bio: row.bio,
  };
}

export async function createTeamMember(input: TeamMemberInput): Promise<number> {
  const result = await execute(
    `INSERT INTO team_members (slug, email, gravatar_email, linkedin_url, image_path, sort_order, is_active)
     VALUES (?, ?, ?, ?, ?, ?, ?)`,
    [
      input.slug,
      input.email ?? null,
      input.gravatar_email ?? null,
      input.linkedin_url ?? null,
      input.image_path ?? null,
      input.sort_order ?? 0,
      input.is_active ?? 1,
    ]
  );

  const memberId = result.lastRowId;

  // Insert translations
  const translationStatements = Object.entries(input.translations).map(([locale, t]) => ({
    sql: `INSERT INTO team_member_translations (team_member_id, locale, name, role, bio) VALUES (?, ?, ?, ?, ?)`,
    params: [memberId, locale, t!.name, t!.role, t!.bio],
  }));

  if (translationStatements.length > 0) {
    await batch(translationStatements);
  }

  return memberId;
}

export async function updateTeamMember(id: number, input: Partial<TeamMemberInput>): Promise<void> {
  const statements: { sql: string; params: unknown[] }[] = [];

  const baseUpdate = buildUpdateStatement('team_members', id, {
    slug: input.slug,
    email: input.email,
    gravatar_email: input.gravatar_email,
    linkedin_url: input.linkedin_url,
    image_path: input.image_path,
    sort_order: input.sort_order,
    is_active: input.is_active,
  });
  if (baseUpdate) statements.push(baseUpdate);

  if (input.translations) {
    for (const [locale, t] of Object.entries(input.translations)) {
      if (t) {
        statements.push({
          sql: `INSERT INTO team_member_translations (team_member_id, locale, name, role, bio)
                VALUES (?, ?, ?, ?, ?)
                ON CONFLICT(team_member_id, locale) DO UPDATE SET
                  name = excluded.name,
                  role = excluded.role,
                  bio = excluded.bio`,
          params: [id, locale, t.name, t.role, t.bio],
        });
      }
    }
  }

  if (statements.length > 0) {
    await batch(statements);
  }
}

export async function deleteTeamMember(id: number): Promise<void> {
  await execute('DELETE FROM team_members WHERE id = ?', [id]);
}
