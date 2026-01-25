import { query, queryFirst, execute, batch } from './client';
import type { Locale } from '@/i18n/config';
import type {
  Service,
  ServiceTranslation,
  ServiceTechnology,
  Subservice,
  SubserviceTranslation,
  ServiceWithTranslations,
  ServiceLocalized,
  ServiceInput,
} from './schema';

export async function getServices(): Promise<Service[]> {
  return query<Service>(
    'SELECT * FROM services WHERE is_active = 1 ORDER BY sort_order ASC'
  );
}

export async function getServiceById(id: number): Promise<Service | null> {
  return queryFirst<Service>('SELECT * FROM services WHERE id = ?', [id]);
}

export async function getServiceBySlug(slug: string): Promise<Service | null> {
  return queryFirst<Service>('SELECT * FROM services WHERE slug = ?', [slug]);
}

export async function getServiceTranslations(serviceId: number): Promise<ServiceTranslation[]> {
  return query<ServiceTranslation>(
    'SELECT * FROM service_translations WHERE service_id = ?',
    [serviceId]
  );
}

export async function getServiceTechnologies(serviceId: number): Promise<string[]> {
  const rows = await query<ServiceTechnology>(
    'SELECT technology FROM service_technologies WHERE service_id = ? ORDER BY sort_order ASC',
    [serviceId]
  );
  return rows.map((r) => r.technology);
}

export async function getSubservices(serviceId: number): Promise<Subservice[]> {
  return query<Subservice>(
    'SELECT * FROM subservices WHERE service_id = ? ORDER BY sort_order ASC',
    [serviceId]
  );
}

export async function getSubserviceTranslations(subserviceId: number): Promise<SubserviceTranslation[]> {
  return query<SubserviceTranslation>(
    'SELECT * FROM subservice_translations WHERE subservice_id = ?',
    [subserviceId]
  );
}

export async function getServiceWithTranslations(id: number): Promise<ServiceWithTranslations | null> {
  const service = await getServiceById(id);
  if (!service) return null;

  const [translations, technologies, subservices] = await Promise.all([
    getServiceTranslations(id),
    getServiceTechnologies(id),
    getSubservices(id),
  ]);

  const translationsMap = translations.reduce((acc, t) => {
    acc[t.locale as Locale] = t;
    return acc;
  }, {} as Record<Locale, ServiceTranslation | undefined>);

  const subservicesWithTranslations = await Promise.all(
    subservices.map(async (sub) => {
      const subTranslations = await getSubserviceTranslations(sub.id);
      const subTranslationsMap = subTranslations.reduce((acc, t) => {
        acc[t.locale as Locale] = t;
        return acc;
      }, {} as Record<Locale, SubserviceTranslation | undefined>);
      return { ...sub, translations: subTranslationsMap };
    })
  );

  return { ...service, translations: translationsMap, technologies, subservices: subservicesWithTranslations };
}

export async function getAllServicesWithTranslations(): Promise<ServiceWithTranslations[]> {
  const services = await query<Service>(
    'SELECT * FROM services ORDER BY sort_order ASC'
  );

  const result: ServiceWithTranslations[] = [];
  for (const service of services) {
    const fullService = await getServiceWithTranslations(service.id);
    if (fullService) result.push(fullService);
  }
  return result;
}

export async function getServicesLocalized(locale: Locale, category?: string): Promise<ServiceLocalized[]> {
  // Use LEFT JOIN with COALESCE to fall back to English if translation is missing
  const sql = `SELECT s.*,
       COALESCE(t.title, t_en.title) as title,
       COALESCE(t.description, t_en.description) as description,
       COALESCE(t.details, t_en.details) as details,
       COALESCE(t.note, t_en.note) as note
     FROM services s
     LEFT JOIN service_translations t ON t.service_id = s.id AND t.locale = ?
     LEFT JOIN service_translations t_en ON t_en.service_id = s.id AND t_en.locale = 'en'
     WHERE s.is_active = 1${category ? ' AND s.category = ?' : ''}
     ORDER BY s.sort_order ASC`;

  const rows = await query<Service & ServiceTranslation>(
    sql,
    category ? [locale, category] : [locale]
  );

  const result: ServiceLocalized[] = [];
  for (const row of rows) {
    const [technologies, subservices] = await Promise.all([
      getServiceTechnologies(row.id),
      // Also apply fallback for subservice translations
      query<Subservice & SubserviceTranslation>(
        `SELECT sub.*,
           COALESCE(st.title, st_en.title) as title,
           COALESCE(st.description, st_en.description) as description
         FROM subservices sub
         LEFT JOIN subservice_translations st ON st.subservice_id = sub.id AND st.locale = ?
         LEFT JOIN subservice_translations st_en ON st_en.subservice_id = sub.id AND st_en.locale = 'en'
         WHERE sub.service_id = ?
         ORDER BY sub.sort_order ASC`,
        [locale, row.id]
      ),
    ]);

    result.push({
      id: row.slug,
      slug: row.slug,
      category: row.category,
      title: row.title,
      description: row.description,
      details: row.details,
      note: row.note,
      technologies,
      subservices: subservices.map((sub) => ({
        title: sub.title,
        description: sub.description,
      })),
    });
  }

  return result;
}

export async function createService(input: ServiceInput): Promise<number> {
  const result = await execute(
    `INSERT INTO services (slug, icon, category, sort_order, is_active)
     VALUES (?, ?, ?, ?, ?)`,
    [
      input.slug,
      input.icon ?? null,
      input.category,
      input.sort_order ?? 0,
      input.is_active ?? 1,
    ]
  );

  const serviceId = result.lastRowId;

  // Insert translations
  const translationStatements = Object.entries(input.translations).map(([locale, t]) => ({
    sql: `INSERT INTO service_translations (service_id, locale, title, description, details, note)
          VALUES (?, ?, ?, ?, ?, ?)`,
    params: [serviceId, locale, t!.title, t!.description ?? null, t!.details ?? null, t!.note ?? null],
  }));

  // Insert technologies
  const techStatements = input.technologies.map((tech, idx) => ({
    sql: `INSERT INTO service_technologies (service_id, technology, sort_order) VALUES (?, ?, ?)`,
    params: [serviceId, tech, idx],
  }));

  const allStatements = [...translationStatements, ...techStatements];
  if (allStatements.length > 0) {
    await batch(allStatements);
  }

  // Insert subservices
  for (let i = 0; i < input.subservices.length; i++) {
    const sub = input.subservices[i];
    const subResult = await execute(
      `INSERT INTO subservices (service_id, slug, sort_order) VALUES (?, ?, ?)`,
      [serviceId, sub.slug, sub.sort_order ?? i]
    );
    const subserviceId = subResult.lastRowId;

    const subTranslationStatements = Object.entries(sub.translations).map(([locale, t]) => ({
      sql: `INSERT INTO subservice_translations (subservice_id, locale, title, description) VALUES (?, ?, ?, ?)`,
      params: [subserviceId, locale, t!.title, t!.description ?? null],
    }));

    if (subTranslationStatements.length > 0) {
      await batch(subTranslationStatements);
    }
  }

  return serviceId;
}

export async function updateService(id: number, input: Partial<ServiceInput>): Promise<void> {
  const updates: string[] = [];
  const values: unknown[] = [];

  if (input.slug !== undefined) {
    updates.push('slug = ?');
    values.push(input.slug);
  }
  if (input.icon !== undefined) {
    updates.push('icon = ?');
    values.push(input.icon);
  }
  if (input.category !== undefined) {
    updates.push('category = ?');
    values.push(input.category);
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
    await execute(`UPDATE services SET ${updates.join(', ')} WHERE id = ?`, values);
  }

  // Update translations
  if (input.translations) {
    for (const [locale, t] of Object.entries(input.translations)) {
      if (t) {
        await execute(
          `INSERT INTO service_translations (service_id, locale, title, description, details, note)
           VALUES (?, ?, ?, ?, ?, ?)
           ON CONFLICT(service_id, locale) DO UPDATE SET
             title = excluded.title,
             description = excluded.description,
             details = excluded.details,
             note = excluded.note`,
          [id, locale, t.title, t.description ?? null, t.details ?? null, t.note ?? null]
        );
      }
    }
  }

  // Update technologies
  if (input.technologies !== undefined) {
    await execute('DELETE FROM service_technologies WHERE service_id = ?', [id]);
    const techStatements = input.technologies.map((tech, idx) => ({
      sql: `INSERT INTO service_technologies (service_id, technology, sort_order) VALUES (?, ?, ?)`,
      params: [id, tech, idx],
    }));
    if (techStatements.length > 0) {
      await batch(techStatements);
    }
  }

  // Update subservices (full replace)
  if (input.subservices !== undefined) {
    await execute('DELETE FROM subservices WHERE service_id = ?', [id]);
    for (let i = 0; i < input.subservices.length; i++) {
      const sub = input.subservices[i];
      const subResult = await execute(
        `INSERT INTO subservices (service_id, slug, sort_order) VALUES (?, ?, ?)`,
        [id, sub.slug, sub.sort_order ?? i]
      );
      const subserviceId = subResult.lastRowId;

      const subTranslationStatements = Object.entries(sub.translations).map(([locale, t]) => ({
        sql: `INSERT INTO subservice_translations (subservice_id, locale, title, description) VALUES (?, ?, ?, ?)`,
        params: [subserviceId, locale, t!.title, t!.description ?? null],
      }));

      if (subTranslationStatements.length > 0) {
        await batch(subTranslationStatements);
      }
    }
  }
}

export async function deleteService(id: number): Promise<void> {
  await execute('DELETE FROM services WHERE id = ?', [id]);
}
