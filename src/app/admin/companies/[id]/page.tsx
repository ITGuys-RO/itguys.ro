'use client';

import { useEffect, useState, use } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { InputField, TextareaField, CheckboxField, LocaleFields, DeleteButton } from '@/components/admin';
import type { CompanyWithTranslations, CompanyInput } from '@/lib/db';
import type { Locale } from '@/i18n/config';

type TranslationData = { name: string; description: string | null };

export default function EditCompanyPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = use(params);
  const router = useRouter();
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [formData, setFormData] = useState<CompanyInput>({
    slug: '',
    logo_path: '',
    external_url: '',
    sort_order: 0,
    is_active: 1,
    translations: { en: { name: '', description: null } },
  });

  useEffect(() => {
    (async () => {
      try {
        const res = await fetch(`/api/admin/companies/${id}`);
        if (!res.ok) throw new Error('Failed to fetch');
        const company: CompanyWithTranslations = await res.json();
        const translations = Object.fromEntries(
          Object.entries(company.translations).map(([locale, t]) => [
            locale, t ? { name: t.name, description: t.description } : undefined
          ])
        ) as CompanyInput['translations'];

        setFormData({
          slug: company.slug,
          logo_path: company.logo_path,
          external_url: company.external_url,
          sort_order: company.sort_order,
          is_active: company.is_active,
          translations,
        });
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Error');
      } finally {
        setLoading(false);
      }
    })();
  }, [id]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving(true);
    try {
      const res = await fetch(`/api/admin/companies/${id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(formData),
      });
      if (!res.ok) throw new Error('Failed to save');
      router.push('/admin/companies');
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Save failed');
    } finally {
      setSaving(false);
    }
  };

  const handleDelete = async () => {
    await fetch(`/api/admin/companies/${id}`, { method: 'DELETE' });
    router.push('/admin/companies');
  };

  if (loading) return <div className="text-brand-400">Loading...</div>;

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <Link href="/admin/companies" className="text-brand-400 hover:text-white text-sm mb-2 inline-block">&larr; Back</Link>
          <h1 className="text-2xl font-bold text-white">Edit Company</h1>
        </div>
        <DeleteButton itemName="company" onDelete={handleDelete} />
      </div>
      {error && <div className="mb-6 p-4 bg-red-500/20 border border-red-500/50 rounded-lg text-red-400">{error}</div>}
      <form onSubmit={handleSubmit} className="space-y-8">
        <div className="bg-brand-900/60 rounded-lg border border-brand-700/50 p-6">
          <h2 className="text-lg font-semibold text-white mb-4">Basic Information</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <InputField label="Slug" name="slug" value={formData.slug} onChange={(v) => setFormData({ ...formData, slug: v })} required />
            <InputField label="Logo Path" name="logo_path" value={formData.logo_path || ''} onChange={(v) => setFormData({ ...formData, logo_path: v || null })} />
            <InputField label="External URL" name="external_url" type="url" value={formData.external_url || ''} onChange={(v) => setFormData({ ...formData, external_url: v || null })} />
            <InputField label="Sort Order" name="sort_order" type="number" value={formData.sort_order ?? 0} onChange={(v) => setFormData({ ...formData, sort_order: parseInt(v) || 0 })} />
          </div>
          <div className="mt-4">
            <CheckboxField label="Active" name="is_active" checked={formData.is_active === 1} onChange={(c) => setFormData({ ...formData, is_active: c ? 1 : 0 })} />
          </div>
        </div>
        <div className="bg-brand-900/60 rounded-lg border border-brand-700/50 p-6">
          <h2 className="text-lg font-semibold text-white mb-4">Translations</h2>
          <LocaleFields
            translations={formData.translations}
            onChange={(locale, data) => setFormData({ ...formData, translations: { ...formData.translations, [locale]: data } })}
            defaultData={{ name: '', description: '' }}
            renderFields={(locale, data, onChange) => (
              <div className="space-y-4">
                <InputField label="Name" name={`name-${locale}`} value={data.name} onChange={(v) => onChange({ ...data, name: v })} required />
                <TextareaField label="Description" name={`description-${locale}`} value={data.description || ''} onChange={(v) => onChange({ ...data, description: v || null })} rows={3} />
              </div>
            )}
          />
        </div>
        <div className="flex justify-end gap-3">
          <Link href="/admin/companies" className="px-4 py-2 text-sm font-medium text-brand-300 border border-brand-600/50 hover:border-brand-400/50 hover:text-white rounded-lg transition-colors">Cancel</Link>
          <button type="submit" disabled={saving} className="px-4 py-2 text-sm font-medium text-white bg-brand-600 hover:bg-brand-500 disabled:opacity-50 rounded-lg transition-colors">{saving ? 'Saving...' : 'Save'}</button>
        </div>
      </form>
    </div>
  );
}
