interface Env {
  GITHUB_TOKEN: string;
  BLOG_IMAGES: R2Bucket;
  DB: D1Database;
}

interface ScheduledEvent {
  cron: string;
  scheduledTime: number;
}

interface ExecutionContext {
  waitUntil(promise: Promise<unknown>): void;
  passThroughOnException(): void;
}

async function triggerBlogWorkflow(env: Env): Promise<void> {
  const response = await fetch(
    'https://api.github.com/repos/ITGuys-RO/itguys.ro/actions/workflows/daily-tech-news.yml/dispatches',
    {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${env.GITHUB_TOKEN}`,
        'Accept': 'application/vnd.github.v3+json',
        'User-Agent': 'ITGuys-Blog-Trigger/1.0',
      },
      body: JSON.stringify({ ref: 'master' }),
    }
  );

  if (!response.ok && response.status !== 204) {
    const error = await response.text();
    console.error(`GitHub API error: ${response.status} - ${error}`);
    throw new Error(`Failed to trigger workflow: ${response.status}`);
  }

  console.log('Successfully triggered weekly-tech-news workflow');
}

interface OldPost {
  id: number;
  image_path: string;
}

async function cleanupOldImages(env: Env): Promise<void> {
  const { results } = await env.DB.prepare(
    `SELECT id, image_path FROM posts WHERE image_path IS NOT NULL AND published_at < datetime('now', '-6 months')`
  ).all<OldPost>();

  if (!results || results.length === 0) {
    console.log('No old posts with images to clean up');
    return;
  }

  const ids: number[] = [];

  for (const post of results) {
    try {
      const url = new URL(post.image_path);
      // Extract R2 key from URL path (remove leading slash)
      const key = url.pathname.replace(/^\//, '');
      await env.BLOG_IMAGES.delete(key);
      ids.push(post.id);
      console.log(`Deleted R2 object: ${key}`);
    } catch (err) {
      // Not an absolute URL or R2 delete failed — skip
      console.warn(`Skipping post ${post.id}: ${(err as Error).message}`);
    }
  }

  if (ids.length > 0) {
    const placeholders = ids.map(() => '?').join(',');
    await env.DB.prepare(
      `UPDATE posts SET image_path = NULL WHERE id IN (${placeholders})`
    ).bind(...ids).run();
    console.log(`Cleared image_path for ${ids.length} posts`);
  }
}

export default {
  async scheduled(event: ScheduledEvent, env: Env, ctx: ExecutionContext): Promise<void> {
    await triggerBlogWorkflow(env);
    await cleanupOldImages(env);
  },
};
