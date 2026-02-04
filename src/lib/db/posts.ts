import { cache } from 'react';
import { query, queryFirst, execute, batch, buildUpdateStatement } from './client';
import type { Locale } from './schema';
import { getTeamMemberLocalized } from './team';
import { generateSlug } from '../utils';
import type {
  Post,
  PostTranslation,
  PostTag,
  PostWithTranslations,
  PostLocalized,
  PostInput,
  TeamMember,
  TeamMemberTranslation,
  TeamMemberLocalized,
} from './schema';
import { getSocialShares, getSocialSharesForPosts } from './social-shares';

export async function getPosts(publishedOnly = true): Promise<Post[]> {
  if (publishedOnly) {
    return query<Post>(
      'SELECT * FROM posts WHERE is_published = 1 ORDER BY published_at DESC'
    );
  }
  return query<Post>('SELECT * FROM posts ORDER BY created_at DESC');
}

export async function getPostById(id: number): Promise<Post | null> {
  return queryFirst<Post>('SELECT * FROM posts WHERE id = ?', [id]);
}

export async function getPostBySlug(slug: string): Promise<Post | null> {
  return queryFirst<Post>('SELECT * FROM posts WHERE slug = ?', [slug]);
}

export async function getPostTranslations(postId: number): Promise<PostTranslation[]> {
  return query<PostTranslation>(
    'SELECT * FROM post_translations WHERE post_id = ?',
    [postId]
  );
}

export async function getPostTags(postId: number): Promise<string[]> {
  const rows = await query<PostTag>(
    'SELECT tag FROM post_tags WHERE post_id = ?',
    [postId]
  );
  return rows.map((r) => r.tag);
}

export async function getPostWithTranslations(id: number): Promise<PostWithTranslations | null> {
  const post = await getPostById(id);
  if (!post) return null;

  const [translations, tags, socialShares] = await Promise.all([
    getPostTranslations(id),
    getPostTags(id),
    getSocialShares(id),
  ]);

  const translationsMap = translations.reduce((acc, t) => {
    acc[t.locale as Locale] = t;
    return acc;
  }, {} as Record<Locale, PostTranslation | undefined>);

  let author: TeamMemberLocalized | undefined;
  if (post.author_id) {
    author = (await getTeamMemberLocalized(post.author_id, 'en')) ?? undefined;
  }

  return { ...post, translations: translationsMap, tags, author, socialShares };
}

export async function getAllPostsWithTranslations(): Promise<PostWithTranslations[]> {
  const posts = await query<Post>(
    'SELECT * FROM posts ORDER BY created_at DESC'
  );

  if (posts.length === 0) return [];

  const postIds = posts.map((p) => p.id);
  const placeholders = postIds.map(() => '?').join(',');

  // Batch-fetch all related data in parallel
  const [allTranslations, allTags, sharesMap, allAuthors] = await Promise.all([
    query<PostTranslation>(
      `SELECT * FROM post_translations WHERE post_id IN (${placeholders})`,
      postIds
    ),
    query<PostTag & { post_id: number }>(
      `SELECT post_id, tag FROM post_tags WHERE post_id IN (${placeholders})`,
      postIds
    ),
    getSocialSharesForPosts(postIds),
    query<{ id: number } & TeamMemberLocalized>(
      `SELECT m.id, m.slug, m.email, m.gravatar_email, m.linkedin_url, m.image_path,
              COALESCE(t.name, t_en.name) as name,
              COALESCE(t.role, t_en.role) as role,
              COALESCE(t.bio, t_en.bio) as bio
       FROM team_members m
       LEFT JOIN team_member_translations t ON t.team_member_id = m.id AND t.locale = 'en'
       LEFT JOIN team_member_translations t_en ON t_en.team_member_id = m.id AND t_en.locale = 'en'
       WHERE m.id IN (SELECT DISTINCT author_id FROM posts WHERE author_id IS NOT NULL AND id IN (${placeholders}))`,
      postIds
    ),
  ]);

  // Index by post_id
  const translationsByPost: Record<number, Record<Locale, PostTranslation | undefined>> = {};
  for (const t of allTranslations) {
    (translationsByPost[t.post_id] ??= {} as Record<Locale, PostTranslation | undefined>)[t.locale as Locale] = t;
  }

  const tagsByPost: Record<number, string[]> = {};
  for (const t of allTags) {
    (tagsByPost[t.post_id] ??= []).push(t.tag);
  }

  const authorsById: Record<number, TeamMemberLocalized> = {};
  for (const a of allAuthors) {
    authorsById[a.id] = {
      id: a.id,
      slug: a.slug,
      email: a.email,
      gravatarEmail: a.gravatarEmail,
      linkedIn: a.linkedIn,
      imagePath: a.imagePath,
      name: a.name,
      role: a.role,
      bio: a.bio,
    };
  }

  return posts.map((post) => ({
    ...post,
    translations: translationsByPost[post.id] ?? {} as Record<Locale, PostTranslation | undefined>,
    tags: tagsByPost[post.id] ?? [],
    author: post.author_id ? authorsById[post.author_id] : undefined,
    socialShares: sharesMap[post.id] ?? [],
  }));
}

export async function getPublishedPostCount(): Promise<number> {
  const result = await queryFirst<{ count: number }>(
    'SELECT COUNT(*) as count FROM posts WHERE is_published = 1'
  );
  return result?.count ?? 0;
}

export async function getPostsLocalized(
  locale: Locale,
  options?: { limit?: number; offset?: number },
): Promise<PostLocalized[]> {
  let sql = `
    SELECT p.*,
      COALESCE(t.title, t_en.title) as title,
      COALESCE(t.excerpt, t_en.excerpt) as excerpt,
      COALESCE(t.content, t_en.content) as content,
      COALESCE(t.meta_title, t_en.meta_title) as meta_title,
      COALESCE(t.meta_description, t_en.meta_description) as meta_description,
      COALESCE(t.slug, t_en.slug, p.slug) as resolved_slug
    FROM posts p
    LEFT JOIN post_translations t ON t.post_id = p.id AND t.locale = ?
    LEFT JOIN post_translations t_en ON t_en.post_id = p.id AND t_en.locale = 'en'
    WHERE p.is_published = 1
    ORDER BY p.published_at DESC
  `;
  const params: unknown[] = [locale];

  if (options?.limit) {
    sql += ' LIMIT ?';
    params.push(options.limit);
    if (options.offset) {
      sql += ' OFFSET ?';
      params.push(options.offset);
    }
  }

  const rows = await query<Post & PostTranslation & { resolved_slug: string }>(sql, params);

  if (rows.length === 0) return [];

  const rowIds = rows.map((r) => r.id);
  const placeholders = rowIds.map(() => '?').join(',');

  // Batch-fetch tags and authors for all rows
  const authorIds = [...new Set(rows.filter((r) => r.author_id).map((r) => r.author_id!))];

  const [allTags, allAuthors] = await Promise.all([
    query<PostTag & { post_id: number }>(
      `SELECT post_id, tag FROM post_tags WHERE post_id IN (${placeholders})`,
      rowIds
    ),
    authorIds.length > 0
      ? query<TeamMember & TeamMemberTranslation & { member_id: number }>(
          `SELECT m.id as member_id, m.slug, m.email, m.gravatar_email, m.linkedin_url, m.image_path,
                  COALESCE(t.name, t_en.name) as name,
                  COALESCE(t.role, t_en.role) as role,
                  COALESCE(t.bio, t_en.bio) as bio
           FROM team_members m
           LEFT JOIN team_member_translations t ON t.team_member_id = m.id AND t.locale = ?
           LEFT JOIN team_member_translations t_en ON t_en.team_member_id = m.id AND t_en.locale = 'en'
           WHERE m.id IN (${authorIds.map(() => '?').join(',')})`,
          [locale, ...authorIds]
        )
      : Promise.resolve([]),
  ]);

  const tagsByPost: Record<number, string[]> = {};
  for (const t of allTags) {
    (tagsByPost[t.post_id] ??= []).push(t.tag);
  }

  const authorsById: Record<number, TeamMemberLocalized> = {};
  for (const a of allAuthors) {
    authorsById[a.member_id] = {
      id: a.member_id,
      slug: a.slug,
      email: a.email,
      gravatarEmail: a.gravatar_email,
      linkedIn: a.linkedin_url,
      imagePath: a.image_path,
      name: a.name,
      role: a.role,
      bio: a.bio,
    };
  }

  return rows.map((row) => ({
    id: row.id,
    slug: row.resolved_slug,
    title: row.title,
    excerpt: row.excerpt,
    content: row.content,
    imagePath: row.image_path,
    publishedAt: row.published_at,
    updatedAt: row.updated_at,
    metaTitle: row.meta_title,
    metaDescription: row.meta_description,
    tags: tagsByPost[row.id] ?? [],
    author: row.author_id ? authorsById[row.author_id] : undefined,
  }));
}

export const getPostLocalized = cache(async function getPostLocalized(slug: string, locale: Locale): Promise<PostLocalized | null> {
  // First try to find by locale-specific slug in post_translations
  // Then fall back to posts.slug (canonical/English slug)
  const row = await queryFirst<Post & PostTranslation & { resolved_slug: string }>(
    `SELECT p.*,
       COALESCE(t.title, t_en.title) as title,
       COALESCE(t.excerpt, t_en.excerpt) as excerpt,
       COALESCE(t.content, t_en.content) as content,
       COALESCE(t.meta_title, t_en.meta_title) as meta_title,
       COALESCE(t.meta_description, t_en.meta_description) as meta_description,
       COALESCE(t.slug, t_en.slug, p.slug) as resolved_slug
     FROM posts p
     LEFT JOIN post_translations t ON t.post_id = p.id AND t.locale = ?
     LEFT JOIN post_translations t_en ON t_en.post_id = p.id AND t_en.locale = 'en'
     WHERE p.is_published = 1
       AND (t.slug = ? OR t_en.slug = ? OR p.slug = ?)`,
    [locale, slug, slug, slug]
  );

  if (!row) return null;

  const tags = await getPostTags(row.id);
  let author: TeamMemberLocalized | undefined;
  if (row.author_id) {
    author = (await getTeamMemberLocalized(row.author_id, locale)) ?? undefined;
  }

  return {
    id: row.id,
    slug: row.resolved_slug,
    title: row.title,
    excerpt: row.excerpt,
    content: row.content,
    imagePath: row.image_path,
    publishedAt: row.published_at,
    updatedAt: row.updated_at,
    metaTitle: row.meta_title,
    metaDescription: row.meta_description,
    tags,
    author,
  };
});

export async function getPostsByTag(
  tag: string,
  locale: Locale,
  options?: { limit?: number; offset?: number }
): Promise<PostLocalized[]> {
  let sql = `SELECT p.*,
       COALESCE(t.title, t_en.title) as title,
       COALESCE(t.excerpt, t_en.excerpt) as excerpt,
       COALESCE(t.content, t_en.content) as content,
       COALESCE(t.meta_title, t_en.meta_title) as meta_title,
       COALESCE(t.meta_description, t_en.meta_description) as meta_description,
       COALESCE(t.slug, t_en.slug, p.slug) as resolved_slug
     FROM posts p
     INNER JOIN post_tags pt ON pt.post_id = p.id AND pt.tag = ?
     LEFT JOIN post_translations t ON t.post_id = p.id AND t.locale = ?
     LEFT JOIN post_translations t_en ON t_en.post_id = p.id AND t_en.locale = 'en'
     WHERE p.is_published = 1
     ORDER BY p.published_at DESC`;
  const params: unknown[] = [tag, locale];

  if (options?.limit) {
    sql += ' LIMIT ?';
    params.push(options.limit);
    if (options.offset) {
      sql += ' OFFSET ?';
      params.push(options.offset);
    }
  }

  const rows = await query<Post & PostTranslation & { resolved_slug: string }>(sql, params);

  if (rows.length === 0) return [];

  const rowIds = rows.map((r) => r.id);
  const placeholders = rowIds.map(() => '?').join(',');
  const authorIds = [...new Set(rows.filter((r) => r.author_id).map((r) => r.author_id!))];

  const [allTags, allAuthors] = await Promise.all([
    query<PostTag & { post_id: number }>(
      `SELECT post_id, tag FROM post_tags WHERE post_id IN (${placeholders})`,
      rowIds
    ),
    authorIds.length > 0
      ? query<TeamMember & TeamMemberTranslation & { member_id: number }>(
          `SELECT m.id as member_id, m.slug, m.email, m.gravatar_email, m.linkedin_url, m.image_path,
                  COALESCE(t.name, t_en.name) as name,
                  COALESCE(t.role, t_en.role) as role,
                  COALESCE(t.bio, t_en.bio) as bio
           FROM team_members m
           LEFT JOIN team_member_translations t ON t.team_member_id = m.id AND t.locale = ?
           LEFT JOIN team_member_translations t_en ON t_en.team_member_id = m.id AND t_en.locale = 'en'
           WHERE m.id IN (${authorIds.map(() => '?').join(',')})`,
          [locale, ...authorIds]
        )
      : Promise.resolve([]),
  ]);

  const tagsByPost: Record<number, string[]> = {};
  for (const t of allTags) {
    (tagsByPost[t.post_id] ??= []).push(t.tag);
  }

  const authorsById: Record<number, TeamMemberLocalized> = {};
  for (const a of allAuthors) {
    authorsById[a.member_id] = {
      id: a.member_id,
      slug: a.slug,
      email: a.email,
      gravatarEmail: a.gravatar_email,
      linkedIn: a.linkedin_url,
      imagePath: a.image_path,
      name: a.name,
      role: a.role,
      bio: a.bio,
    };
  }

  return rows.map((row) => ({
    id: row.id,
    slug: row.resolved_slug,
    title: row.title,
    excerpt: row.excerpt,
    content: row.content,
    imagePath: row.image_path,
    publishedAt: row.published_at,
    updatedAt: row.updated_at,
    metaTitle: row.meta_title,
    metaDescription: row.meta_description,
    tags: tagsByPost[row.id] ?? [],
    author: row.author_id ? authorsById[row.author_id] : undefined,
  }));
}

export async function getAllTags(): Promise<string[]> {
  const rows = await query<{ tag: string }>(
    `SELECT DISTINCT pt.tag
     FROM post_tags pt
     INNER JOIN posts p ON p.id = pt.post_id AND p.is_published = 1
     ORDER BY pt.tag ASC`
  );
  return rows.map((r) => r.tag);
}

export async function getPostCountByTag(tag: string): Promise<number> {
  const result = await queryFirst<{ count: number }>(
    `SELECT COUNT(*) as count
     FROM posts p
     INNER JOIN post_tags pt ON pt.post_id = p.id AND pt.tag = ?
     WHERE p.is_published = 1`,
    [tag]
  );
  return result?.count ?? 0;
}

export async function createPost(input: PostInput): Promise<number> {
  const result = await execute(
    `INSERT INTO posts (slug, image_path, author_id, published_at, is_published)
     VALUES (?, ?, ?, ?, ?)`,
    [
      input.slug,
      input.image_path ?? null,
      input.author_id ?? null,
      input.published_at ?? null,
      input.is_published ?? 0,
    ]
  );

  const postId = result.lastRowId;

  // Insert translations (auto-generate slug from title if not provided)
  const translationStatements = Object.entries(input.translations).map(([locale, t]) => ({
    sql: `INSERT INTO post_translations (post_id, locale, title, excerpt, content, meta_title, meta_description, slug)
          VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
    params: [
      postId,
      locale,
      t!.title,
      t!.excerpt ?? null,
      t!.content,
      t!.meta_title ?? null,
      t!.meta_description ?? null,
      t!.slug || generateSlug(t!.title),
    ],
  }));

  // Insert tags
  const tagStatements = input.tags.map((tag) => ({
    sql: `INSERT INTO post_tags (post_id, tag) VALUES (?, ?)`,
    params: [postId, tag],
  }));

  const allStatements = [...translationStatements, ...tagStatements];
  if (allStatements.length > 0) {
    await batch(allStatements);
  }

  return postId;
}

export async function updatePost(id: number, input: Partial<PostInput>): Promise<void> {
  const statements: { sql: string; params: unknown[] }[] = [];

  const baseUpdate = buildUpdateStatement('posts', id, {
    slug: input.slug,
    image_path: input.image_path,
    author_id: input.author_id,
    published_at: input.published_at,
    is_published: input.is_published,
  });
  if (baseUpdate) statements.push(baseUpdate);

  // Translations
  if (input.translations) {
    for (const [locale, t] of Object.entries(input.translations)) {
      if (t) {
        statements.push({
          sql: `INSERT INTO post_translations (post_id, locale, title, excerpt, content, meta_title, meta_description, slug)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                ON CONFLICT(post_id, locale) DO UPDATE SET
                  title = excluded.title,
                  excerpt = excluded.excerpt,
                  content = excluded.content,
                  meta_title = excluded.meta_title,
                  meta_description = excluded.meta_description,
                  slug = excluded.slug`,
          params: [id, locale, t.title, t.excerpt ?? null, t.content, t.meta_title ?? null, t.meta_description ?? null, t.slug || generateSlug(t.title)],
        });
      }
    }
  }

  // Tags
  if (input.tags !== undefined) {
    statements.push({
      sql: 'DELETE FROM post_tags WHERE post_id = ?',
      params: [id],
    });
    for (const tag of input.tags) {
      statements.push({
        sql: 'INSERT INTO post_tags (post_id, tag) VALUES (?, ?)',
        params: [id, tag],
      });
    }
  }

  if (statements.length > 0) {
    await batch(statements);
  }
}

export async function deletePost(id: number): Promise<void> {
  await execute('DELETE FROM posts WHERE id = ?', [id]);
}

/**
 * Backfill missing translation slugs by generating them from titles.
 * Returns the number of translations updated.
 */
export async function backfillTranslationSlugs(): Promise<number> {
  const rows = await query<{ id: number; title: string }>(
    `SELECT id, title FROM post_translations WHERE slug IS NULL OR slug = ''`
  );

  let updated = 0;
  for (const row of rows) {
    const slug = generateSlug(row.title);
    if (slug) {
      await execute('UPDATE post_translations SET slug = ? WHERE id = ?', [slug, row.id]);
      updated++;
    }
  }
  return updated;
}

/**
 * Get all locale-specific slugs for a post
 * Returns a map of locale -> slug for generating hreflang alternates
 */
export async function getPostLocaleSlugs(postId: number): Promise<Record<string, string>> {
  const post = await getPostById(postId);
  if (!post) return {};

  const translations = await getPostTranslations(postId);
  const slugs: Record<string, string> = {};

  // Start with the canonical slug for all locales as fallback
  const allLocales = ['en', 'ro', 'fr', 'de', 'it', 'es'];
  for (const locale of allLocales) {
    slugs[locale] = post.slug;
  }

  // Override with locale-specific slugs where available
  for (const t of translations) {
    if (t.slug) {
      slugs[t.locale] = t.slug;
    }
  }

  return slugs;
}
