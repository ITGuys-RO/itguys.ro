'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { DataTable, StatusBadge, LocaleCompletion } from '@/components/admin';
import type { FaqWithTranslations } from '@/lib/db';

export default function FaqListPage() {
  const [items, setItems] = useState<FaqWithTranslations[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    fetchItems();
  }, []);

  const fetchItems = async () => {
    try {
      const res = await fetch('/api/admin/faq');
      if (!res.ok) throw new Error('Failed to fetch');
      setItems(await res.json());
    } catch (err) {
      setError(err instanceof Error ? err.message : 'An error occurred');
    } finally {
      setLoading(false);
    }
  };

  const handleDelete = async (item: FaqWithTranslations) => {
    if (!confirm('Delete this FAQ item?')) return;
    try {
      const res = await fetch(`/api/admin/faq/${item.id}`, { method: 'DELETE' });
      if (!res.ok) throw new Error('Failed to delete');
      fetchItems();
    } catch (err) {
      alert(err instanceof Error ? err.message : 'Delete failed');
    }
  };

  if (loading) return <div className="text-brand-400">Loading...</div>;
  if (error) return <div className="text-red-400">Error: {error}</div>;

  const columns = [
    {
      key: 'question',
      header: 'Question',
      render: (f: FaqWithTranslations) => (
        <div>
          <div className="font-medium line-clamp-2">{f.translations.en?.question ?? f.slug}</div>
          {f.category && <div className="text-brand-400 text-xs mt-1">{f.category}</div>}
        </div>
      ),
    },
    {
      key: 'translations',
      header: 'Translations',
      render: (f: FaqWithTranslations) => (
        <LocaleCompletion translations={f.translations} requiredFields={['question', 'answer']} />
      ),
    },
    {
      key: 'is_active',
      header: 'Status',
      render: (f: FaqWithTranslations) => <StatusBadge active={f.is_active === 1} />,
    },
  ];

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-white">FAQ</h1>
          <p className="text-brand-400 text-sm mt-1">Manage frequently asked questions</p>
        </div>
        <Link
          href="/admin/faq/new"
          className="px-4 py-2 text-sm font-medium text-white bg-brand-600 hover:bg-brand-500 rounded-lg transition-colors"
        >
          Add FAQ
        </Link>
      </div>
      <DataTable
        columns={columns}
        data={items}
        keyField="id"
        editPath={(f) => `/admin/faq/${f.id}`}
        onDelete={handleDelete}
        emptyMessage="No FAQ items found"
        exportFilename="faq"
        exportColumns={[
          { key: 'question', header: 'Question', value: (f) => f.translations.en?.question ?? f.slug },
          { key: 'category', header: 'Category', value: (f) => f.category ?? '' },
          { key: 'status', header: 'Status', value: (f) => f.is_active === 1 ? 'Active' : 'Inactive' },
        ]}
      />
    </div>
  );
}
