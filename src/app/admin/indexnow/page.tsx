'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';

interface IndexNowEntry {
  url: string;
  submitted_at: string;
}

export default function IndexNowPage() {
  const [entries, setEntries] = useState<IndexNowEntry[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [clearing, setClearing] = useState(false);

  useEffect(() => {
    fetchEntries();
  }, []);

  const fetchEntries = async () => {
    try {
      const res = await fetch('/api/admin/indexnow');
      if (!res.ok) throw new Error('Failed to fetch');
      setEntries(await res.json());
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Error');
    } finally {
      setLoading(false);
    }
  };

  const handleDelete = async (url: string) => {
    if (!confirm(`Remove "${url}" from submitted list?`)) return;

    try {
      const res = await fetch(`/api/admin/indexnow?url=${encodeURIComponent(url)}`, {
        method: 'DELETE',
      });
      if (!res.ok) throw new Error('Failed to delete');
      setEntries(entries.filter(e => e.url !== url));
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Delete failed');
    }
  };

  const handleClearAll = async () => {
    if (!confirm('Clear all submitted URLs? This will cause all URLs to be resubmitted on next deploy.')) return;

    setClearing(true);
    try {
      const res = await fetch('/api/admin/indexnow', { method: 'DELETE' });
      if (!res.ok) throw new Error('Failed to clear');
      setEntries([]);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Clear failed');
    } finally {
      setClearing(false);
    }
  };

  const formatDate = (dateStr: string) => {
    return new Date(dateStr).toLocaleString();
  };

  if (loading) return <div className="text-brand-400">Loading...</div>;

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <div className="flex items-center gap-3 mb-1">
            <Link href="/admin" className="text-brand-400 hover:text-brand-300">
              <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
              </svg>
            </Link>
            <h1 className="text-2xl font-bold text-white">IndexNow Status</h1>
          </div>
          <p className="text-brand-400 text-sm mt-1">
            URLs submitted to search engines via IndexNow ({entries.length} total)
          </p>
        </div>
        {entries.length > 0 && (
          <button
            onClick={handleClearAll}
            disabled={clearing}
            className="px-4 py-2 text-sm font-medium text-red-400 border border-red-500/50 hover:bg-red-500/20 disabled:opacity-50 rounded-lg transition-colors"
          >
            {clearing ? 'Clearing...' : 'Clear All'}
          </button>
        )}
      </div>

      {error && (
        <div className="mb-4 p-4 bg-red-500/20 border border-red-500/50 rounded-lg text-red-400">
          {error}
        </div>
      )}

      {entries.length === 0 ? (
        <div className="bg-brand-900/60 rounded-lg border border-brand-700/50 p-8 text-center">
          <p className="text-brand-400">No URLs have been submitted yet.</p>
          <p className="text-brand-500 text-sm mt-2">
            URLs are submitted automatically after each deployment.
          </p>
        </div>
      ) : (
        <div className="bg-brand-900/60 rounded-lg border border-brand-700/50 overflow-hidden">
          <table className="w-full">
            <thead>
              <tr className="border-b border-brand-700/50">
                <th className="text-left px-4 py-3 text-sm font-medium text-brand-300">URL</th>
                <th className="text-left px-4 py-3 text-sm font-medium text-brand-300 w-48">Submitted</th>
                <th className="text-right px-4 py-3 text-sm font-medium text-brand-300 w-24">Actions</th>
              </tr>
            </thead>
            <tbody>
              {entries.map((entry) => (
                <tr key={entry.url} className="border-b border-brand-700/30 last:border-0">
                  <td className="px-4 py-3">
                    <a
                      href={entry.url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-brand-200 hover:text-neon text-sm font-mono break-all"
                    >
                      {entry.url}
                    </a>
                  </td>
                  <td className="px-4 py-3 text-sm text-brand-400">
                    {formatDate(entry.submitted_at)}
                  </td>
                  <td className="px-4 py-3 text-right">
                    <button
                      onClick={() => handleDelete(entry.url)}
                      className="text-red-400 hover:text-red-300 text-sm"
                    >
                      Remove
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}

      <div className="mt-8 p-4 bg-brand-900/40 rounded-lg border border-brand-700/30">
        <h3 className="text-sm font-medium text-brand-200 mb-2">How it works</h3>
        <ul className="text-sm text-brand-400 space-y-1">
          <li>When you deploy, all sitemap URLs are compared against this list.</li>
          <li>New URLs (not in this list) are submitted to IndexNow.</li>
          <li>Successfully submitted URLs are stored here to avoid rate limiting.</li>
          <li>Removing a URL will cause it to be resubmitted on the next deploy.</li>
        </ul>
      </div>
    </div>
  );
}
