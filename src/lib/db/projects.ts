import { query, queryFirst, execute, batch } from './client';
import type { Locale } from './schema';
import { generateSlug } from '../utils';
import type {
  Project,
  ProjectTranslation,
  ProjectTechnology,
  ProjectWithTranslations,
  ProjectLocalized,
  CaseStudyLocalized,
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

  if (projects.length === 0) return [];

  const projectIds = projects.map((p) => p.id);
  const placeholders = projectIds.map(() => '?').join(',');

  const [allTranslations, allTechnologies] = await Promise.all([
    query<ProjectTranslation>(
      `SELECT * FROM project_translations WHERE project_id IN (${placeholders})`,
      projectIds
    ),
    query<ProjectTechnology>(
      `SELECT * FROM project_technologies WHERE project_id IN (${placeholders}) ORDER BY sort_order ASC`,
      projectIds
    ),
  ]);

  const translationsByProject: Record<number, Record<Locale, ProjectTranslation | undefined>> = {};
  for (const t of allTranslations) {
    (translationsByProject[t.project_id] ??= {} as Record<Locale, ProjectTranslation | undefined>)[t.locale as Locale] = t;
  }

  const techByProject: Record<number, string[]> = {};
  for (const t of allTechnologies) {
    (techByProject[t.project_id] ??= []).push(t.technology);
  }

  return projects.map((project) => ({
    ...project,
    translations: translationsByProject[project.id] ?? {} as Record<Locale, ProjectTranslation | undefined>,
    technologies: techByProject[project.id] ?? [],
  }));
}

export async function getProjectsLocalized(locale: Locale): Promise<ProjectLocalized[]> {
  // Use LEFT JOIN with COALESCE to fall back to English if translation is missing
  const rows = await query<Project & ProjectTranslation & { resolved_slug: string }>(
    `SELECT p.*,
       COALESCE(t.name, t_en.name) as name,
       COALESCE(t.client_type, t_en.client_type) as client_type,
       COALESCE(t.industry, t_en.industry) as industry,
       COALESCE(t.challenge, t_en.challenge) as challenge,
       COALESCE(t.solution, t_en.solution) as solution,
       COALESCE(t.result, t_en.result) as result,
       COALESCE(t.slug, t_en.slug) as resolved_slug
     FROM projects p
     LEFT JOIN project_translations t ON t.project_id = p.id AND t.locale = ?
     LEFT JOIN project_translations t_en ON t_en.project_id = p.id AND t_en.locale = 'en'
     WHERE p.is_active = 1
     ORDER BY p.sort_order ASC`,
    [locale]
  );

  if (rows.length === 0) return [];

  const rowIds = rows.map((r) => r.id);
  const allTechnologies = await query<ProjectTechnology>(
    `SELECT * FROM project_technologies WHERE project_id IN (${rowIds.map(() => '?').join(',')}) ORDER BY sort_order ASC`,
    rowIds
  );

  const techByProject: Record<number, string[]> = {};
  for (const t of allTechnologies) {
    (techByProject[t.project_id] ??= []).push(t.technology);
  }

  return rows.map((row) => ({
    id: row.id,
    slug: row.slug,
    name: row.name,
    clientType: row.client_type,
    industry: row.industry,
    challenge: row.challenge,
    solution: row.solution,
    result: row.result,
    tech: techByProject[row.id] ?? [],
    image: row.image_path,
    url: row.external_url,
    isCaseStudy: row.is_case_study === 1,
    caseStudySlug: row.is_case_study === 1 ? (row.resolved_slug || null) : null,
  }));
}

export async function getProjectLocalized(slug: string, locale: Locale): Promise<ProjectLocalized | null> {
  // Use LEFT JOIN with COALESCE to fall back to English if translation is missing
  const row = await queryFirst<Project & ProjectTranslation>(
    `SELECT p.*,
       COALESCE(t.name, t_en.name) as name,
       COALESCE(t.client_type, t_en.client_type) as client_type,
       COALESCE(t.industry, t_en.industry) as industry,
       COALESCE(t.challenge, t_en.challenge) as challenge,
       COALESCE(t.solution, t_en.solution) as solution,
       COALESCE(t.result, t_en.result) as result
     FROM projects p
     LEFT JOIN project_translations t ON t.project_id = p.id AND t.locale = ?
     LEFT JOIN project_translations t_en ON t_en.project_id = p.id AND t_en.locale = 'en'
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
    isCaseStudy: row.is_case_study === 1,
    caseStudySlug: null,
  };
}

export async function createProject(input: ProjectInput): Promise<number> {
  const result = await execute(
    `INSERT INTO projects (slug, image_path, external_url, sort_order, is_active, is_case_study, duration, completed_at)
     VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
    [
      input.slug,
      input.image_path ?? null,
      input.external_url ?? null,
      input.sort_order ?? 0,
      input.is_active ?? 1,
      input.is_case_study ?? 0,
      input.duration ?? null,
      input.completed_at ?? null,
    ]
  );

  const projectId = result.lastRowId;

  // Insert translations
  const translationStatements = Object.entries(input.translations).map(([locale, t]) => ({
    sql: `INSERT INTO project_translations (project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug)
          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
    params: [
      projectId,
      locale,
      t!.name,
      t!.client_type ?? null,
      t!.industry ?? null,
      t!.challenge ?? null,
      t!.solution ?? null,
      t!.result ?? null,
      t!.content ?? null,
      t!.meta_title ?? null,
      t!.meta_description ?? null,
      t!.slug || (input.is_case_study ? generateSlug(t!.name) : null),
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
  const statements: { sql: string; params: unknown[] }[] = [];

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
  if (input.is_case_study !== undefined) {
    updates.push('is_case_study = ?');
    values.push(input.is_case_study);
  }
  if (input.duration !== undefined) {
    updates.push('duration = ?');
    values.push(input.duration);
  }
  if (input.completed_at !== undefined) {
    updates.push('completed_at = ?');
    values.push(input.completed_at);
  }

  if (updates.length > 0) {
    updates.push('updated_at = CURRENT_TIMESTAMP');
    values.push(id);
    statements.push({
      sql: `UPDATE projects SET ${updates.join(', ')} WHERE id = ?`,
      params: values,
    });
  }

  // Translations
  if (input.translations) {
    for (const [locale, t] of Object.entries(input.translations)) {
      if (t) {
        statements.push({
          sql: `INSERT INTO project_translations (project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                ON CONFLICT(project_id, locale) DO UPDATE SET
                  name = excluded.name,
                  client_type = excluded.client_type,
                  industry = excluded.industry,
                  challenge = excluded.challenge,
                  solution = excluded.solution,
                  result = excluded.result,
                  content = excluded.content,
                  meta_title = excluded.meta_title,
                  meta_description = excluded.meta_description,
                  slug = excluded.slug`,
          params: [id, locale, t.name, t.client_type ?? null, t.industry ?? null, t.challenge ?? null, t.solution ?? null, t.result ?? null, t.content ?? null, t.meta_title ?? null, t.meta_description ?? null, t.slug ?? null],
        });
      }
    }
  }

  // Technologies
  if (input.technologies !== undefined) {
    statements.push({
      sql: 'DELETE FROM project_technologies WHERE project_id = ?',
      params: [id],
    });
    for (let idx = 0; idx < input.technologies.length; idx++) {
      statements.push({
        sql: 'INSERT INTO project_technologies (project_id, technology, sort_order) VALUES (?, ?, ?)',
        params: [id, input.technologies[idx], idx],
      });
    }
  }

  if (statements.length > 0) {
    await batch(statements);
  }
}

export async function deleteProject(id: number): Promise<void> {
  await execute('DELETE FROM projects WHERE id = ?', [id]);
}

export async function getCaseStudiesLocalized(locale: Locale): Promise<CaseStudyLocalized[]> {
  const rows = await query<Project & ProjectTranslation & { resolved_slug: string }>(
    `SELECT p.*,
       COALESCE(t.name, t_en.name) as name,
       COALESCE(t.client_type, t_en.client_type) as client_type,
       COALESCE(t.industry, t_en.industry) as industry,
       COALESCE(t.challenge, t_en.challenge) as challenge,
       COALESCE(t.solution, t_en.solution) as solution,
       COALESCE(t.result, t_en.result) as result,
       COALESCE(t.content, t_en.content) as content,
       COALESCE(t.meta_title, t_en.meta_title) as meta_title,
       COALESCE(t.meta_description, t_en.meta_description) as meta_description,
       COALESCE(t.slug, t_en.slug) as resolved_slug
     FROM projects p
     LEFT JOIN project_translations t ON t.project_id = p.id AND t.locale = ?
     LEFT JOIN project_translations t_en ON t_en.project_id = p.id AND t_en.locale = 'en'
     WHERE p.is_active = 1 AND p.is_case_study = 1
     ORDER BY p.sort_order ASC`,
    [locale]
  );

  if (rows.length === 0) return [];

  const rowIds = rows.map((r) => r.id);
  const allTechnologies = await query<ProjectTechnology>(
    `SELECT * FROM project_technologies WHERE project_id IN (${rowIds.map(() => '?').join(',')}) ORDER BY sort_order ASC`,
    rowIds
  );

  const techByProject: Record<number, string[]> = {};
  for (const t of allTechnologies) {
    (techByProject[t.project_id] ??= []).push(t.technology);
  }

  return rows.map((row) => ({
    id: row.id,
    slug: row.slug,
    name: row.name,
    clientType: row.client_type,
    industry: row.industry,
    challenge: row.challenge,
    solution: row.solution,
    result: row.result,
    content: row.content || '',
    metaTitle: row.meta_title,
    metaDescription: row.meta_description,
    duration: row.duration,
    completedAt: row.completed_at,
    tech: techByProject[row.id] ?? [],
    image: row.image_path,
    url: row.external_url,
    isCaseStudy: true,
    caseStudySlug: row.resolved_slug || null,
  }));
}

export async function getCaseStudyBySlug(slug: string, locale: Locale): Promise<CaseStudyLocalized | null> {
  const row = await queryFirst<Project & ProjectTranslation & { resolved_slug: string }>(
    `SELECT p.*,
       COALESCE(t.name, t_en.name) as name,
       COALESCE(t.client_type, t_en.client_type) as client_type,
       COALESCE(t.industry, t_en.industry) as industry,
       COALESCE(t.challenge, t_en.challenge) as challenge,
       COALESCE(t.solution, t_en.solution) as solution,
       COALESCE(t.result, t_en.result) as result,
       COALESCE(t.content, t_en.content) as content,
       COALESCE(t.meta_title, t_en.meta_title) as meta_title,
       COALESCE(t.meta_description, t_en.meta_description) as meta_description,
       COALESCE(t.slug, t_en.slug) as resolved_slug
     FROM projects p
     LEFT JOIN project_translations t ON t.project_id = p.id AND t.locale = ?
     LEFT JOIN project_translations t_en ON t_en.project_id = p.id AND t_en.locale = 'en'
     WHERE p.is_active = 1 AND p.is_case_study = 1
       AND (t.slug = ? OR (t.slug IS NULL AND t_en.slug = ?) OR (t.slug IS NULL AND t_en.slug IS NULL AND p.slug = ?))`,
    [locale, slug, slug, slug]
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
    content: row.content || '',
    metaTitle: row.meta_title,
    metaDescription: row.meta_description,
    duration: row.duration,
    completedAt: row.completed_at,
    tech: technologies,
    image: row.image_path,
    url: row.external_url,
    isCaseStudy: true,
    caseStudySlug: row.resolved_slug || null,
  };
}

export async function getProjectLocaleSlugs(projectId: number): Promise<Record<string, string>> {
  const project = await getProjectById(projectId);
  if (!project) return {};

  const translations = await getProjectTranslations(projectId);
  const slugs: Record<string, string> = {};

  const allLocales = ['en', 'ro', 'fr', 'de', 'it', 'es'];
  for (const locale of allLocales) {
    slugs[locale] = project.slug;
  }

  for (const t of translations) {
    if (t.slug) {
      slugs[t.locale] = t.slug;
    }
  }

  return slugs;
}
