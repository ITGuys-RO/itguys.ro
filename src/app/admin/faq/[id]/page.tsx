'use client';

import { useEffect, useState, use } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { InputField, TextareaField, CheckboxField, LocaleFields, DeleteButton } from '@/components/admin';
import type { FaqWithTranslations, FaqInput } from '@/lib/db';
import type { Locale } from '@/i18n/config';

type TranslationData = { question: string; answer: string };

export default function EditFaqPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = use(params);
  const router = useRouter();
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState(false);
  const [formData, setFormData] = useState<FaqInput>({
    slug: '',
    category: '',
    sort_order: 0,
    is_active: 1,
    translations: { en: { question: '', answer: '' } },
  });

  useEffect(() => {
    (async () => {
      try {
        const res = await fetch(`/api/admin/faq/${id}`);
        if (!res.ok) throw new Error('Failed to fetch');
        const item: FaqWithTranslations = await res.json();
        const translations = Object.fromEntries(
          Object.entries(item.translations).map(([locale, t]) => [
            locale, t ? { question: t.question, answer: t.answer } : undefined
          ])
        ) as FaqInput['translations'];

        setFormData({
          slug: item.slug,
          category: item.category,
          sort_order: item.sort_order,
          is_active: item.is_active,
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
    setError(null);
    setSuccess(false);
    try {
      const res = await fetch(`/api/admin/faq/${id}`, {
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
    await fetch(`/api/admin/faq/${id}`, { method: 'DELETE' });
    router.push('/admin/faq');
  };

  if (loading) return <div className="text-brand-400">Loading...</div>;

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <Link href="/admin/faq" className="text-brand-400 hover:text-white text-sm mb-2 inline-block">&larr; Back</Link>
          <h1 className="text-2xl font-bold text-white">Edit FAQ</h1>
        </div>
        <DeleteButton itemName="FAQ item" onDelete={handleDelete} />
      </div>
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
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <InputField label="Slug" name="slug" value={formData.slug} onChange={(v) => setFormData({ ...formData, slug: v })} required />
            <InputField label="Category" name="category" value={formData.category || ''} onChange={(v) => setFormData({ ...formData, category: v || null })} />
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
            defaultData={{ question: '', answer: '' }}
            renderFields={(locale, data, onChange) => (
              <div className="space-y-4">
                <InputField label="Question" name={`question-${locale}`} value={data.question} onChange={(v) => onChange({ ...data, question: v })} required />
                <TextareaField label="Answer" name={`answer-${locale}`} value={data.answer} onChange={(v) => onChange({ ...data, answer: v })} required rows={4} />
              </div>
            )}
          />
        </div>
        <div className="flex justify-end gap-3">
          <Link href="/admin/faq" className="px-4 py-2 text-sm font-medium text-brand-300 border border-brand-600/50 hover:border-brand-400/50 hover:text-white rounded-lg transition-colors">Cancel</Link>
          <button type="submit" disabled={saving} className="px-4 py-2 text-sm font-medium text-white bg-brand-600 hover:bg-brand-500 disabled:opacity-50 rounded-lg transition-colors">{saving ? 'Saving...' : 'Save'}</button>
        </div>
      </form>
    </div>
  );
}
