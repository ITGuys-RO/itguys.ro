import { query, queryFirst, execute, batch } from './client';
import type { Locale } from './schema';
import { getTeamMemberLocalized } from './team';
import type {
  Post,
  PostTranslation,
  PostTag,
  PostWithTranslations,
  PostLocalized,
  PostInput,
  TeamMemberLocalized,
} from './schema';

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

  const [translations, tags] = await Promise.all([
    getPostTranslations(id),
    getPostTags(id),
  ]);

  const translationsMap = translations.reduce((acc, t) => {
    acc[t.locale as Locale] = t;
    return acc;
  }, {} as Record<Locale, PostTranslation | undefined>);

  let author: TeamMemberLocalized | undefined;
  if (post.author_id) {
    author = (await getTeamMemberLocalized(post.author_id, 'en')) ?? undefined;
  }

  return { ...post, translations: translationsMap, tags, author };
}

export async function getAllPostsWithTranslations(): Promise<PostWithTranslations[]> {
  const posts = await query<Post>(
    'SELECT * FROM posts ORDER BY created_at DESC'
  );

  const result: PostWithTranslations[] = [];
  for (const post of posts) {
    const fullPost = await getPostWithTranslations(post.id);
    if (fullPost) result.push(fullPost);
  }
  return result;
}

export async function getPostsLocalized(locale: Locale, limit?: number): Promise<PostLocalized[]> {
  // Use LEFT JOIN with COALESCE to fall back to English if translation is missing
  // For slug: prefer locale-specific slug, then English locale slug, then posts.slug
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

  if (limit) {
    sql += ' LIMIT ?';
    params.push(limit);
  }

  const rows = await query<Post & PostTranslation & { resolved_slug: string }>(sql, params);

  const result: PostLocalized[] = [];
  for (const row of rows) {
    const tags = await getPostTags(row.id);
    let author: TeamMemberLocalized | undefined;
    if (row.author_id) {
      author = (await getTeamMemberLocalized(row.author_id, locale)) ?? undefined;
    }

    result.push({
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
    });
  }

  return result;
}

export async function getPostLocalized(slug: string, locale: Locale): Promise<PostLocalized | null> {
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
       AND (t.slug = ? OR (t.slug IS NULL AND t_en.slug = ?) OR (t.slug IS NULL AND t_en.slug IS NULL AND p.slug = ?))`,
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
}

export async function getPostsByTag(tag: string, locale: Locale): Promise<PostLocalized[]> {
  const postIds = await query<{ post_id: number }>(
    'SELECT post_id FROM post_tags WHERE tag = ?',
    [tag]
  );

  if (postIds.length === 0) return [];

  const posts = await getPostsLocalized(locale);
  return posts.filter((p) => postIds.some((pt) => pt.post_id === p.id));
}

export async function getAllTags(): Promise<string[]> {
  const rows = await query<{ tag: string }>(
    'SELECT DISTINCT tag FROM post_tags ORDER BY tag ASC'
  );
  return rows.map((r) => r.tag);
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

  // Insert translations
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
      t!.slug ?? null,
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
  const updates: string[] = [];
  const values: unknown[] = [];

  if (input.slug !== undefined) {
    updates.push('slug = ?');
    values.push(input.slug);
  }
  if (input.image_path !== undefined) {
    updates.push('image_path = ?');
    values.push(input.image_path);
  }
  if (input.author_id !== undefined) {
    updates.push('author_id = ?');
    values.push(input.author_id);
  }
  if (input.published_at !== undefined) {
    updates.push('published_at = ?');
    values.push(input.published_at);
  }
  if (input.is_published !== undefined) {
    updates.push('is_published = ?');
    values.push(input.is_published);
  }

  if (updates.length > 0) {
    updates.push('updated_at = CURRENT_TIMESTAMP');
    values.push(id);
    await execute(`UPDATE posts SET ${updates.join(', ')} WHERE id = ?`, values);
  }

  // Update translations
  if (input.translations) {
    for (const [locale, t] of Object.entries(input.translations)) {
      if (t) {
        await execute(
          `INSERT INTO post_translations (post_id, locale, title, excerpt, content, meta_title, meta_description, slug)
           VALUES (?, ?, ?, ?, ?, ?, ?, ?)
           ON CONFLICT(post_id, locale) DO UPDATE SET
             title = excluded.title,
             excerpt = excluded.excerpt,
             content = excluded.content,
             meta_title = excluded.meta_title,
             meta_description = excluded.meta_description,
             slug = excluded.slug`,
          [id, locale, t.title, t.excerpt ?? null, t.content, t.meta_title ?? null, t.meta_description ?? null, t.slug ?? null]
        );
      }
    }
  }

  // Update tags
  if (input.tags !== undefined) {
    await execute('DELETE FROM post_tags WHERE post_id = ?', [id]);
    const tagStatements = input.tags.map((tag) => ({
      sql: `INSERT INTO post_tags (post_id, tag) VALUES (?, ?)`,
      params: [id, tag],
    }));
    if (tagStatements.length > 0) {
      await batch(tagStatements);
    }
  }
}

export async function deletePost(id: number): Promise<void> {
  await execute('DELETE FROM posts WHERE id = ?', [id]);
}
