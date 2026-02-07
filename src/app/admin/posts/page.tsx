'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { DataTable, LocaleCompletion } from '@/components/admin';
import type { PostWithTranslations } from '@/lib/db';

export default function PostsListPage() {
  const [posts, setPosts] = useState<PostWithTranslations[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    fetchPosts();
  }, []);

  const fetchPosts = async () => {
    try {
      const res = await fetch('/api/admin/posts');
      if (!res.ok) throw new Error('Failed to fetch');
      setPosts(await res.json());
    } catch (err) {
      setError(err instanceof Error ? err.message : 'An error occurred');
    } finally {
      setLoading(false);
    }
  };

  const handleDelete = async (post: PostWithTranslations) => {
    if (!confirm(`Delete "${post.translations.en?.title ?? post.slug}"?`)) return;
    try {
      const res = await fetch(`/api/admin/posts/${post.id}`, { method: 'DELETE' });
      if (!res.ok) throw new Error('Failed to delete');
      fetchPosts();
    } catch (err) {
      alert(err instanceof Error ? err.message : 'Delete failed');
    }
  };

  if (loading) return <div className="text-brand-400">Loading...</div>;
  if (error) return <div className="text-red-400">Error: {error}</div>;

  const columns = [
    {
      key: 'title',
      header: 'Post',
      render: (p: PostWithTranslations) => (
        <div>
          <a
            href={`/blog/${p.slug}`}
            target="_blank"
            rel="noopener noreferrer"
            className="font-medium hover:text-neon transition-colors"
          >
            {p.translations.en?.title ?? p.slug}
          </a>
          <div className="text-brand-400 text-xs mt-1">
            {p.published_at ? new Date(p.published_at).toLocaleDateString() : 'Draft'}
          </div>
        </div>
      ),
    },
    {
      key: 'tags',
      header: 'Tags',
      render: (p: PostWithTranslations) => (
        <div className="flex flex-wrap gap-1">
          {p.tags.slice(0, 3).map((t) => (
            <span key={t} className="px-2 py-0.5 bg-brand-700/50 text-brand-300 text-xs rounded">
              {t}
            </span>
          ))}
        </div>
      ),
    },
    {
      key: 'translations',
      header: 'Translations',
      render: (p: PostWithTranslations) => (
        <LocaleCompletion translations={p.translations} requiredFields={['title', 'content']} />
      ),
    },
    {
      key: 'social',
      header: 'Social',
      render: (p: PostWithTranslations) => {
        const shares = p.socialShares ?? [];
        const twitter = shares.find((s) => s.platform === 'twitter');
        const facebook = shares.find((s) => s.platform === 'facebook');
        const linkedin = shares.find((s) => s.platform === 'linkedin');
        return (
          <div className="flex gap-2">
            <span title={twitter ? `Shared ${new Date(twitter.shared_at + 'Z').toLocaleDateString()}` : 'Not shared to Twitter'} className={`text-xs font-medium ${twitter ? 'text-green-400' : 'text-brand-600'}`}>𝕏</span>
            <span title={facebook ? `Shared ${new Date(facebook.shared_at + 'Z').toLocaleDateString()}` : 'Not shared to Facebook'} className={`text-xs font-medium ${facebook ? 'text-green-400' : 'text-brand-600'}`}>f</span>
            <span title={linkedin ? `Shared ${new Date(linkedin.shared_at + 'Z').toLocaleDateString()}` : 'Not shared to LinkedIn'} className={`text-xs font-medium ${linkedin ? 'text-green-400' : 'text-brand-600'}`}>in</span>
          </div>
        );
      },
    },
    {
      key: 'is_published',
      header: 'Status',
      render: (p: PostWithTranslations) => (
        <span className={`px-2 py-0.5 rounded text-xs font-medium ${
          p.is_published
            ? 'bg-green-500/20 text-green-400 border border-green-500/30'
            : 'bg-yellow-500/20 text-yellow-400 border border-yellow-500/30'
        }`}>
          {p.is_published ? 'Published' : 'Draft'}
        </span>
      ),
    },
  ];

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-white">Blog Posts</h1>
          <p className="text-brand-400 text-sm mt-1">Manage blog articles</p>
        </div>
        <Link
          href="/admin/posts/new"
          className="px-4 py-2 text-sm font-medium text-white bg-brand-600 hover:bg-brand-500 rounded-lg transition-colors"
        >
          New Post
        </Link>
      </div>
      <DataTable
        columns={columns}
        data={posts}
        keyField="id"
        editPath={(p) => `/admin/posts/${p.id}`}
        onDelete={handleDelete}
        emptyMessage="No posts found"
        exportFilename="posts"
        exportColumns={[
          { key: 'title', header: 'Title', value: (p) => p.translations.en?.title ?? p.slug },
          { key: 'slug', header: 'Slug', value: (p) => p.slug },
          { key: 'tags', header: 'Tags', value: (p) => p.tags.join(', ') },
          { key: 'published_at', header: 'Published', value: (p) => p.published_at ?? '' },
          { key: 'status', header: 'Status', value: (p) => p.is_published ? 'Published' : 'Draft' },
        ]}
      />
    </div>
  );
}
