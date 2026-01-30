'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { DataTable, StatusBadge, LocaleCompletion } from '@/components/admin';
import type { ProjectWithTranslations } from '@/lib/db';

export default function ProjectsListPage() {
  const [projects, setProjects] = useState<ProjectWithTranslations[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    fetchProjects();
  }, []);

  const fetchProjects = async () => {
    try {
      const res = await fetch('/api/admin/projects');
      if (!res.ok) throw new Error('Failed to fetch projects');
      const data = await res.json();
      setProjects(data);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'An error occurred');
    } finally {
      setLoading(false);
    }
  };

  const handleDelete = async (project: ProjectWithTranslations) => {
    if (!confirm(`Are you sure you want to delete ${project.translations.en?.name ?? project.slug}?`)) {
      return;
    }

    try {
      const res = await fetch(`/api/admin/projects/${project.id}`, { method: 'DELETE' });
      if (!res.ok) throw new Error('Failed to delete');
      fetchProjects();
    } catch (err) {
      alert(err instanceof Error ? err.message : 'Delete failed');
    }
  };

  if (loading) return <div className="text-brand-400">Loading...</div>;
  if (error) return <div className="text-red-400">Error: {error}</div>;

  const columns = [
    {
      key: 'name',
      header: 'Project',
      render: (p: ProjectWithTranslations) => (
        <div>
          <div className="font-medium">{p.translations.en?.name ?? p.slug}</div>
          <div className="text-brand-400 text-xs">{p.translations.en?.industry}</div>
        </div>
      ),
    },
    {
      key: 'technologies',
      header: 'Tech',
      render: (p: ProjectWithTranslations) => (
        <div className="flex flex-wrap gap-1">
          {p.technologies.slice(0, 3).map((t) => (
            <span key={t} className="px-2 py-0.5 bg-brand-700/50 text-brand-300 text-xs rounded">
              {t}
            </span>
          ))}
          {p.technologies.length > 3 && (
            <span className="text-brand-400 text-xs">+{p.technologies.length - 3}</span>
          )}
        </div>
      ),
    },
    {
      key: 'translations',
      header: 'Translations',
      render: (p: ProjectWithTranslations) => (
        <LocaleCompletion
          translations={p.translations}
          requiredFields={['name', 'challenge', 'solution']}
        />
      ),
    },
    {
      key: 'is_active',
      header: 'Status',
      render: (p: ProjectWithTranslations) => <StatusBadge active={p.is_active === 1} />,
    },
  ];

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-white">Projects</h1>
          <p className="text-brand-400 text-sm mt-1">Manage portfolio projects</p>
        </div>
        <Link
          href="/admin/projects/new"
          className="px-4 py-2 text-sm font-medium text-white bg-brand-600 hover:bg-brand-500 rounded-lg transition-colors"
        >
          Add Project
        </Link>
      </div>

      <DataTable
        columns={columns}
        data={projects}
        keyField="id"
        editPath={(p) => `/admin/projects/${p.id}`}
        onDelete={handleDelete}
        emptyMessage="No projects found"
        exportFilename="projects"
        exportColumns={[
          { key: 'name', header: 'Name', value: (p) => p.translations.en?.name ?? p.slug },
          { key: 'slug', header: 'Slug', value: (p) => p.slug },
          { key: 'industry', header: 'Industry', value: (p) => p.translations.en?.industry ?? '' },
          { key: 'technologies', header: 'Technologies', value: (p) => p.technologies.join(', ') },
          { key: 'status', header: 'Status', value: (p) => p.is_active === 1 ? 'Active' : 'Inactive' },
        ]}
      />
    </div>
  );
}
