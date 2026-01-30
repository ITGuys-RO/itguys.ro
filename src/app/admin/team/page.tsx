'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { DataTable, StatusBadge, LocaleCompletion } from '@/components/admin';
import type { TeamMemberWithTranslations } from '@/lib/db';

export default function TeamListPage() {
  const [members, setMembers] = useState<TeamMemberWithTranslations[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const router = useRouter();

  useEffect(() => {
    fetchMembers();
  }, []);

  const fetchMembers = async () => {
    try {
      const res = await fetch('/api/admin/team');
      if (!res.ok) throw new Error('Failed to fetch team members');
      const data = await res.json();
      setMembers(data);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'An error occurred');
    } finally {
      setLoading(false);
    }
  };

  const handleDelete = async (member: TeamMemberWithTranslations) => {
    if (!confirm(`Are you sure you want to delete ${member.translations.en?.name ?? member.slug}?`)) {
      return;
    }

    try {
      const res = await fetch(`/api/admin/team/${member.id}`, { method: 'DELETE' });
      if (!res.ok) throw new Error('Failed to delete');
      fetchMembers();
    } catch (err) {
      alert(err instanceof Error ? err.message : 'Delete failed');
    }
  };

  if (loading) {
    return <div className="text-brand-400">Loading...</div>;
  }

  if (error) {
    return <div className="text-red-400">Error: {error}</div>;
  }

  const columns = [
    {
      key: 'name',
      header: 'Name',
      render: (m: TeamMemberWithTranslations) => (
        <div>
          <div className="font-medium">{m.translations.en?.name ?? m.slug}</div>
          <div className="text-brand-400 text-xs">{m.translations.en?.role}</div>
        </div>
      ),
    },
    {
      key: 'email',
      header: 'Email',
      render: (m: TeamMemberWithTranslations) => (
        <span className="text-brand-300">{m.email || '-'}</span>
      ),
    },
    {
      key: 'translations',
      header: 'Translations',
      render: (m: TeamMemberWithTranslations) => (
        <LocaleCompletion
          translations={m.translations}
          requiredFields={['name', 'role', 'bio']}
        />
      ),
    },
    {
      key: 'is_active',
      header: 'Status',
      render: (m: TeamMemberWithTranslations) => <StatusBadge active={m.is_active === 1} />,
    },
  ];

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-white">Team Members</h1>
          <p className="text-brand-400 text-sm mt-1">Manage your team profiles</p>
        </div>
        <Link
          href="/admin/team/new"
          className="px-4 py-2 text-sm font-medium text-white bg-brand-600 hover:bg-brand-500 rounded-lg transition-colors"
        >
          Add Member
        </Link>
      </div>

      <DataTable
        columns={columns}
        data={members}
        keyField="id"
        editPath={(m) => `/admin/team/${m.id}`}
        onDelete={handleDelete}
        emptyMessage="No team members found"
        exportFilename="team-members"
        exportColumns={[
          { key: 'name', header: 'Name', value: (m) => m.translations.en?.name ?? m.slug },
          { key: 'role', header: 'Role', value: (m) => m.translations.en?.role ?? '' },
          { key: 'email', header: 'Email', value: (m) => m.email ?? '' },
          { key: 'status', header: 'Status', value: (m) => m.is_active === 1 ? 'Active' : 'Inactive' },
        ]}
      />
    </div>
  );
}
