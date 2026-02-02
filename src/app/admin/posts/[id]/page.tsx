'use client';

import { useEffect, useState, use } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { InputField, TextareaField, CheckboxField, DateTimePicker, TagInput, LocaleFields, DeleteButton, MarkdownEditor, ValidationSummary, useFormValidation, validateTranslations } from '@/components/admin';
import type { PostWithTranslations, PostInput, PostSocialShare } from '@/lib/db';
import { generateSlug } from '@/lib/utils';

type TranslationData = {
  title: string;
  excerpt: string | null;
  content: string;
  meta_title: string | null;
  meta_description: string | null;
  slug: string | null;
};

function truncateForMeta(text: string, maxLength: number = 155): string {
  if (!text || text.length <= maxLength) return text;
  // Truncate at word boundary
  const truncated = text.slice(0, maxLength);
  const lastSpace = truncated.lastIndexOf(' ');
  return (lastSpace > maxLength - 30 ? truncated.slice(0, lastSpace) : truncated) + '...';
}

export default function EditPostPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = use(params);
  const router = useRouter();
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState(false);
  const [socialShares, setSocialShares] = useState<PostSocialShare[]>([]);
  const [sharing, setSharing] = useState<string | null>(null);
  const [formData, setFormData] = useState<PostInput>({
    slug: '',
    image_path: '',
    author_id: null,
    published_at: '',
    is_published: 0,
    tags: [],
    translations: { en: { title: '', excerpt: null, content: '', meta_title: null, meta_description: null, slug: null } },
  });

  useEffect(() => {
    (async () => {
      try {
        const res = await fetch(`/api/admin/posts/${id}`);
        if (!res.ok) throw new Error('Failed to fetch');
        const post: PostWithTranslations = await res.json();
        const translations = Object.fromEntries(
          Object.entries(post.translations).map(([locale, t]) => [
            locale, t ? {
              title: t.title,
              excerpt: t.excerpt,
              content: t.content,
              meta_title: t.meta_title,
              meta_description: t.meta_description,
              slug: t.slug,
            } : undefined
          ])
        ) as PostInput['translations'];

        setSocialShares(post.socialShares ?? []);
        setFormData({
          slug: post.slug,
          image_path: post.image_path,
          author_id: post.author_id,
          published_at: post.published_at || '',
          is_published: post.is_published,
          tags: post.tags,
          translations,
        });
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Error');
      } finally {
        setLoading(false);
      }
    })();
  }, [id]);

  const { errors, validateForm, clearErrors } = useFormValidation<PostInput>({
    slug: { required: true },
    image_path: { imagePath: true },
    translations: (translations) => validateTranslations(
      translations as Partial<Record<string, TranslationData>>,
      'en',
      ['title', 'content'],
      { title: 'Title', content: 'Content' }
    ),
  });

  // Check for maxLength violations in translations
  const getTranslationErrors = () => {
    const errs: string[] = [];
    for (const [locale, t] of Object.entries(formData.translations)) {
      if (t?.meta_title && t.meta_title.length > 60) {
        errs.push(`Meta Title (${locale.toUpperCase()}) exceeds 60 characters`);
      }
      if (t?.meta_description && t.meta_description.length > 155) {
        errs.push(`Meta Description (${locale.toUpperCase()}) exceeds 155 characters`);
      }
    }
    return errs;
  };

  const allErrors = [...errors, ...getTranslationErrors().map(msg => ({ field: 'translation', message: msg }))];

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    clearErrors();

    const result = validateForm(formData);
    const translationErrors = getTranslationErrors();

    if (!result.valid || translationErrors.length > 0) {
      return;
    }

    setSaving(true);
    setError(null);
    setSuccess(false);
    try {
      const res = await fetch(`/api/admin/posts/${id}`, {
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
    await fetch(`/api/admin/posts/${id}`, { method: 'DELETE' });
    router.push('/admin/posts');
  };

  const handleShare = async (platform: 'twitter' | 'facebook' | 'all') => {
    setSharing(platform);
    try {
      const res = await fetch(`/api/admin/posts/${id}/share`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ platform }),
      });
      if (!res.ok) {
        const data = await res.json();
        throw new Error(data.error || 'Failed to trigger share');
      }
      setSuccess(true);
      setTimeout(() => setSuccess(false), 3000);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Share failed');
    } finally {
      setSharing(null);
    }
  };

  const getShareStatus = (platform: string) =>
    socialShares.find((s) => s.platform === platform);

  if (loading) return <div className="text-brand-400">Loading...</div>;

  const defaultTranslation: TranslationData = {
    title: '',
    excerpt: '',
    content: '',
    meta_title: '',
    meta_description: '',
    slug: '',
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
      <ValidationSummary errors={allErrors} />
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
            <InputField label="Slug" name="slug" value={formData.slug} onChange={() => {}} disabled required helpText="Cannot be changed after creation" />
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
            translations={formData.translations}
            onChange={(locale, data) => setFormData({ ...formData, translations: { ...formData.translations, [locale]: data } })}
            defaultData={defaultTranslation}
            requiredFields={['title', 'content']}
            renderFields={(locale, data, onChange) => {
              // Auto-fill meta_title from title if meta_title is empty
              const handleTitleChange = (v: string) => {
                const updates: Partial<TranslationData> = { title: v };
                // Only auto-fill if meta_title is currently empty
                if (!data.meta_title) {
                  updates.meta_title = v || null;
                }
                // For non-English, auto-generate slug if slug is empty
                if (locale !== 'en' && !data.slug) {
                  updates.slug = generateSlug(v);
                }
                onChange({ ...data, ...updates });
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
                  {locale !== 'en' && (
                    <InputField
                      label="URL Slug"
                      name={`slug-${locale}`}
                      value={data.slug || ''}
                      onChange={(v) => onChange({ ...data, slug: v || null })}
                      helpText="Locale-specific URL (auto-generated from title, can override)"
                    />
                  )}
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
                    <InputField label="Meta Title" name={`meta_title-${locale}`} value={data.meta_title || ''} onChange={(v) => onChange({ ...data, meta_title: v || null })} helpText="SEO title (auto-filled from title)" maxLength={60} />
                    <InputField label="Meta Description" name={`meta_description-${locale}`} value={data.meta_description || ''} onChange={(v) => onChange({ ...data, meta_description: v || null })} helpText="SEO description" maxLength={155} />
                  </div>
                </div>
              );
            }}
          />
        </div>
        <div className="flex justify-end gap-3">
          <Link href="/admin/posts" className="px-4 py-2 text-sm font-medium text-brand-300 border border-brand-600/50 hover:border-brand-400/50 hover:text-white rounded-lg transition-colors">Cancel</Link>
          <button type="submit" disabled={saving} className="px-4 py-2 text-sm font-medium text-white bg-brand-600 hover:bg-brand-500 disabled:opacity-50 rounded-lg transition-colors">{saving ? 'Saving...' : 'Save'}</button>
        </div>
      </form>
      {formData.is_published === 1 && (
        <div className="bg-brand-900/60 rounded-lg border border-brand-700/50 p-6 mt-8">
          <h2 className="text-lg font-semibold text-white mb-4">Social Sharing</h2>
          <div className="space-y-3">
            {(['twitter', 'facebook'] as const).map((platform) => {
              const status = getShareStatus(platform);
              const label = platform === 'twitter' ? 'Twitter/X' : 'Facebook';
              const isSharing = sharing === platform || sharing === 'all';
              return (
                <div key={platform} className="flex items-center justify-between p-3 bg-brand-800/50 rounded-lg">
                  <div className="flex items-center gap-3">
                    <span className="text-sm font-medium text-white">{label}</span>
                    {status ? (
                      <span className="flex items-center gap-1.5 text-xs text-green-400">
                        <span className="w-2 h-2 rounded-full bg-green-400" />
                        Shared {new Date(status.shared_at + 'Z').toLocaleDateString()} via {status.shared_by}
                      </span>
                    ) : (
                      <span className="flex items-center gap-1.5 text-xs text-brand-400">
                        <span className="w-2 h-2 rounded-full bg-brand-600" />
                        Not shared
                      </span>
                    )}
                  </div>
                  <button
                    onClick={() => handleShare(platform)}
                    disabled={isSharing}
                    className="px-3 py-1.5 text-xs font-medium text-white bg-brand-600 hover:bg-brand-500 disabled:opacity-50 rounded-lg transition-colors"
                  >
                    {isSharing ? 'Sharing...' : status ? 'Re-share' : 'Share'}
                  </button>
                </div>
              );
            })}
            <div className="pt-2">
              <button
                onClick={() => handleShare('all')}
                disabled={sharing !== null}
                className="px-4 py-2 text-sm font-medium text-white bg-brand-600 hover:bg-brand-500 disabled:opacity-50 rounded-lg transition-colors"
              >
                {sharing === 'all' ? 'Sharing...' : 'Share to All'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
