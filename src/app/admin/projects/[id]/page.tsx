'use client';

import { useEffect, useState, use } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import {
  InputField,
  TextareaField,
  CheckboxField,
  TagInput,
  LocaleFields,
  DeleteButton,
} from '@/components/admin';
import type { ProjectWithTranslations, ProjectInput } from '@/lib/db';
import type { Locale } from '@/i18n/config';

type TranslationData = {
  name: string;
  client_type: string | null;
  industry: string | null;
  challenge: string | null;
  solution: string | null;
  result: string | null;
};

export default function EditProjectPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = use(params);
  const router = useRouter();
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const [formData, setFormData] = useState<ProjectInput>({
    slug: '',
    image_path: '',
    external_url: '',
    sort_order: 0,
    is_active: 1,
    technologies: [],
    translations: {},
  });

  useEffect(() => {
    fetchProject();
  }, [id]);

  const fetchProject = async () => {
    try {
      const res = await fetch(`/api/admin/projects/${id}`);
      if (!res.ok) throw new Error('Failed to fetch project');
      const project: ProjectWithTranslations = await res.json();

      setFormData({
        slug: project.slug,
        image_path: project.image_path,
        external_url: project.external_url,
        sort_order: project.sort_order,
        is_active: project.is_active,
        technologies: project.technologies,
        translations: Object.fromEntries(
          Object.entries(project.translations).map(([locale, t]) => [
            locale,
            t
              ? {
                  name: t.name,
                  client_type: t.client_type,
                  industry: t.industry,
                  challenge: t.challenge,
                  solution: t.solution,
                  result: t.result,
                }
              : undefined,
          ])
        ) as Partial<Record<Locale, TranslationData>>,
      });
    } catch (err) {
      setError(err instanceof Error ? err.message : 'An error occurred');
    } finally {
      setLoading(false);
    }
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving(true);
    setError(null);

    try {
      const res = await fetch(`/api/admin/projects/${id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(formData),
      });

      if (!res.ok) {
        const data = await res.json();
        throw new Error(data.error || 'Failed to save');
      }

      router.push('/admin/projects');
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Save failed');
    } finally {
      setSaving(false);
    }
  };

  const handleDelete = async () => {
    const res = await fetch(`/api/admin/projects/${id}`, { method: 'DELETE' });
    if (!res.ok) throw new Error('Failed to delete');
    router.push('/admin/projects');
  };

  if (loading) return <div className="text-brand-400">Loading...</div>;

  const defaultTranslation: TranslationData = {
    name: '',
    client_type: '',
    industry: '',
    challenge: '',
    solution: '',
    result: '',
  };

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <Link href="/admin/projects" className="text-brand-400 hover:text-white text-sm mb-2 inline-block">
            &larr; Back to Projects
          </Link>
          <h1 className="text-2xl font-bold text-white">Edit Project</h1>
        </div>
        <DeleteButton itemName="project" onDelete={handleDelete} />
      </div>

      {error && (
        <div className="mb-6 p-4 bg-red-500/20 border border-red-500/50 rounded-lg text-red-400">
          {error}
        </div>
      )}

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
          <div className="mt-4">
            <CheckboxField
              label="Active"
              name="is_active"
              checked={formData.is_active === 1}
              onChange={(c) => setFormData({ ...formData, is_active: c ? 1 : 0 })}
              description="Show this project on the website"
            />
          </div>
        </div>

        <div className="bg-brand-900/60 rounded-lg border border-brand-700/50 p-6">
          <h2 className="text-lg font-semibold text-white mb-4">Translations</h2>
          <LocaleFields
            translations={formData.translations}
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
                  onChange={(v) => onChange({ ...data, name: v })}
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
            {saving ? 'Saving...' : 'Save Changes'}
          </button>
        </div>
      </form>
    </div>
  );
}
