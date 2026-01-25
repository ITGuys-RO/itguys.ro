import { query, queryFirst, execute, batch } from './client';
import type { Locale } from '@/i18n/config';
import type {
  Project,
  ProjectTranslation,
  ProjectTechnology,
  ProjectWithTranslations,
  ProjectLocalized,
  ProjectInput,
} from './schema';

export async function getProjects(): Promise<Project[]> {
  return query<Project>(
    'SELECT * FROM projects WHERE is_active = 1 ORDER BY sort_order ASC'
  );
}

export async function getProjectById(id: number): Promise<Project | null> {
  return queryFirst<Project>('SELECT * FROM projects WHERE id = ?', [id]);
}

export async function getProjectBySlug(slug: string): Promise<Project | null> {
  return queryFirst<Project>('SELECT * FROM projects WHERE slug = ?', [slug]);
}

export async function getProjectTranslations(projectId: number): Promise<ProjectTranslation[]> {
  return query<ProjectTranslation>(
    'SELECT * FROM project_translations WHERE project_id = ?',
    [projectId]
  );
}

export async function getProjectTechnologies(projectId: number): Promise<string[]> {
  const rows = await query<ProjectTechnology>(
    'SELECT technology FROM project_technologies WHERE project_id = ? ORDER BY sort_order ASC',
    [projectId]
  );
  return rows.map((r) => r.technology);
}

export async function getProjectWithTranslations(id: number): Promise<ProjectWithTranslations | null> {
  const project = await getProjectById(id);
  if (!project) return null;

  const [translations, technologies] = await Promise.all([
    getProjectTranslations(id),
    getProjectTechnologies(id),
  ]);

  const translationsMap = translations.reduce((acc, t) => {
    acc[t.locale as Locale] = t;
    return acc;
  }, {} as Record<Locale, ProjectTranslation | undefined>);

  return { ...project, translations: translationsMap, technologies };
}

export async function getAllProjectsWithTranslations(): Promise<ProjectWithTranslations[]> {
  const projects = await query<Project>(
    'SELECT * FROM projects ORDER BY sort_order ASC'
  );

  const result: ProjectWithTranslations[] = [];
  for (const project of projects) {
    const [translations, technologies] = await Promise.all([
      getProjectTranslations(project.id),
      getProjectTechnologies(project.id),
    ]);
    const translationsMap = translations.reduce((acc, t) => {
      acc[t.locale as Locale] = t;
      return acc;
    }, {} as Record<Locale, ProjectTranslation | undefined>);
    result.push({ ...project, translations: translationsMap, technologies });
  }
  return result;
}

export async function getProjectsLocalized(locale: Locale): Promise<ProjectLocalized[]> {
  const rows = await query<Project & ProjectTranslation>(
    `SELECT p.*, t.name, t.client_type, t.industry, t.challenge, t.solution, t.result
     FROM projects p
     JOIN project_translations t ON t.project_id = p.id AND t.locale = ?
     WHERE p.is_active = 1
     ORDER BY p.sort_order ASC`,
    [locale]
  );

  const result: ProjectLocalized[] = [];
  for (const row of rows) {
    const technologies = await getProjectTechnologies(row.id);
    result.push({
      id: row.id,
      slug: row.slug,
      name: row.name,
      clientType: row.client_type,
      industry: row.industry,
      challenge: row.challenge,
      solution: row.solution,
      result: row.result,
      tech: technologies,
      image: row.image_path,
      url: row.external_url,
    });
  }

  return result;
}

export async function getProjectLocalized(slug: string, locale: Locale): Promise<ProjectLocalized | null> {
  const row = await queryFirst<Project & ProjectTranslation>(
    `SELECT p.*, t.name, t.client_type, t.industry, t.challenge, t.solution, t.result
     FROM projects p
     JOIN project_translations t ON t.project_id = p.id AND t.locale = ?
     WHERE p.slug = ? AND p.is_active = 1`,
    [locale, slug]
  );

  if (!row) return null;

  const technologies = await getProjectTechnologies(row.id);

  return {
    id: row.id,
    slug: row.slug,
    name: row.name,
    clientType: row.client_type,
    industry: row.industry,
    challenge: row.challenge,
    solution: row.solution,
    result: row.result,
    tech: technologies,
    image: row.image_path,
    url: row.external_url,
  };
}

export async function createProject(input: ProjectInput): Promise<number> {
  const result = await execute(
    `INSERT INTO projects (slug, image_path, external_url, sort_order, is_active)
     VALUES (?, ?, ?, ?, ?)`,
    [
      input.slug,
      input.image_path ?? null,
      input.external_url ?? null,
      input.sort_order ?? 0,
      input.is_active ?? 1,
    ]
  );

  const projectId = result.lastRowId;

  // Insert translations
  const translationStatements = Object.entries(input.translations).map(([locale, t]) => ({
    sql: `INSERT INTO project_translations (project_id, locale, name, client_type, industry, challenge, solution, result)
          VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
    params: [
      projectId,
      locale,
      t!.name,
      t!.client_type ?? null,
      t!.industry ?? null,
      t!.challenge ?? null,
      t!.solution ?? null,
      t!.result ?? null,
    ],
  }));

  // Insert technologies
  const techStatements = input.technologies.map((tech, idx) => ({
    sql: `INSERT INTO project_technologies (project_id, technology, sort_order) VALUES (?, ?, ?)`,
    params: [projectId, tech, idx],
  }));

  const allStatements = [...translationStatements, ...techStatements];
  if (allStatements.length > 0) {
    await batch(allStatements);
  }

  return projectId;
}

export async function updateProject(id: number, input: Partial<ProjectInput>): Promise<void> {
  const updates: string[] = [];
  const values: unknown[] = [];

  if (input.slug !== undefined) {
    updates.push('slug = ?');
    values.push(input.slug);
  }
  if (input.image_path !== undefined) {
    updates.push('image_path = ?');
    values.push(input.image_path);
  }
  if (input.external_url !== undefined) {
    updates.push('external_url = ?');
    values.push(input.external_url);
  }
  if (input.sort_order !== undefined) {
    updates.push('sort_order = ?');
    values.push(input.sort_order);
  }
  if (input.is_active !== undefined) {
    updates.push('is_active = ?');
    values.push(input.is_active);
  }

  if (updates.length > 0) {
    updates.push('updated_at = CURRENT_TIMESTAMP');
    values.push(id);
    await execute(`UPDATE projects SET ${updates.join(', ')} WHERE id = ?`, values);
  }

  // Update translations
  if (input.translations) {
    for (const [locale, t] of Object.entries(input.translations)) {
      if (t) {
        await execute(
          `INSERT INTO project_translations (project_id, locale, name, client_type, industry, challenge, solution, result)
           VALUES (?, ?, ?, ?, ?, ?, ?, ?)
           ON CONFLICT(project_id, locale) DO UPDATE SET
             name = excluded.name,
             client_type = excluded.client_type,
             industry = excluded.industry,
             challenge = excluded.challenge,
             solution = excluded.solution,
             result = excluded.result`,
          [id, locale, t.name, t.client_type ?? null, t.industry ?? null, t.challenge ?? null, t.solution ?? null, t.result ?? null]
        );
      }
    }
  }

  // Update technologies
  if (input.technologies !== undefined) {
    await execute('DELETE FROM project_technologies WHERE project_id = ?', [id]);
    const techStatements = input.technologies.map((tech, idx) => ({
      sql: `INSERT INTO project_technologies (project_id, technology, sort_order) VALUES (?, ?, ?)`,
      params: [id, tech, idx],
    }));
    if (techStatements.length > 0) {
      await batch(techStatements);
    }
  }
}

export async function deleteProject(id: number): Promise<void> {
  await execute('DELETE FROM projects WHERE id = ?', [id]);
}
