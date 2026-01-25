import { query, queryFirst, execute, batch } from './client';
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
  const updates: string[] = [];
  const values: unknown[] = [];

  if (input.slug !== undefined) {
    updates.push('slug = ?');
    values.push(input.slug);
  }
  if (input.logo_path !== undefined) {
    updates.push('logo_path = ?');
    values.push(input.logo_path);
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
    await execute(`UPDATE companies SET ${updates.join(', ')} WHERE id = ?`, values);
  }

  // Update translations
  if (input.translations) {
    for (const [locale, t] of Object.entries(input.translations)) {
      if (t) {
        await execute(
          `INSERT INTO company_translations (company_id, locale, name, description)
           VALUES (?, ?, ?, ?)
           ON CONFLICT(company_id, locale) DO UPDATE SET
             name = excluded.name,
             description = excluded.description`,
          [id, locale, t.name, t.description ?? null]
        );
      }
    }
  }
}

export async function deleteCompany(id: number): Promise<void> {
  await execute('DELETE FROM companies WHERE id = ?', [id]);
}
