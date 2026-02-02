import { query, queryFirst, execute, batch, buildUpdateStatement } from './client';
import type { Locale } from './schema';
import type {
  Company,
  CompanyTranslation,
  CompanyWithTranslations,
  CompanyLocalized,
  CompanyInput,
} from './schema';

export async function getCompanies(): Promise<Company[]> {
  return query<Company>(
    'SELECT * FROM companies WHERE is_active = 1 ORDER BY sort_order ASC'
  );
}

export async function getCompanyById(id: number): Promise<Company | null> {
  return queryFirst<Company>('SELECT * FROM companies WHERE id = ?', [id]);
}

export async function getCompanyBySlug(slug: string): Promise<Company | null> {
  return queryFirst<Company>('SELECT * FROM companies WHERE slug = ?', [slug]);
}

export async function getCompanyTranslations(companyId: number): Promise<CompanyTranslation[]> {
  return query<CompanyTranslation>(
    'SELECT * FROM company_translations WHERE company_id = ?',
    [companyId]
  );
}

export async function getCompanyWithTranslations(id: number): Promise<CompanyWithTranslations | null> {
  const company = await getCompanyById(id);
  if (!company) return null;

  const translations = await getCompanyTranslations(id);
  const translationsMap = translations.reduce((acc, t) => {
    acc[t.locale as Locale] = t;
    return acc;
  }, {} as Record<Locale, CompanyTranslation | undefined>);

  return { ...company, translations: translationsMap };
}

export async function getAllCompaniesWithTranslations(): Promise<CompanyWithTranslations[]> {
  const companies = await query<Company>(
    'SELECT * FROM companies ORDER BY sort_order ASC'
  );

  const result: CompanyWithTranslations[] = [];
  for (const company of companies) {
    const translations = await getCompanyTranslations(company.id);
    const translationsMap = translations.reduce((acc, t) => {
      acc[t.locale as Locale] = t;
      return acc;
    }, {} as Record<Locale, CompanyTranslation | undefined>);
    result.push({ ...company, translations: translationsMap });
  }
  return result;
}

export async function getCompaniesLocalized(locale: Locale): Promise<CompanyLocalized[]> {
  // Use LEFT JOIN with COALESCE to fall back to English if translation is missing
  const rows = await query<Company & CompanyTranslation>(
    `SELECT c.*,
       COALESCE(t.name, t_en.name) as name,
       COALESCE(t.description, t_en.description) as description
     FROM companies c
     LEFT JOIN company_translations t ON t.company_id = c.id AND t.locale = ?
     LEFT JOIN company_translations t_en ON t_en.company_id = c.id AND t_en.locale = 'en'
     WHERE c.is_active = 1
     ORDER BY c.sort_order ASC`,
    [locale]
  );

  return rows.map((row) => ({
    id: row.id,
    slug: row.slug,
    name: row.name,
    description: row.description,
    logo: row.logo_path,
    url: row.external_url,
  }));
}

export async function createCompany(input: CompanyInput): Promise<number> {
  const result = await execute(
    `INSERT INTO companies (slug, logo_path, external_url, sort_order, is_active)
     VALUES (?, ?, ?, ?, ?)`,
    [
      input.slug,
      input.logo_path ?? null,
      input.external_url ?? null,
      input.sort_order ?? 0,
      input.is_active ?? 1,
    ]
  );

  const companyId = result.lastRowId;

  // Insert translations
  const translationStatements = Object.entries(input.translations).map(([locale, t]) => ({
    sql: `INSERT INTO company_translations (company_id, locale, name, description) VALUES (?, ?, ?, ?)`,
    params: [companyId, locale, t!.name, t!.description ?? null],
  }));

  if (translationStatements.length > 0) {
    await batch(translationStatements);
  }

  return companyId;
}

export async function updateCompany(id: number, input: Partial<CompanyInput>): Promise<void> {
  const statements: { sql: string; params: unknown[] }[] = [];

  const baseUpdate = buildUpdateStatement('companies', id, {
    slug: input.slug,
    logo_path: input.logo_path,
    external_url: input.external_url,
    sort_order: input.sort_order,
    is_active: input.is_active,
  });
  if (baseUpdate) statements.push(baseUpdate);

  if (input.translations) {
    for (const [locale, t] of Object.entries(input.translations)) {
      if (t) {
        statements.push({
          sql: `INSERT INTO company_translations (company_id, locale, name, description)
                VALUES (?, ?, ?, ?)
                ON CONFLICT(company_id, locale) DO UPDATE SET
                  name = excluded.name,
                  description = excluded.description`,
          params: [id, locale, t.name, t.description ?? null],
        });
      }
    }
  }

  if (statements.length > 0) {
    await batch(statements);
  }
}

export async function deleteCompany(id: number): Promise<void> {
  await execute('DELETE FROM companies WHERE id = ?', [id]);
}
