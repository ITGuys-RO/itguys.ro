import { query, queryFirst, execute, batch } from './client';
import type { Locale } from '@/i18n/config';
import type { Translation, Setting, TranslationInput } from './schema';

// UI Translations
export async function getTranslations(namespace: string, locale: Locale): Promise<Record<string, string>> {
  const rows = await query<Translation>(
    'SELECT key, value FROM translations WHERE namespace = ? AND locale = ?',
    [namespace, locale]
  );

  return rows.reduce((acc, row) => {
    acc[row.key] = row.value;
    return acc;
  }, {} as Record<string, string>);
}

export async function getAllTranslations(locale: Locale): Promise<Record<string, Record<string, string>>> {
  const rows = await query<Translation>(
    'SELECT namespace, key, value FROM translations WHERE locale = ?',
    [locale]
  );

  return rows.reduce((acc, row) => {
    if (!acc[row.namespace]) {
      acc[row.namespace] = {};
    }
    acc[row.namespace][row.key] = row.value;
    return acc;
  }, {} as Record<string, Record<string, string>>);
}

export async function getTranslationsByNamespace(namespace: string): Promise<Translation[]> {
  return query<Translation>(
    'SELECT * FROM translations WHERE namespace = ? ORDER BY key ASC, locale ASC',
    [namespace]
  );
}

export async function getAllTranslationKeys(): Promise<Array<{ namespace: string; key: string }>> {
  return query<{ namespace: string; key: string }>(
    'SELECT DISTINCT namespace, key FROM translations ORDER BY namespace ASC, key ASC'
  );
}

export async function getNamespaces(): Promise<string[]> {
  const rows = await query<{ namespace: string }>(
    'SELECT DISTINCT namespace FROM translations ORDER BY namespace ASC'
  );
  return rows.map((r) => r.namespace);
}

export async function setTranslation(input: TranslationInput): Promise<void> {
  await execute(
    `INSERT INTO translations (key, namespace, locale, value, updated_at)
     VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP)
     ON CONFLICT(key, namespace, locale) DO UPDATE SET
       value = excluded.value,
       updated_at = CURRENT_TIMESTAMP`,
    [input.key, input.namespace, input.locale, input.value]
  );
}

export async function setTranslations(inputs: TranslationInput[]): Promise<void> {
  const statements = inputs.map((input) => ({
    sql: `INSERT INTO translations (key, namespace, locale, value, updated_at)
          VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP)
          ON CONFLICT(key, namespace, locale) DO UPDATE SET
            value = excluded.value,
            updated_at = CURRENT_TIMESTAMP`,
    params: [input.key, input.namespace, input.locale, input.value],
  }));

  if (statements.length > 0) {
    await batch(statements);
  }
}

export async function deleteTranslation(namespace: string, key: string, locale?: Locale): Promise<void> {
  if (locale) {
    await execute(
      'DELETE FROM translations WHERE namespace = ? AND key = ? AND locale = ?',
      [namespace, key, locale]
    );
  } else {
    await execute(
      'DELETE FROM translations WHERE namespace = ? AND key = ?',
      [namespace, key]
    );
  }
}

// Site Settings
export async function getSetting(key: string, locale?: Locale | null): Promise<string | null> {
  const row = await queryFirst<Setting>(
    locale
      ? 'SELECT value FROM settings WHERE key = ? AND locale = ?'
      : 'SELECT value FROM settings WHERE key = ? AND locale IS NULL',
    locale ? [key, locale] : [key]
  );
  return row?.value ?? null;
}

export async function getSettings(locale?: Locale | null): Promise<Record<string, string>> {
  const rows = await query<Setting>(
    locale
      ? 'SELECT key, value FROM settings WHERE locale = ?'
      : 'SELECT key, value FROM settings WHERE locale IS NULL',
    locale ? [locale] : []
  );

  return rows.reduce((acc, row) => {
    acc[row.key] = row.value;
    return acc;
  }, {} as Record<string, string>);
}

export async function setSetting(key: string, value: string, locale?: Locale | null): Promise<void> {
  await execute(
    `INSERT INTO settings (key, value, locale)
     VALUES (?, ?, ?)
     ON CONFLICT(key, locale) DO UPDATE SET
       value = excluded.value`,
    [key, value, locale ?? null]
  );
}

export async function deleteSetting(key: string, locale?: Locale | null): Promise<void> {
  if (locale) {
    await execute('DELETE FROM settings WHERE key = ? AND locale = ?', [key, locale]);
  } else {
    await execute('DELETE FROM settings WHERE key = ? AND locale IS NULL', [key]);
  }
}
