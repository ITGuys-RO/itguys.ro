'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { DataTable, StatusBadge, LocaleCompletion } from '@/components/admin';
import type { CompanyWithTranslations } from '@/lib/db';

export default function CompaniesListPage() {
  const [companies, setCompanies] = useState<CompanyWithTranslations[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    fetchCompanies();
  }, []);

  const fetchCompanies = async () => {
    try {
      const res = await fetch('/api/admin/companies');
      if (!res.ok) throw new Error('Failed to fetch');
      setCompanies(await res.json());
    } catch (err) {
      setError(err instanceof Error ? err.message : 'An error occurred');
    } finally {
      setLoading(false);
    }
  };

  const handleDelete = async (company: CompanyWithTranslations) => {
    if (!confirm(`Delete ${company.translations.en?.name ?? company.slug}?`)) return;
    try {
      const res = await fetch(`/api/admin/companies/${company.id}`, { method: 'DELETE' });
      if (!res.ok) throw new Error('Failed to delete');
      fetchCompanies();
    } catch (err) {
      alert(err instanceof Error ? err.message : 'Delete failed');
    }
  };

  if (loading) return <div className="text-brand-400">Loading...</div>;
  if (error) return <div className="text-red-400">Error: {error}</div>;

  const columns = [
    {
      key: 'name',
      header: 'Company',
      render: (c: CompanyWithTranslations) => (
        <div className="flex items-center gap-3">
          {c.logo_path && (
            <img src={c.logo_path} alt="" className="w-8 h-8 object-contain bg-white rounded p-1" />
          )}
          <span className="font-medium">{c.translations.en?.name ?? c.slug}</span>
        </div>
      ),
    },
    {
      key: 'translations',
      header: 'Translations',
      render: (c: CompanyWithTranslations) => (
        <LocaleCompletion translations={c.translations} requiredFields={['name']} />
      ),
    },
    {
      key: 'is_active',
      header: 'Status',
      render: (c: CompanyWithTranslations) => <StatusBadge active={c.is_active === 1} />,
    },
  ];

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-white">Companies</h1>
          <p className="text-brand-400 text-sm mt-1">Manage partner companies</p>
        </div>
        <Link
          href="/admin/companies/new"
          className="px-4 py-2 text-sm font-medium text-white bg-brand-600 hover:bg-brand-500 rounded-lg transition-colors"
        >
          Add Company
        </Link>
      </div>
      <DataTable
        columns={columns}
        data={companies}
        keyField="id"
        editPath={(c) => `/admin/companies/${c.id}`}
        onDelete={handleDelete}
        emptyMessage="No companies found"
        exportFilename="companies"
        exportColumns={[
          { key: 'name', header: 'Name', value: (c) => c.translations.en?.name ?? c.slug },
          { key: 'slug', header: 'Slug', value: (c) => c.slug },
          { key: 'status', header: 'Status', value: (c) => c.is_active === 1 ? 'Active' : 'Inactive' },
        ]}
      />
    </div>
  );
}
