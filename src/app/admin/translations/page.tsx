'use client';

import { useEffect, useState } from 'react';
import { locales, localeNames } from '@/i18n/config';

interface TranslationData {
  namespaces: string[];
  keys: Array<{ namespace: string; key: string }>;
}

interface TranslationValue {
  id?: number;
  key: string;
  namespace: string;
  locale: string;
  value: string;
}

export default function TranslationsPage() {
  const [data, setData] = useState<TranslationData | null>(null);
  const [selectedNamespace, setSelectedNamespace] = useState<string>('');
  const [translations, setTranslations] = useState<TranslationValue[]>([]);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  useEffect(() => {
    fetchOverview();
  }, []);

  useEffect(() => {
    if (selectedNamespace) {
      fetchNamespaceTranslations(selectedNamespace);
    }
  }, [selectedNamespace]);

  const fetchOverview = async () => {
    try {
      const res = await fetch('/api/admin/translations');
      if (!res.ok) throw new Error('Failed to fetch');
      const d = await res.json();
      setData(d);
      if (d.namespaces.length > 0) {
        setSelectedNamespace(d.namespaces[0]);
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Error');
    } finally {
      setLoading(false);
    }
  };

  const fetchNamespaceTranslations = async (ns: string) => {
    try {
      const res = await fetch(`/api/admin/translations?namespace=${ns}`);
      if (!res.ok) throw new Error('Failed to fetch');
      setTranslations(await res.json());
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Error');
    }
  };

  const handleSave = async () => {
    setSaving(true);
    setError(null);
    setSuccess(null);
    try {
      const res = await fetch('/api/admin/translations', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(translations),
      });
      if (!res.ok) throw new Error('Failed to save');
      setSuccess('Translations saved successfully');
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Save failed');
    } finally {
      setSaving(false);
    }
  };

  const updateTranslation = (key: string, locale: string, value: string) => {
    setTranslations((prev) => {
      const existing = prev.find((t) => t.key === key && t.locale === locale);
      if (existing) {
        return prev.map((t) =>
          t.key === key && t.locale === locale ? { ...t, value } : t
        );
      }
      return [...prev, { key, namespace: selectedNamespace, locale, value }];
    });
  };

  const getTranslation = (key: string, locale: string): string => {
    return translations.find((t) => t.key === key && t.locale === locale)?.value ?? '';
  };

  if (loading) return <div className="text-brand-400">Loading...</div>;
  if (!data) return <div className="text-red-400">Failed to load translations</div>;

  // Get unique keys for the selected namespace
  const namespaceKeys = [...new Set(
    translations.filter((t) => t.namespace === selectedNamespace).map((t) => t.key)
  )].sort();

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-white">Translations</h1>
          <p className="text-brand-400 text-sm mt-1">Manage UI text and localization</p>
        </div>
        <button
          onClick={handleSave}
          disabled={saving}
          className="px-4 py-2 text-sm font-medium text-white bg-brand-600 hover:bg-brand-500 disabled:opacity-50 rounded-lg transition-colors"
        >
          {saving ? 'Saving...' : 'Save All'}
        </button>
      </div>

      {error && <div className="mb-4 p-4 bg-red-500/20 border border-red-500/50 rounded-lg text-red-400">{error}</div>}
      {success && <div className="mb-4 p-4 bg-green-500/20 border border-green-500/50 rounded-lg text-green-400">{success}</div>}

      <div className="mb-6">
        <label className="text-sm font-medium text-brand-200 mb-2 block">Namespace</label>
        <div className="flex flex-wrap gap-2">
          {data.namespaces.map((ns) => (
            <button
              key={ns}
              onClick={() => setSelectedNamespace(ns)}
              className={`px-3 py-1.5 text-sm rounded-lg transition-colors ${
                selectedNamespace === ns
                  ? 'bg-brand-600 text-white'
                  : 'bg-brand-800/50 text-brand-300 hover:bg-brand-700/50'
              }`}
            >
              {ns}
            </button>
          ))}
        </div>
      </div>

      {namespaceKeys.length === 0 ? (
        <div className="bg-brand-900/60 rounded-lg border border-brand-700/50 p-8 text-center">
          <p className="text-brand-400">No translations in this namespace</p>
        </div>
      ) : (
        <div className="space-y-6">
          {namespaceKeys.map((key) => (
            <div key={key} className="bg-brand-900/60 rounded-lg border border-brand-700/50 p-4">
              <div className="text-sm font-medium text-brand-300 mb-3 font-mono">{key}</div>
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                {locales.map((locale) => (
                  <div key={locale}>
                    <label className="text-xs text-brand-400 mb-1 block">{localeNames[locale]}</label>
                    {getTranslation(key, locale).length > 100 ? (
                      <textarea
                        value={getTranslation(key, locale)}
                        onChange={(e) => updateTranslation(key, locale, e.target.value)}
                        rows={3}
                        className="w-full px-3 py-2 text-sm rounded-lg border border-brand-700/50 bg-brand-900/60 text-white placeholder:text-brand-500 focus:outline-none focus:ring-2 focus:ring-brand-400/30 focus:border-brand-400/50 resize-none"
                      />
                    ) : (
                      <input
                        type="text"
                        value={getTranslation(key, locale)}
                        onChange={(e) => updateTranslation(key, locale, e.target.value)}
                        className="w-full px-3 py-2 text-sm rounded-lg border border-brand-700/50 bg-brand-900/60 text-white placeholder:text-brand-500 focus:outline-none focus:ring-2 focus:ring-brand-400/30 focus:border-brand-400/50"
                      />
                    )}
                  </div>
                ))}
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
