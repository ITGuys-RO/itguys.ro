import { query, queryFirst, execute, batch } from './client';

export interface PostImageCandidate {
  id: number;
  post_id: number;
  image_url: string;
  source_url: string | null;
  page_title: string | null;
  is_selected: number;
  sort_order: number;
  scraped_at: string;
}

export interface PostImageCandidateInput {
  image_url?: string;
  imageUrl?: string;
  source_url?: string | null;
  sourceUrl?: string | null;
  page_title?: string | null;
  pageTitle?: string | null;
}

function normalizeCandidate(c: PostImageCandidateInput) {
  return {
    image_url: c.image_url || c.imageUrl || '',
    source_url: c.source_url ?? c.sourceUrl ?? null,
    page_title: c.page_title ?? c.pageTitle ?? null,
  };
}

export async function getImageCandidates(postId: number): Promise<PostImageCandidate[]> {
  return query<PostImageCandidate>(
    'SELECT * FROM post_image_candidates WHERE post_id = ? ORDER BY sort_order ASC, id ASC',
    [postId]
  );
}

export async function createImageCandidates(
  postId: number,
  candidates: PostImageCandidateInput[]
): Promise<void> {
  if (candidates.length === 0) return;

  const statements = candidates.map((c, i) => {
    const n = normalizeCandidate(c);
    return {
      sql: `INSERT INTO post_image_candidates (post_id, image_url, source_url, page_title, sort_order)
            VALUES (?, ?, ?, ?, ?)`,
      params: [postId, n.image_url, n.source_url, n.page_title, i],
    };
  });

  await batch(statements);
}

export async function deleteImageCandidate(
  id: number,
  postId: number
): Promise<PostImageCandidate | null> {
  const candidate = await queryFirst<PostImageCandidate>(
    'SELECT * FROM post_image_candidates WHERE id = ? AND post_id = ?',
    [id, postId]
  );
  if (!candidate) return null;
  await execute(
    'DELETE FROM post_image_candidates WHERE id = ? AND post_id = ?',
    [id, postId]
  );
  return candidate;
}

export async function selectImageCandidate(
  postId: number,
  candidateId: number
): Promise<void> {
  // Unselect all, then select the chosen one
  await execute(
    'UPDATE post_image_candidates SET is_selected = 0 WHERE post_id = ?',
    [postId]
  );
  await execute(
    'UPDATE post_image_candidates SET is_selected = 1 WHERE id = ? AND post_id = ?',
    [candidateId, postId]
  );
}
