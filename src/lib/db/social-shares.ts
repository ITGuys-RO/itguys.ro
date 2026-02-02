import { query, execute } from './client';
import type { PostSocialShare } from './schema';

export async function getSocialShares(postId: number): Promise<PostSocialShare[]> {
  return query<PostSocialShare>(
    'SELECT * FROM post_social_shares WHERE post_id = ?',
    [postId]
  );
}

export async function getSocialSharesForPosts(postIds: number[]): Promise<Record<number, PostSocialShare[]>> {
  if (postIds.length === 0) return {};
  const placeholders = postIds.map(() => '?').join(',');
  const rows = await query<PostSocialShare>(
    `SELECT * FROM post_social_shares WHERE post_id IN (${placeholders})`,
    postIds
  );
  const map: Record<number, PostSocialShare[]> = {};
  for (const row of rows) {
    (map[row.post_id] ??= []).push(row);
  }
  return map;
}

export async function upsertSocialShare(
  postId: number,
  platform: string,
  platformPostId: string | null,
  sharedBy: string = 'manual'
): Promise<void> {
  await execute(
    `INSERT INTO post_social_shares (post_id, platform, platform_post_id, shared_by, shared_at)
     VALUES (?, ?, ?, ?, datetime('now'))
     ON CONFLICT(post_id, platform) DO UPDATE SET
       platform_post_id = excluded.platform_post_id,
       shared_by = excluded.shared_by,
       shared_at = excluded.shared_at`,
    [postId, platform, platformPostId, sharedBy]
  );
}
