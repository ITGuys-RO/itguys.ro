'use client';

import { useEffect, useState, use } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import {
  InputField,
  TextareaField,
  CheckboxField,
  LocaleFields,
  DeleteButton,
} from '@/components/admin';
import type { TeamMemberWithTranslations, TeamMemberInput } from '@/lib/db';
import type { Locale } from '@/i18n/config';

type TranslationData = { name: string; role: string; bio: string };

export default function EditTeamMemberPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = use(params);
  const router = useRouter();
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const [formData, setFormData] = useState<TeamMemberInput>({
    slug: '',
    email: '',
    gravatar_email: '',
    linkedin_url: '',
    image_path: '',
    sort_order: 0,
    is_active: 1,
    translations: {},
  });

  useEffect(() => {
    fetchMember();
  }, [id]);

  const fetchMember = async () => {
    try {
      const res = await fetch(`/api/admin/team/${id}`);
      if (!res.ok) throw new Error('Failed to fetch team member');
      const member: TeamMemberWithTranslations = await res.json();

      setFormData({
        slug: member.slug,
        email: member.email,
        gravatar_email: member.gravatar_email,
        linkedin_url: member.linkedin_url,
        image_path: member.image_path,
        sort_order: member.sort_order,
        is_active: member.is_active,
        translations: Object.fromEntries(
          Object.entries(member.translations).map(([locale, t]) => [
            locale,
            t ? { name: t.name, role: t.role, bio: t.bio } : undefined,
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
      const res = await fetch(`/api/admin/team/${id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(formData),
      });

      if (!res.ok) {
        const data = await res.json();
        throw new Error(data.error || 'Failed to save');
      }

      router.push('/admin/team');
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Save failed');
    } finally {
      setSaving(false);
    }
  };

  const handleDelete = async () => {
    const res = await fetch(`/api/admin/team/${id}`, { method: 'DELETE' });
    if (!res.ok) throw new Error('Failed to delete');
    router.push('/admin/team');
  };

  if (loading) {
    return <div className="text-brand-400">Loading...</div>;
  }

  const defaultTranslation: TranslationData = { name: '', role: '', bio: '' };

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <Link href="/admin/team" className="text-brand-400 hover:text-white text-sm mb-2 inline-block">
            &larr; Back to Team
          </Link>
          <h1 className="text-2xl font-bold text-white">Edit Team Member</h1>
        </div>
        <DeleteButton itemName="team member" onDelete={handleDelete} />
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
              helpText="URL-friendly identifier"
            />
            <InputField
              label="Email"
              name="email"
              type="email"
              value={formData.email || ''}
              onChange={(v) => setFormData({ ...formData, email: v || null })}
            />
            <InputField
              label="Gravatar Email"
              name="gravatar_email"
              type="email"
              value={formData.gravatar_email || ''}
              onChange={(v) => setFormData({ ...formData, gravatar_email: v || null })}
              helpText="For profile picture"
            />
            <InputField
              label="LinkedIn URL"
              name="linkedin_url"
              type="url"
              value={formData.linkedin_url || ''}
              onChange={(v) => setFormData({ ...formData, linkedin_url: v || null })}
            />
            <InputField
              label="Image Path"
              name="image_path"
              value={formData.image_path || ''}
              onChange={(v) => setFormData({ ...formData, image_path: v || null })}
              helpText="Path to profile image"
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
            <CheckboxField
              label="Active"
              name="is_active"
              checked={formData.is_active === 1}
              onChange={(c) => setFormData({ ...formData, is_active: c ? 1 : 0 })}
              description="Show this team member on the website"
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
                <InputField
                  label="Role"
                  name={`role-${locale}`}
                  value={data.role}
                  onChange={(v) => onChange({ ...data, role: v })}
                  required
                />
                <TextareaField
                  label="Bio"
                  name={`bio-${locale}`}
                  value={data.bio}
                  onChange={(v) => onChange({ ...data, bio: v })}
                  required
                  rows={4}
                />
              </div>
            )}
          />
        </div>

        <div className="flex justify-end gap-3">
          <Link
            href="/admin/team"
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
