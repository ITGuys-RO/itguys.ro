'use client';

import { useEffect, useState, use } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import Link from 'next/link';
import {
  InputField,
  TextareaField,
  CheckboxField,
  TagInput,
  LocaleFields,
  LocaleTabs,
  DeleteButton,
  SelectField,
  ValidationSummary,
  useFormValidation,
  validateTranslations,
} from '@/components/admin';
import type { ServiceWithTranslations, ServiceInput, SubserviceInput } from '@/lib/db';
import type { Locale } from '@/i18n/config';
import { locales } from '@/i18n/config';
import { TrashIcon, PlusIcon, ChevronDownIcon, ChevronUpIcon } from '@heroicons/react/24/outline';

type TranslationData = { title: string; description: string | null; details: string | null; note: string | null };

function slugify(text: string): string {
  return text
    .toLowerCase()
    .replace(/[^\w\s-]/g, '')
    .replace(/\s+/g, '-')
    .replace(/--+/g, '-')
    .trim();
}

type SubservicesEditorProps = {
  subservices: SubserviceInput[];
  onChange: (subservices: SubserviceInput[]) => void;
  initialExpandedSlug?: string | null;
};

function SubservicesEditor({ subservices, onChange, initialExpandedSlug }: SubservicesEditorProps) {
  const [expandedIndex, setExpandedIndex] = useState<number | null>(() => {
    if (initialExpandedSlug) {
      const index = subservices.findIndex(sub => sub.slug === initialExpandedSlug);
      return index >= 0 ? index : null;
    }
    return null;
  });

  // Update expanded index when initialExpandedSlug changes and subservices are loaded
  useEffect(() => {
    if (initialExpandedSlug && subservices.length > 0) {
      const index = subservices.findIndex(sub => sub.slug === initialExpandedSlug);
      if (index >= 0) {
        setExpandedIndex(index);
      }
    }
  }, [initialExpandedSlug, subservices]);

  const addSubservice = () => {
    const newSubservice: SubserviceInput = {
      slug: '',
      sort_order: subservices.length,
      translations: { en: { title: '', description: null } },
    };
    onChange([...subservices, newSubservice]);
    setExpandedIndex(subservices.length);
  };

  const removeSubservice = (index: number) => {
    if (!confirm('Remove this sub-service?')) return;
    const updated = subservices.filter((_, i) => i !== index);
    onChange(updated);
    setExpandedIndex(null);
  };

  const updateSubservice = (index: number, data: Partial<SubserviceInput>) => {
    const updated = subservices.map((sub, i) => (i === index ? { ...sub, ...data } : sub));
    onChange(updated);
  };

  const updateSubserviceTranslation = (
    index: number,
    locale: Locale,
    data: { title: string; description?: string | null }
  ) => {
    const updated = subservices.map((sub, i) =>
      i === index
        ? { ...sub, translations: { ...sub.translations, [locale]: data } }
        : sub
    );
    onChange(updated);
  };

  const moveSubservice = (index: number, direction: 'up' | 'down') => {
    const newIndex = direction === 'up' ? index - 1 : index + 1;
    if (newIndex < 0 || newIndex >= subservices.length) return;
    const updated = [...subservices];
    [updated[index], updated[newIndex]] = [updated[newIndex], updated[index]];
    updated.forEach((sub, i) => (sub.sort_order = i));
    onChange(updated);
    setExpandedIndex(newIndex);
  };

  return (
    <div className="bg-brand-900/60 rounded-lg border border-brand-700/50 p-6">
      <div className="flex items-center justify-between mb-4">
        <h2 className="text-lg font-semibold text-white">Sub-services</h2>
        <button
          type="button"
          onClick={addSubservice}
          className="flex items-center gap-1 px-3 py-1.5 text-sm font-medium text-neon border border-neon/50 hover:bg-neon/10 rounded-lg transition-colors"
        >
          <PlusIcon className="w-4 h-4" />
          Add Sub-service
        </button>
      </div>
      {subservices.length === 0 ? (
        <p className="text-brand-400 text-sm">No sub-services yet. Click &quot;Add Sub-service&quot; to create one.</p>
      ) : (
        <div className="space-y-3">
          {subservices.map((sub, index) => (
            <div key={index} className="border border-brand-700/50 rounded-lg overflow-hidden">
              <div
                className="flex items-center justify-between p-3 bg-brand-800/30 cursor-pointer"
                onClick={() => setExpandedIndex(expandedIndex === index ? null : index)}
              >
                <div className="flex items-center gap-3">
                  <span className="text-brand-400 text-sm w-6">#{index + 1}</span>
                  <span className="text-white font-medium">
                    {sub.translations.en?.title || '(untitled)'}
                  </span>
                  <span className="text-brand-500 text-sm">{sub.slug || '(no slug)'}</span>
                </div>
                <div className="flex items-center gap-2">
                  <button
                    type="button"
                    onClick={(e) => { e.stopPropagation(); moveSubservice(index, 'up'); }}
                    disabled={index === 0}
                    className="p-1 text-brand-400 hover:text-white disabled:opacity-30 disabled:cursor-not-allowed"
                  >
                    <ChevronUpIcon className="w-4 h-4" />
                  </button>
                  <button
                    type="button"
                    onClick={(e) => { e.stopPropagation(); moveSubservice(index, 'down'); }}
                    disabled={index === subservices.length - 1}
                    className="p-1 text-brand-400 hover:text-white disabled:opacity-30 disabled:cursor-not-allowed"
                  >
                    <ChevronDownIcon className="w-4 h-4" />
                  </button>
                  <button
                    type="button"
                    onClick={(e) => { e.stopPropagation(); removeSubservice(index); }}
                    className="p-1 text-red-400 hover:text-red-300"
                  >
                    <TrashIcon className="w-4 h-4" />
                  </button>
                </div>
              </div>
              {expandedIndex === index && (
                <div className="p-4 space-y-4 border-t border-brand-700/50">
                  <InputField
                    label="Slug"
                    name={`subservice-slug-${index}`}
                    value={sub.slug}
                    onChange={(v) => updateSubservice(index, { slug: v })}
                    required
                  />
                  <LocaleTabs>
                    {(locale) => {
                      const t = sub.translations[locale] || { title: '', description: null };
                      return (
                        <div className="space-y-3">
                          <InputField
                            label="Title"
                            name={`subservice-title-${index}-${locale}`}
                            value={t.title}
                            onChange={(v) => {
                              updateSubserviceTranslation(index, locale, { ...t, title: v });
                              if (locale === 'en' && !sub.slug) {
                                updateSubservice(index, { slug: slugify(v) });
                              }
                            }}
                            required={locale === 'en'}
                          />
                          <TextareaField
                            label="Description"
                            name={`subservice-desc-${index}-${locale}`}
                            value={t.description || ''}
                            onChange={(v) => updateSubserviceTranslation(index, locale, { ...t, description: v || null })}
                            rows={2}
                          />
                        </div>
                      );
                    }}
                  </LocaleTabs>
                </div>
              )}
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

const categories = [
  { value: 'consulting', label: 'Consulting' },
  { value: 'security', label: 'Security' },
  { value: 'development', label: 'Development' },
  { value: 'data-analytics', label: 'Data & Analytics' },
  { value: 'qa-testing', label: 'QA & Testing' },
];

export default function EditServicePage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = use(params);
  const router = useRouter();
  const searchParams = useSearchParams();
  const subserviceSlug = searchParams.get('subservice');
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState(false);
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

  const { errors, validateForm, clearErrors } = useFormValidation<ServiceInput>({
    slug: { required: true, slug: true },
    translations: (translations) => validateTranslations(
      translations as Partial<Record<string, TranslationData>>,
      'en',
      ['title'],
      { title: 'Title' }
    ),
  });

  useEffect(() => {
    (async () => {
      try {
        const res = await fetch(`/api/admin/services/${id}`);
        if (!res.ok) throw new Error('Failed to fetch');
        const service: ServiceWithTranslations = await res.json();
        const translations = Object.fromEntries(
          Object.entries(service.translations).map(([locale, t]) => [
            locale, t ? { title: t.title, description: t.description, details: t.details, note: t.note } : undefined
          ])
        ) as ServiceInput['translations'];

        setFormData({
          slug: service.slug,
          icon: service.icon,
          category: service.category,
          sort_order: service.sort_order,
          is_active: service.is_active,
          technologies: service.technologies,
          subservices: service.subservices.map(sub => ({
            slug: sub.slug,
            sort_order: sub.sort_order,
            translations: Object.fromEntries(
              Object.entries(sub.translations).map(([l, t]) => [l, t ? { title: t.title, description: t.description } : undefined])
            ) as ServiceInput['subservices'][0]['translations'],
          })),
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
    clearErrors();

    const result = validateForm(formData);
    if (!result.valid) return;

    setSaving(true);
    setError(null);
    setSuccess(false);
    try {
      const res = await fetch(`/api/admin/services/${id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(formData),
      });
      if (!res.ok) throw new Error('Failed to save');
      setSuccess(true);
      setTimeout(() => setSuccess(false), 3000);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Save failed');
    } finally {
      setSaving(false);
    }
  };

  const handleDelete = async () => {
    await fetch(`/api/admin/services/${id}`, { method: 'DELETE' });
    router.push('/admin/services');
  };

  if (loading) return <div className="text-brand-400">Loading...</div>;

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <Link href="/admin/services" className="text-brand-400 hover:text-white text-sm mb-2 inline-block">&larr; Back</Link>
          <h1 className="text-2xl font-bold text-white">Edit Service</h1>
        </div>
        <DeleteButton itemName="service" onDelete={handleDelete} />
      </div>
      <ValidationSummary errors={errors} />
      {/* Toast notifications */}
      {(error || success) && (
        <div className="fixed bottom-6 right-6 z-50">
          {error && (
            <div className="p-4 bg-red-500/20 border border-red-500/50 rounded-lg text-red-400 shadow-lg backdrop-blur-sm">
              {error}
            </div>
          )}
          {success && (
            <div className="p-4 bg-green-500/20 border border-green-500/50 rounded-lg text-green-400 shadow-lg backdrop-blur-sm">
              Saved successfully
            </div>
          )}
        </div>
      )}
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
            translations={formData.translations}
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
        <SubservicesEditor
          subservices={formData.subservices}
          onChange={(subservices) => setFormData({ ...formData, subservices })}
          initialExpandedSlug={subserviceSlug}
        />
        <div className="flex justify-end gap-3">
          <Link href="/admin/services" className="px-4 py-2 text-sm font-medium text-brand-300 border border-brand-600/50 hover:border-brand-400/50 hover:text-white rounded-lg transition-colors">Cancel</Link>
          <button type="submit" disabled={saving} className="px-4 py-2 text-sm font-medium text-white bg-brand-600 hover:bg-brand-500 disabled:opacity-50 rounded-lg transition-colors">{saving ? 'Saving...' : 'Save'}</button>
        </div>
      </form>
    </div>
  );
}
