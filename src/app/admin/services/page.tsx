'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { DataTable, StatusBadge, LocaleCompletion } from '@/components/admin';
import type { ServiceWithTranslations } from '@/lib/db';

export default function ServicesListPage() {
  const [services, setServices] = useState<ServiceWithTranslations[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    fetchServices();
  }, []);

  const fetchServices = async () => {
    try {
      const res = await fetch('/api/admin/services');
      if (!res.ok) throw new Error('Failed to fetch');
      setServices(await res.json());
    } catch (err) {
      setError(err instanceof Error ? err.message : 'An error occurred');
    } finally {
      setLoading(false);
    }
  };

  const handleDelete = async (service: ServiceWithTranslations) => {
    if (!confirm(`Delete ${service.translations.en?.title ?? service.slug}?`)) return;
    try {
      const res = await fetch(`/api/admin/services/${service.id}`, { method: 'DELETE' });
      if (!res.ok) throw new Error('Failed to delete');
      fetchServices();
    } catch (err) {
      alert(err instanceof Error ? err.message : 'Delete failed');
    }
  };

  if (loading) return <div className="text-brand-400">Loading...</div>;
  if (error) return <div className="text-red-400">Error: {error}</div>;

  const columns = [
    {
      key: 'title',
      header: 'Service',
      render: (s: ServiceWithTranslations) => (
        <div>
          <div className="font-medium">{s.translations.en?.title ?? s.slug}</div>
          <div className="text-brand-400 text-xs">{s.category}</div>
        </div>
      ),
    },
    {
      key: 'subservices',
      header: 'Sub-services',
      render: (s: ServiceWithTranslations) => (
        <span className="text-brand-300">{s.subservices.length}</span>
      ),
    },
    {
      key: 'translations',
      header: 'Translations',
      render: (s: ServiceWithTranslations) => (
        <LocaleCompletion translations={s.translations} requiredFields={['title']} />
      ),
    },
    {
      key: 'is_active',
      header: 'Status',
      render: (s: ServiceWithTranslations) => <StatusBadge active={s.is_active === 1} />,
    },
  ];

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-white">Services</h1>
          <p className="text-brand-400 text-sm mt-1">Manage service offerings</p>
        </div>
        <Link
          href="/admin/services/new"
          className="px-4 py-2 text-sm font-medium text-white bg-brand-600 hover:bg-brand-500 rounded-lg transition-colors"
        >
          Add Service
        </Link>
      </div>
      <DataTable
        columns={columns}
        data={services}
        keyField="id"
        editPath={(s) => `/admin/services/${s.id}`}
        onDelete={handleDelete}
        emptyMessage="No services found"
      />
    </div>
  );
}
