'use client';

import { useEffect, useState, use } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { InputField, TextareaField, CheckboxField, TagInput, LocaleFields, DeleteButton, MarkdownEditor } from '@/components/admin';
import type { PostWithTranslations, PostInput } from '@/lib/db';
import type { Locale } from '@/i18n/config';

type TranslationData = {
  title: string;
  excerpt: string | null;
  content: string;
  meta_title: string | null;
  meta_description: string | null;
};

export default function EditPostPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = use(params);
  const router = useRouter();
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [formData, setFormData] = useState<PostInput>({
    slug: '',
    image_path: '',
    author_id: null,
    published_at: '',
    is_published: 0,
    tags: [],
    translations: {},
  });

  useEffect(() => {
    (async () => {
      try {
        const res = await fetch(`/api/admin/posts/${id}`);
        if (!res.ok) throw new Error('Failed to fetch');
        const post: PostWithTranslations = await res.json();
        setFormData({
          slug: post.slug,
          image_path: post.image_path,
          author_id: post.author_id,
          published_at: post.published_at || '',
          is_published: post.is_published,
          tags: post.tags,
          translations: Object.fromEntries(
            Object.entries(post.translations).map(([locale, t]) => [
              locale, t ? {
                title: t.title,
                excerpt: t.excerpt,
                content: t.content,
                meta_title: t.meta_title,
                meta_description: t.meta_description,
              } : undefined
            ])
          ) as Partial<Record<Locale, TranslationData>>,
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
      const res = await fetch(`/api/admin/posts/${id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(formData),
      });
      if (!res.ok) throw new Error('Failed to save');
      router.push('/admin/posts');
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Save failed');
    } finally {
      setSaving(false);
    }
  };

  const handleDelete = async () => {
    await fetch(`/api/admin/posts/${id}`, { method: 'DELETE' });
    router.push('/admin/posts');
  };

  if (loading) return <div className="text-brand-400">Loading...</div>;

  const defaultTranslation: TranslationData = {
    title: '',
    excerpt: '',
    content: '',
    meta_title: '',
    meta_description: '',
  };

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <Link href="/admin/posts" className="text-brand-400 hover:text-white text-sm mb-2 inline-block">&larr; Back</Link>
          <h1 className="text-2xl font-bold text-white">Edit Post</h1>
        </div>
        <DeleteButton itemName="post" onDelete={handleDelete} />
      </div>
      {error && <div className="mb-6 p-4 bg-red-500/20 border border-red-500/50 rounded-lg text-red-400">{error}</div>}
      <form onSubmit={handleSubmit} className="space-y-8">
        <div className="bg-brand-900/60 rounded-lg border border-brand-700/50 p-6">
          <h2 className="text-lg font-semibold text-white mb-4">Basic Information</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <InputField label="Slug" name="slug" value={formData.slug} onChange={(v) => setFormData({ ...formData, slug: v })} required helpText="URL-friendly identifier" />
            <InputField label="Image Path" name="image_path" value={formData.image_path || ''} onChange={(v) => setFormData({ ...formData, image_path: v || null })} />
            <InputField label="Published At" name="published_at" value={formData.published_at || ''} onChange={(v) => setFormData({ ...formData, published_at: v || null })} helpText="YYYY-MM-DD format" />
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
            translations={formData.translations}
            onChange={(locale, data) => setFormData({ ...formData, translations: { ...formData.translations, [locale]: data } })}
            defaultData={defaultTranslation}
            renderFields={(locale, data, onChange) => (
              <div className="space-y-4">
                <InputField label="Title" name={`title-${locale}`} value={data.title} onChange={(v) => onChange({ ...data, title: v })} required />
                <TextareaField label="Excerpt" name={`excerpt-${locale}`} value={data.excerpt || ''} onChange={(v) => onChange({ ...data, excerpt: v || null })} rows={2} helpText="Brief summary for listings" />
                <MarkdownEditor label="Content" name={`content-${locale}`} value={data.content} onChange={(v) => onChange({ ...data, content: v })} required />
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <InputField label="Meta Title" name={`meta_title-${locale}`} value={data.meta_title || ''} onChange={(v) => onChange({ ...data, meta_title: v || null })} helpText="SEO title" />
                  <InputField label="Meta Description" name={`meta_description-${locale}`} value={data.meta_description || ''} onChange={(v) => onChange({ ...data, meta_description: v || null })} helpText="SEO description" />
                </div>
              </div>
            )}
          />
        </div>
        <div className="flex justify-end gap-3">
          <Link href="/admin/posts" className="px-4 py-2 text-sm font-medium text-brand-300 border border-brand-600/50 hover:border-brand-400/50 hover:text-white rounded-lg transition-colors">Cancel</Link>
          <button type="submit" disabled={saving} className="px-4 py-2 text-sm font-medium text-white bg-brand-600 hover:bg-brand-500 disabled:opacity-50 rounded-lg transition-colors">{saving ? 'Saving...' : 'Save'}</button>
        </div>
      </form>
    </div>
  );
}
