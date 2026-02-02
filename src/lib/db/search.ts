import { query } from './client';

function escapeLikePattern(input: string): string {
  return input.replace(/\\/g, '\\\\').replace(/%/g, '\\%').replace(/_/g, '\\_');
}

export interface SearchResult {
  entityType: 'team' | 'projects' | 'companies' | 'services' | 'faq' | 'posts';
  entityId: number;
  displayName: string;
  matchField: string;
  matchLocale: string;
  matchExcerpt: string;
  editUrl: string;
  subserviceSlug?: string;
}

interface RawSearchResult {
  entity_id: number;
  display_name: string;
  match_field: string;
  match_locale: string;
  match_value: string;
  subservice_slug?: string;
}

function createExcerpt(text: string, searchQuery: string, maxLength: number = 75): string {
  if (!text) return '';

  const lowerText = text.toLowerCase();
  const lowerQuery = searchQuery.toLowerCase();
  const matchIndex = lowerText.indexOf(lowerQuery);

  if (matchIndex === -1) {
    return text.substring(0, maxLength) + (text.length > maxLength ? '...' : '');
  }

  // Calculate window around match
  const start = Math.max(0, matchIndex - 20);
  const end = Math.min(text.length, matchIndex + searchQuery.length + 40);

  let excerpt = text.substring(start, end);

  // Add ellipsis if needed
  if (start > 0) excerpt = '...' + excerpt;
  if (end < text.length) excerpt = excerpt + '...';

  return excerpt;
}

function getEditUrl(entityType: string, entityId: number, subserviceSlug?: string): string {
  const urlMap: Record<string, string> = {
    team: '/admin/team',
    projects: '/admin/projects',
    companies: '/admin/companies',
    services: '/admin/services',
    faq: '/admin/faq',
    posts: '/admin/posts',
  };
  const baseUrl = `${urlMap[entityType] || '/admin'}/${entityId}`;
  if (subserviceSlug) {
    return `${baseUrl}?subservice=${encodeURIComponent(subserviceSlug)}`;
  }
  return baseUrl;
}

async function searchTeam(searchPattern: string): Promise<RawSearchResult[]> {
  const sql = `
    SELECT
      tm.id as entity_id,
      COALESCE(en_t.name, t.name) as display_name,
      CASE
        WHEN LOWER(t.name) LIKE LOWER(?) ESCAPE '\' THEN 'name'
        WHEN LOWER(t.role) LIKE LOWER(?) ESCAPE '\' THEN 'role'
        ELSE 'bio'
      END as match_field,
      t.locale as match_locale,
      CASE
        WHEN LOWER(t.name) LIKE LOWER(?) ESCAPE '\' THEN t.name
        WHEN LOWER(t.role) LIKE LOWER(?) ESCAPE '\' THEN t.role
        ELSE t.bio
      END as match_value
    FROM team_members tm
    JOIN team_member_translations t ON t.team_member_id = tm.id
    LEFT JOIN team_member_translations en_t ON en_t.team_member_id = tm.id AND en_t.locale = 'en'
    WHERE LOWER(t.name) LIKE LOWER(?) ESCAPE '\'
       OR LOWER(t.role) LIKE LOWER(?) ESCAPE '\'
       OR LOWER(t.bio) LIKE LOWER(?) ESCAPE '\'
    LIMIT 10
  `;
  return query<RawSearchResult>(sql, [
    searchPattern, searchPattern, searchPattern, searchPattern,
    searchPattern, searchPattern, searchPattern,
  ]);
}

// Searches name, client_type, and industry only (not challenge/solution/result — too large for LIKE scans)
async function searchProjects(searchPattern: string): Promise<RawSearchResult[]> {
  const sql = `
    SELECT
      p.id as entity_id,
      COALESCE(en_t.name, t.name) as display_name,
      CASE
        WHEN LOWER(t.name) LIKE LOWER(?) ESCAPE '\' THEN 'name'
        WHEN LOWER(t.client_type) LIKE LOWER(?) ESCAPE '\' THEN 'client_type'
        ELSE 'industry'
      END as match_field,
      t.locale as match_locale,
      CASE
        WHEN LOWER(t.name) LIKE LOWER(?) ESCAPE '\' THEN t.name
        WHEN LOWER(t.client_type) LIKE LOWER(?) ESCAPE '\' THEN t.client_type
        ELSE t.industry
      END as match_value
    FROM projects p
    JOIN project_translations t ON t.project_id = p.id
    LEFT JOIN project_translations en_t ON en_t.project_id = p.id AND en_t.locale = 'en'
    WHERE LOWER(t.name) LIKE LOWER(?) ESCAPE '\'
       OR LOWER(t.client_type) LIKE LOWER(?) ESCAPE '\'
       OR LOWER(t.industry) LIKE LOWER(?) ESCAPE '\'
    LIMIT 10
  `;
  return query<RawSearchResult>(sql, [
    searchPattern, searchPattern,
    searchPattern, searchPattern,
    searchPattern, searchPattern, searchPattern,
  ]);
}

async function searchCompanies(searchPattern: string): Promise<RawSearchResult[]> {
  const sql = `
    SELECT
      c.id as entity_id,
      COALESCE(en_t.name, t.name) as display_name,
      CASE
        WHEN LOWER(t.name) LIKE LOWER(?) ESCAPE '\' THEN 'name'
        ELSE 'description'
      END as match_field,
      t.locale as match_locale,
      CASE
        WHEN LOWER(t.name) LIKE LOWER(?) ESCAPE '\' THEN t.name
        ELSE t.description
      END as match_value
    FROM companies c
    JOIN company_translations t ON t.company_id = c.id
    LEFT JOIN company_translations en_t ON en_t.company_id = c.id AND en_t.locale = 'en'
    WHERE LOWER(t.name) LIKE LOWER(?) ESCAPE '\'
       OR LOWER(t.description) LIKE LOWER(?) ESCAPE '\'
    LIMIT 10
  `;
  return query<RawSearchResult>(sql, [
    searchPattern, searchPattern, searchPattern, searchPattern,
  ]);
}

async function searchServices(searchPattern: string): Promise<RawSearchResult[]> {
  const sql = `
    SELECT
      s.id as entity_id,
      COALESCE(en_t.title, t.title) as display_name,
      CASE
        WHEN LOWER(t.title) LIKE LOWER(?) ESCAPE '\' THEN 'title'
        WHEN LOWER(t.description) LIKE LOWER(?) ESCAPE '\' THEN 'description'
        WHEN LOWER(t.details) LIKE LOWER(?) ESCAPE '\' THEN 'details'
        ELSE 'note'
      END as match_field,
      t.locale as match_locale,
      CASE
        WHEN LOWER(t.title) LIKE LOWER(?) ESCAPE '\' THEN t.title
        WHEN LOWER(t.description) LIKE LOWER(?) ESCAPE '\' THEN t.description
        WHEN LOWER(t.details) LIKE LOWER(?) ESCAPE '\' THEN t.details
        ELSE t.note
      END as match_value
    FROM services s
    JOIN service_translations t ON t.service_id = s.id
    LEFT JOIN service_translations en_t ON en_t.service_id = s.id AND en_t.locale = 'en'
    WHERE LOWER(t.title) LIKE LOWER(?) ESCAPE '\'
       OR LOWER(t.description) LIKE LOWER(?) ESCAPE '\'
       OR LOWER(t.details) LIKE LOWER(?) ESCAPE '\'
       OR LOWER(t.note) LIKE LOWER(?) ESCAPE '\'
    LIMIT 10
  `;
  // CASE match_field: 3, CASE match_value: 3, WHERE: 4 = 10 params
  return query<RawSearchResult>(sql, [
    searchPattern, searchPattern, searchPattern,
    searchPattern, searchPattern, searchPattern,
    searchPattern, searchPattern, searchPattern, searchPattern,
  ]);
}

async function searchSubservices(searchPattern: string): Promise<RawSearchResult[]> {
  const sql = `
    SELECT
      sub.service_id as entity_id,
      COALESCE(en_t.title, t.title) || ' (subservice)' as display_name,
      CASE
        WHEN LOWER(t.title) LIKE LOWER(?) ESCAPE '\' THEN 'subservice title'
        ELSE 'subservice description'
      END as match_field,
      t.locale as match_locale,
      CASE
        WHEN LOWER(t.title) LIKE LOWER(?) ESCAPE '\' THEN t.title
        ELSE t.description
      END as match_value,
      sub.slug as subservice_slug
    FROM subservices sub
    JOIN subservice_translations t ON t.subservice_id = sub.id
    LEFT JOIN subservice_translations en_t ON en_t.subservice_id = sub.id AND en_t.locale = 'en'
    WHERE LOWER(t.title) LIKE LOWER(?) ESCAPE '\'
       OR LOWER(t.description) LIKE LOWER(?) ESCAPE '\'
    LIMIT 10
  `;
  return query<RawSearchResult>(sql, [
    searchPattern, searchPattern, searchPattern, searchPattern,
  ]);
}

async function searchFaq(searchPattern: string): Promise<RawSearchResult[]> {
  const sql = `
    SELECT
      f.id as entity_id,
      COALESCE(en_t.question, t.question) as display_name,
      CASE
        WHEN LOWER(t.question) LIKE LOWER(?) ESCAPE '\' THEN 'question'
        ELSE 'answer'
      END as match_field,
      t.locale as match_locale,
      CASE
        WHEN LOWER(t.question) LIKE LOWER(?) ESCAPE '\' THEN t.question
        ELSE t.answer
      END as match_value
    FROM faq_items f
    JOIN faq_translations t ON t.faq_id = f.id
    LEFT JOIN faq_translations en_t ON en_t.faq_id = f.id AND en_t.locale = 'en'
    WHERE LOWER(t.question) LIKE LOWER(?) ESCAPE '\'
       OR LOWER(t.answer) LIKE LOWER(?) ESCAPE '\'
    LIMIT 10
  `;
  return query<RawSearchResult>(sql, [
    searchPattern, searchPattern, searchPattern, searchPattern,
  ]);
}

// Searches title, excerpt, and meta fields only (not content — too large for LIKE scans)
async function searchPosts(searchPattern: string): Promise<RawSearchResult[]> {
  const sql = `
    SELECT
      p.id as entity_id,
      COALESCE(en_t.title, t.title) as display_name,
      CASE
        WHEN LOWER(t.title) LIKE LOWER(?) ESCAPE '\' THEN 'title'
        WHEN LOWER(t.excerpt) LIKE LOWER(?) ESCAPE '\' THEN 'excerpt'
        WHEN LOWER(t.meta_title) LIKE LOWER(?) ESCAPE '\' THEN 'meta_title'
        ELSE 'meta_description'
      END as match_field,
      t.locale as match_locale,
      CASE
        WHEN LOWER(t.title) LIKE LOWER(?) ESCAPE '\' THEN t.title
        WHEN LOWER(t.excerpt) LIKE LOWER(?) ESCAPE '\' THEN t.excerpt
        WHEN LOWER(t.meta_title) LIKE LOWER(?) ESCAPE '\' THEN t.meta_title
        ELSE t.meta_description
      END as match_value
    FROM posts p
    JOIN post_translations t ON t.post_id = p.id
    LEFT JOIN post_translations en_t ON en_t.post_id = p.id AND en_t.locale = 'en'
    WHERE LOWER(t.title) LIKE LOWER(?) ESCAPE '\'
       OR LOWER(t.excerpt) LIKE LOWER(?) ESCAPE '\'
       OR LOWER(t.meta_title) LIKE LOWER(?) ESCAPE '\'
       OR LOWER(t.meta_description) LIKE LOWER(?) ESCAPE '\'
    LIMIT 10
  `;
  return query<RawSearchResult>(sql, [
    searchPattern, searchPattern, searchPattern,
    searchPattern, searchPattern, searchPattern,
    searchPattern, searchPattern, searchPattern, searchPattern,
  ]);
}

export async function searchAllEntities(searchQuery: string): Promise<SearchResult[]> {
  if (!searchQuery || searchQuery.length < 2) {
    return [];
  }

  const searchPattern = `%${escapeLikePattern(searchQuery)}%`;

  // Run all searches in parallel
  const [team, projects, companies, services, subservices, faq, posts] = await Promise.all([
    searchTeam(searchPattern),
    searchProjects(searchPattern),
    searchCompanies(searchPattern),
    searchServices(searchPattern),
    searchSubservices(searchPattern),
    searchFaq(searchPattern),
    searchPosts(searchPattern),
  ]);

  // Combine results with entity type
  const allResults: Array<RawSearchResult & { entityType: SearchResult['entityType'] }> = [
    ...team.map(r => ({ ...r, entityType: 'team' as const })),
    ...projects.map(r => ({ ...r, entityType: 'projects' as const })),
    ...companies.map(r => ({ ...r, entityType: 'companies' as const })),
    ...services.map(r => ({ ...r, entityType: 'services' as const })),
    ...subservices.map(r => ({ ...r, entityType: 'services' as const })),
    ...faq.map(r => ({ ...r, entityType: 'faq' as const })),
    ...posts.map(r => ({ ...r, entityType: 'posts' as const })),
  ];

  // Deduplicate by entity_type + entity_id + subservice_slug (keep first match)
  const seen = new Set<string>();
  const deduplicated: SearchResult[] = [];

  for (const row of allResults) {
    // Include subservice_slug in the key so subservices are shown separately
    const key = `${row.entityType}-${row.entity_id}-${row.subservice_slug || ''}`;
    if (!seen.has(key)) {
      seen.add(key);
      deduplicated.push({
        entityType: row.entityType,
        entityId: row.entity_id,
        displayName: row.display_name || 'Untitled',
        matchField: row.match_field,
        matchLocale: row.match_locale,
        matchExcerpt: createExcerpt(row.match_value || '', searchQuery),
        editUrl: getEditUrl(row.entityType, row.entity_id, row.subservice_slug),
        subserviceSlug: row.subservice_slug,
      });
    }
  }

  return deduplicated;
}
