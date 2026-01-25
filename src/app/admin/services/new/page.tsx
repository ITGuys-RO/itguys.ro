'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { InputField, TextareaField, CheckboxField, TagInput, LocaleFields, SelectField } from '@/components/admin';
import type { ServiceInput } from '@/lib/db';
import type { Locale } from '@/i18n/config';

type TranslationData = { title: string; description: string | null; details: string | null; note: string | null };

const categories = [
  { value: 'consulting', label: 'Consulting' },
  { value: 'security', label: 'Security' },
  { value: 'development', label: 'Development' },
  { value: 'data-analytics', label: 'Data & Analytics' },
  { value: 'qa-testing', label: 'QA & Testing' },
];

export default function NewServicePage() {
  const router = useRouter();
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [formData, setFormData] = useState<ServiceInput>({
    slug: '',
    icon: '',
    category: 'development',
    sort_order: 0,
    is_active: 1,
    technologies: [],
    subservices: [],
    translations: { en: { title: '', description: null, details: null, note: null } },
  });

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving(true);
    try {
      const res = await fetch('/api/admin/services', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(formData),
      });
      if (!res.ok) throw new Error('Failed to create');
      router.push('/admin/services');
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Create failed');
    } finally {
      setSaving(false);
    }
  };

  return (
    <div>
      <div className="mb-6">
        <Link href="/admin/services" className="text-brand-400 hover:text-white text-sm mb-2 inline-block">&larr; Back</Link>
        <h1 className="text-2xl font-bold text-white">New Service</h1>
      </div>
      {error && <div className="mb-6 p-4 bg-red-500/20 border border-red-500/50 rounded-lg text-red-400">{error}</div>}
      <form onSubmit={handleSubmit} className="space-y-8">
        <div className="bg-brand-900/60 rounded-lg border border-brand-700/50 p-6">
          <h2 className="text-lg font-semibold text-white mb-4">Basic Information</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <InputField label="Slug" name="slug" value={formData.slug} onChange={(v) => setFormData({ ...formData, slug: v })} required />
            <SelectField label="Category" name="category" value={formData.category} onChange={(v) => setFormData({ ...formData, category: v })} options={categories} required />
            <InputField label="Icon" name="icon" value={formData.icon || ''} onChange={(v) => setFormData({ ...formData, icon: v || null })} />
            <InputField label="Sort Order" name="sort_order" type="number" value={formData.sort_order ?? 0} onChange={(v) => setFormData({ ...formData, sort_order: parseInt(v) || 0 })} />
          </div>
          <div className="mt-4">
            <TagInput label="Technologies" value={formData.technologies} onChange={(v) => setFormData({ ...formData, technologies: v })} />
          </div>
          <div className="mt-4">
            <CheckboxField label="Active" name="is_active" checked={formData.is_active === 1} onChange={(c) => setFormData({ ...formData, is_active: c ? 1 : 0 })} />
          </div>
        </div>
        <div className="bg-brand-900/60 rounded-lg border border-brand-700/50 p-6">
          <h2 className="text-lg font-semibold text-white mb-4">Translations</h2>
          <LocaleFields
            translations={formData.translations as Partial<Record<Locale, TranslationData>>}
            onChange={(locale, data) => setFormData({ ...formData, translations: { ...formData.translations, [locale]: data } })}
            defaultData={{ title: '', description: '', details: '', note: '' }}
            renderFields={(locale, data, onChange) => (
              <div className="space-y-4">
                <InputField label="Title" name={`title-${locale}`} value={data.title} onChange={(v) => onChange({ ...data, title: v })} required />
                <TextareaField label="Description" name={`description-${locale}`} value={data.description || ''} onChange={(v) => onChange({ ...data, description: v || null })} rows={2} />
                <TextareaField label="Details" name={`details-${locale}`} value={data.details || ''} onChange={(v) => onChange({ ...data, details: v || null })} rows={3} />
                <InputField label="Note" name={`note-${locale}`} value={data.note || ''} onChange={(v) => onChange({ ...data, note: v || null })} />
              </div>
            )}
          />
        </div>
        <div className="flex justify-end gap-3">
          <Link href="/admin/services" className="px-4 py-2 text-sm font-medium text-brand-300 border border-brand-600/50 hover:border-brand-400/50 hover:text-white rounded-lg transition-colors">Cancel</Link>
          <button type="submit" disabled={saving} className="px-4 py-2 text-sm font-medium text-white bg-brand-600 hover:bg-brand-500 disabled:opacity-50 rounded-lg transition-colors">{saving ? 'Creating...' : 'Create'}</button>
        </div>
      </form>
    </div>
  );
}
