import { NextRequest } from 'next/server';
import { withAdmin } from '@/lib/admin-auth';
import { query } from '@/lib/db/client';

export const dynamic = 'force-dynamic';

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export const GET = withAdmin(async (_request: NextRequest) => {
  const rows = await query<{ tbl: string; count: number }>(
    `SELECT 'team' as tbl, COUNT(*) as count FROM team_members
     UNION ALL SELECT 'projects', COUNT(*) FROM projects
     UNION ALL SELECT 'companies', COUNT(*) FROM companies
     UNION ALL SELECT 'services', COUNT(*) FROM services
     UNION ALL SELECT 'faq', COUNT(*) FROM faq_items
     UNION ALL SELECT 'posts', COUNT(*) FROM posts`
  );

  const counts: Record<string, number> = {};
  for (const row of rows) {
    counts[row.tbl] = row.count;
  }
  return counts;
});
