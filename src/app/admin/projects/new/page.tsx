'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import {
  InputField,
  TextareaField,
  CheckboxField,
  TagInput,
  LocaleFields,
  MarkdownEditor,
  ValidationSummary,
  useFormValidation,
  validateTranslations,
} from '@/components/admin';
import { generateSlug } from '@/lib/utils';
import type { ProjectInput } from '@/lib/db';
import type { Locale } from '@/i18n/config';

type TranslationData = {
  name: string;
  client_type: string | null;
  industry: string | null;
  challenge: string | null;
  solution: string | null;
  result: string | null;
  content: string | null;
  meta_title: string | null;
  meta_description: string | null;
  slug: string | null;
};

export default function NewProjectPage() {
  const router = useRouter();
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const [formData, setFormData] = useState<ProjectInput>({
    slug: '',
    image_path: '',
    external_url: '',
    sort_order: 0,
    is_active: 1,
    is_case_study: 0,
    duration: '',
    completed_at: '',
    technologies: [],
    translations: { en: { name: '', client_type: null, industry: null, challenge: null, solution: null, result: null, content: null, meta_title: null, meta_description: null, slug: null } },
  });

  const { errors, validateForm, clearErrors } = useFormValidation<ProjectInput>({
    slug: { required: true, slug: true },
    image_path: { imagePath: true },
    external_url: { url: true },
    translations: (translations) => validateTranslations(
      translations as Partial<Record<string, TranslationData>>,
      'en',
      ['name'],
      { name: 'Name' }
    ),
  });

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    clearErrors();

    const result = validateForm(formData);
    if (!result.valid) return;

    setSaving(true);
    setError(null);

    try {
      const res = await fetch('/api/admin/projects', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(formData),
      });

      if (!res.ok) {
        const data = await res.json();
        throw new Error(data.error || 'Failed to create');
      }

      router.push('/admin/projects');
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Create failed');
    } finally {
      setSaving(false);
    }
  };

  const isCaseStudy = formData.is_case_study === 1;

  const defaultTranslation: TranslationData = {
    name: '',
    client_type: '',
    industry: '',
    challenge: '',
    solution: '',
    result: '',
    content: '',
    meta_title: '',
    meta_description: '',
    slug: '',
  };

  return (
    <div>
      <div className="mb-6">
        <Link href="/admin/projects" className="text-brand-400 hover:text-white text-sm mb-2 inline-block">
          &larr; Back to Projects
        </Link>
        <h1 className="text-2xl font-bold text-white">New Project</h1>
      </div>

      {error && (
        <div className="mb-6 p-4 bg-red-500/20 border border-red-500/50 rounded-lg text-red-400">
          {error}
        </div>
      )}
      <ValidationSummary errors={errors} />

      <form onSubmit={handleSubmit} className="space-y-8">
        <div className="bg-brand-900/60 rounded-lg border border-brand-700/50 p-6">
          <h2 className="text-lg font-semibold text-white mb-4">Basic Information</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <InputField
              label="Slug"
              name="slug"
              value={formData.slug}
              onChange={(v) => setFormData({ ...formData, slug: v })}
              required
            />
            <InputField
              label="External URL"
              name="external_url"
              type="url"
              value={formData.external_url || ''}
              onChange={(v) => setFormData({ ...formData, external_url: v || null })}
            />
            <InputField
              label="Image Path"
              name="image_path"
              value={formData.image_path || ''}
              onChange={(v) => setFormData({ ...formData, image_path: v || null })}
            />
            <InputField
              label="Sort Order"
              name="sort_order"
              type="number"
              value={formData.sort_order ?? 0}
              onChange={(v) => setFormData({ ...formData, sort_order: parseInt(v) || 0 })}
            />
          </div>
          <div className="mt-4">
            <TagInput
              label="Technologies"
              value={formData.technologies}
              onChange={(v) => setFormData({ ...formData, technologies: v })}
              placeholder="Add technology..."
            />
          </div>
          <div className="mt-4 space-y-3">
            <CheckboxField
              label="Active"
              name="is_active"
              checked={formData.is_active === 1}
              onChange={(c) => setFormData({ ...formData, is_active: c ? 1 : 0 })}
              description="Show this project on the website"
            />
            <CheckboxField
              label="Case Study"
              name="is_case_study"
              checked={isCaseStudy}
              onChange={(c) => setFormData({ ...formData, is_case_study: c ? 1 : 0 })}
              description="Enable detail page with rich markdown content"
            />
          </div>
          {isCaseStudy && (
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mt-4">
              <InputField
                label="Duration"
                name="duration"
                value={formData.duration || ''}
                onChange={(v) => setFormData({ ...formData, duration: v || null })}
                placeholder="e.g. 6 months"
              />
              <InputField
                label="Completed At"
                name="completed_at"
                value={formData.completed_at || ''}
                onChange={(v) => setFormData({ ...formData, completed_at: v || null })}
                placeholder="YYYY-MM-DD"
              />
            </div>
          )}
        </div>

        <div className="bg-brand-900/60 rounded-lg border border-brand-700/50 p-6">
          <h2 className="text-lg font-semibold text-white mb-4">Translations</h2>
          <LocaleFields
            translations={formData.translations as Partial<Record<Locale, TranslationData>>}
            onChange={(locale, data) =>
              setFormData({
                ...formData,
                translations: { ...formData.translations, [locale]: data },
              })
            }
            defaultData={defaultTranslation}
            renderFields={(locale, data, onChange) => (
              <div className="space-y-4">
                <InputField
                  label="Name"
                  name={`name-${locale}`}
                  value={data.name}
                  onChange={(v) => {
                    const updated = { ...data, name: v };
                    if (isCaseStudy && !data.slug) {
                      updated.slug = generateSlug(v);
                    }
                    onChange(updated);
                  }}
                  required
                />
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <InputField
                    label="Client Type"
                    name={`client_type-${locale}`}
                    value={data.client_type || ''}
                    onChange={(v) => onChange({ ...data, client_type: v || null })}
                  />
                  <InputField
                    label="Industry"
                    name={`industry-${locale}`}
                    value={data.industry || ''}
                    onChange={(v) => onChange({ ...data, industry: v || null })}
                  />
                </div>
                <TextareaField
                  label="Challenge"
                  name={`challenge-${locale}`}
                  value={data.challenge || ''}
                  onChange={(v) => onChange({ ...data, challenge: v || null })}
                  rows={3}
                />
                <TextareaField
                  label="Solution"
                  name={`solution-${locale}`}
                  value={data.solution || ''}
                  onChange={(v) => onChange({ ...data, solution: v || null })}
                  rows={3}
                />
                <TextareaField
                  label="Result"
                  name={`result-${locale}`}
                  value={data.result || ''}
                  onChange={(v) => onChange({ ...data, result: v || null })}
                  rows={2}
                />
                {isCaseStudy && (
                  <>
                    <InputField
                      label="URL Slug"
                      name={`slug-${locale}`}
                      value={data.slug || ''}
                      onChange={(v) => onChange({ ...data, slug: v || null })}
                    />
                    <MarkdownEditor
                      label="Content"
                      name={`content-${locale}`}
                      value={data.content || ''}
                      onChange={(v) => onChange({ ...data, content: v || null })}
                    />
                    <InputField
                      label="Meta Title"
                      name={`meta_title-${locale}`}
                      value={data.meta_title || ''}
                      onChange={(v) => onChange({ ...data, meta_title: v || null })}
                    />
                    <TextareaField
                      label="Meta Description"
                      name={`meta_description-${locale}`}
                      value={data.meta_description || ''}
                      onChange={(v) => onChange({ ...data, meta_description: v || null })}
                      rows={2}
                    />
                  </>
                )}
              </div>
            )}
          />
        </div>

        <div className="flex justify-end gap-3">
          <Link
            href="/admin/projects"
            className="px-4 py-2 text-sm font-medium text-brand-300 border border-brand-600/50 hover:border-brand-400/50 hover:text-white rounded-lg transition-colors"
          >
            Cancel
          </Link>
          <button
            type="submit"
            disabled={saving}
            className="px-4 py-2 text-sm font-medium text-white bg-brand-600 hover:bg-brand-500 disabled:opacity-50 rounded-lg transition-colors"
          >
            {saving ? 'Creating...' : 'Create Project'}
          </button>
        </div>
      </form>
    </div>
  );
}
