import { NextRequest } from 'next/server';
import { withAdmin } from '@/lib/admin-auth';
import { batch } from '@/lib/db/client';

export const dynamic = 'force-dynamic';

const tables = [
  { key: 'team', table: 'team_members' },
  { key: 'projects', table: 'projects' },
  { key: 'companies', table: 'companies' },
  { key: 'services', table: 'services' },
  { key: 'faq', table: 'faq_items' },
  { key: 'posts', table: 'posts' },
];

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export const GET = withAdmin(async (_request: NextRequest) => {
  const results = await batch(
    tables.map(({ table }) => ({ sql: `SELECT COUNT(*) as count FROM ${table}` }))
  );

  const counts: Record<string, number> = {};
  for (let i = 0; i < tables.length; i++) {
    const row = results[i].results[0] as { count: number } | undefined;
    counts[tables[i].key] = row?.count ?? 0;
  }
  return counts;
});
