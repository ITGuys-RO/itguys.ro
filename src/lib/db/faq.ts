import { query, queryFirst, execute, batch, buildUpdateStatement } from './client';
import type { Locale } from './schema';
import type {
  FaqItem,
  FaqTranslation,
  FaqWithTranslations,
  FaqLocalized,
  FaqInput,
} from './schema';

export async function getFaqItems(): Promise<FaqItem[]> {
  return query<FaqItem>(
    'SELECT * FROM faq_items WHERE is_active = 1 ORDER BY sort_order ASC'
  );
}

export async function getFaqItemById(id: number): Promise<FaqItem | null> {
  return queryFirst<FaqItem>('SELECT * FROM faq_items WHERE id = ?', [id]);
}

export async function getFaqItemBySlug(slug: string): Promise<FaqItem | null> {
  return queryFirst<FaqItem>('SELECT * FROM faq_items WHERE slug = ?', [slug]);
}

export async function getFaqTranslations(faqId: number): Promise<FaqTranslation[]> {
  return query<FaqTranslation>(
    'SELECT * FROM faq_translations WHERE faq_id = ?',
    [faqId]
  );
}

export async function getFaqWithTranslations(id: number): Promise<FaqWithTranslations | null> {
  const faq = await getFaqItemById(id);
  if (!faq) return null;

  const translations = await getFaqTranslations(id);
  const translationsMap = translations.reduce((acc, t) => {
    acc[t.locale as Locale] = t;
    return acc;
  }, {} as Record<Locale, FaqTranslation | undefined>);

  return { ...faq, translations: translationsMap };
}

export async function getAllFaqWithTranslations(): Promise<FaqWithTranslations[]> {
  const items = await query<FaqItem>(
    'SELECT * FROM faq_items ORDER BY sort_order ASC'
  );

  const result: FaqWithTranslations[] = [];
  for (const item of items) {
    const translations = await getFaqTranslations(item.id);
    const translationsMap = translations.reduce((acc, t) => {
      acc[t.locale as Locale] = t;
      return acc;
    }, {} as Record<Locale, FaqTranslation | undefined>);
    result.push({ ...item, translations: translationsMap });
  }
  return result;
}

export async function getFaqLocalized(locale: Locale, category?: string): Promise<FaqLocalized[]> {
  // Use LEFT JOIN with COALESCE to fall back to English if translation is missing
  let sql = `
    SELECT f.*,
      COALESCE(t.question, t_en.question) as question,
      COALESCE(t.answer, t_en.answer) as answer
    FROM faq_items f
    LEFT JOIN faq_translations t ON t.faq_id = f.id AND t.locale = ?
    LEFT JOIN faq_translations t_en ON t_en.faq_id = f.id AND t_en.locale = 'en'
    WHERE f.is_active = 1
  `;
  const params: unknown[] = [locale];

  if (category) {
    sql += ' AND f.category = ?';
    params.push(category);
  }

  sql += ' ORDER BY f.sort_order ASC';

  const rows = await query<FaqItem & FaqTranslation>(sql, params);

  return rows.map((row) => ({
    id: row.id,
    slug: row.slug,
    category: row.category,
    question: row.question,
    answer: row.answer,
  }));
}

export async function createFaq(input: FaqInput): Promise<number> {
  const result = await execute(
    `INSERT INTO faq_items (slug, category, sort_order, is_active)
     VALUES (?, ?, ?, ?)`,
    [
      input.slug,
      input.category ?? null,
      input.sort_order ?? 0,
      input.is_active ?? 1,
    ]
  );

  const faqId = result.lastRowId;

  // Insert translations
  const translationStatements = Object.entries(input.translations).map(([locale, t]) => ({
    sql: `INSERT INTO faq_translations (faq_id, locale, question, answer) VALUES (?, ?, ?, ?)`,
    params: [faqId, locale, t!.question, t!.answer],
  }));

  if (translationStatements.length > 0) {
    await batch(translationStatements);
  }

  return faqId;
}

export async function updateFaq(id: number, input: Partial<FaqInput>): Promise<void> {
  const statements: { sql: string; params: unknown[] }[] = [];

  const baseUpdate = buildUpdateStatement('faq_items', id, {
    slug: input.slug,
    category: input.category,
    sort_order: input.sort_order,
    is_active: input.is_active,
  });
  if (baseUpdate) statements.push(baseUpdate);

  if (input.translations) {
    for (const [locale, t] of Object.entries(input.translations)) {
      if (t) {
        statements.push({
          sql: `INSERT INTO faq_translations (faq_id, locale, question, answer)
                VALUES (?, ?, ?, ?)
                ON CONFLICT(faq_id, locale) DO UPDATE SET
                  question = excluded.question,
                  answer = excluded.answer`,
          params: [id, locale, t.question, t.answer],
        });
      }
    }
  }

  if (statements.length > 0) {
    await batch(statements);
  }
}

export async function deleteFaq(id: number): Promise<void> {
  await execute('DELETE FROM faq_items WHERE id = ?', [id]);
}
