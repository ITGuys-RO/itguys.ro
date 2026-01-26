'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { InputField, TextareaField, CheckboxField, DateTimePicker, TagInput, LocaleFields, MarkdownEditor } from '@/components/admin';
import type { PostInput } from '@/lib/db';
import type { Locale } from '@/i18n/config';

type TranslationData = {
  title: string;
  excerpt: string | null;
  content: string;
  meta_title: string | null;
  meta_description: string | null;
};

function generateSlug(title: string): string {
  return title
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '') // Remove diacritics
    .replace(/[^a-z0-9\s-]/g, '') // Remove special characters
    .trim()
    .replace(/\s+/g, '-') // Replace spaces with hyphens
    .replace(/-+/g, '-'); // Remove consecutive hyphens
}

function truncateForMeta(text: string, maxLength: number = 155): string {
  if (!text || text.length <= maxLength) return text;
  // Truncate at word boundary
  const truncated = text.slice(0, maxLength);
  const lastSpace = truncated.lastIndexOf(' ');
  return (lastSpace > maxLength - 30 ? truncated.slice(0, lastSpace) : truncated) + '...';
}

export default function NewPostPage() {
  const router = useRouter();
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [formData, setFormData] = useState<PostInput>({
    slug: '',
    image_path: '',
    author_id: null,
    published_at: new Date().toISOString().split('T')[0],
    is_published: 0,
    tags: [],
    translations: { en: { title: '', excerpt: null, content: '', meta_title: null, meta_description: null } },
  });

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving(true);
    try {
      const res = await fetch('/api/admin/posts', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(formData),
      });
      if (!res.ok) throw new Error('Failed to create');
      router.push('/admin/posts');
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Create failed');
    } finally {
      setSaving(false);
    }
  };

  const defaultTranslation: TranslationData = {
    title: '',
    excerpt: '',
    content: '',
    meta_title: '',
    meta_description: '',
  };

  return (
    <div>
      <div className="mb-6">
        <Link href="/admin/posts" className="text-brand-400 hover:text-white text-sm mb-2 inline-block">&larr; Back</Link>
        <h1 className="text-2xl font-bold text-white">New Post</h1>
      </div>
      {error && <div className="mb-6 p-4 bg-red-500/20 border border-red-500/50 rounded-lg text-red-400">{error}</div>}
      <form onSubmit={handleSubmit} className="space-y-8">
        <div className="bg-brand-900/60 rounded-lg border border-brand-700/50 p-6">
          <h2 className="text-lg font-semibold text-white mb-4">Basic Information</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <InputField label="Slug" name="slug" value={formData.slug} onChange={(v) => setFormData({ ...formData, slug: v })} required helpText="URL-friendly identifier" />
            <InputField label="Image Path" name="image_path" value={formData.image_path || ''} onChange={(v) => setFormData({ ...formData, image_path: v || null })} />
            <DateTimePicker label="Published At" name="published_at" value={formData.published_at ?? null} onChange={(v) => setFormData({ ...formData, published_at: v })} />
            <div className="flex items-end">
              <CheckboxField label="Published" name="is_published" checked={formData.is_published === 1} onChange={(c) => setFormData({ ...formData, is_published: c ? 1 : 0 })} description="Make this post visible to the public" />
            </div>
          </div>
          <div className="mt-4">
            <TagInput label="Tags" value={formData.tags} onChange={(v) => setFormData({ ...formData, tags: v })} />
          </div>
        </div>
        <div className="bg-brand-900/60 rounded-lg border border-brand-700/50 p-6">
          <h2 className="text-lg font-semibold text-white mb-4">Content</h2>
          <LocaleFields
            translations={formData.translations as Partial<Record<Locale, TranslationData>>}
            onChange={(locale, data) => setFormData({ ...formData, translations: { ...formData.translations, [locale]: data } })}
            defaultData={defaultTranslation}
            renderFields={(locale, data, onChange) => {
              // Auto-fill meta_title from title if meta_title is empty
              const handleTitleChange = (v: string) => {
                const updates: Partial<TranslationData> = { title: v };
                // Only auto-fill if meta_title is currently empty
                if (!data.meta_title) {
                  updates.meta_title = v || null;
                }
                if (locale === 'en') {
                  // For English, also update slug
                  const newTranslations = {
                    ...formData.translations,
                    en: { ...formData.translations.en!, ...updates },
                  };
                  setFormData({
                    ...formData,
                    slug: generateSlug(v),
                    translations: newTranslations,
                  });
                } else {
                  onChange({ ...data, ...updates });
                }
              };

              // Auto-fill meta_description from excerpt if meta_description is empty
              const handleExcerptChange = (v: string) => {
                const updates: Partial<TranslationData> = { excerpt: v || null };
                // Only auto-fill if meta_description is currently empty
                if (!data.meta_description && v) {
                  updates.meta_description = truncateForMeta(v);
                }
                onChange({ ...data, ...updates });
              };

              return (
                <div className="space-y-4">
                  <InputField
                    label="Title"
                    name={`title-${locale}`}
                    value={data.title}
                    onChange={handleTitleChange}
                    required
                  />
                  <TextareaField
                    label="Excerpt"
                    name={`excerpt-${locale}`}
                    value={data.excerpt || ''}
                    onChange={handleExcerptChange}
                    rows={2}
                    helpText="Brief summary for listings (auto-fills meta description)"
                  />
                  <MarkdownEditor label="Content" name={`content-${locale}`} value={data.content} onChange={(v) => onChange({ ...data, content: v })} required />
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <InputField label="Meta Title" name={`meta_title-${locale}`} value={data.meta_title || ''} onChange={(v) => onChange({ ...data, meta_title: v || null })} helpText="SEO title (auto-filled from title)" />
                    <InputField label="Meta Description" name={`meta_description-${locale}`} value={data.meta_description || ''} onChange={(v) => onChange({ ...data, meta_description: v || null })} helpText="SEO description (max 155 chars)" />
                  </div>
                </div>
              );
            }}
          />
        </div>
        <div className="flex justify-end gap-3">
          <Link href="/admin/posts" className="px-4 py-2 text-sm font-medium text-brand-300 border border-brand-600/50 hover:border-brand-400/50 hover:text-white rounded-lg transition-colors">Cancel</Link>
          <button type="submit" disabled={saving} className="px-4 py-2 text-sm font-medium text-white bg-brand-600 hover:bg-brand-500 disabled:opacity-50 rounded-lg transition-colors">{saving ? 'Creating...' : 'Create'}</button>
        </div>
      </form>
    </div>
  );
}
