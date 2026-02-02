-- Track social media shares for blog posts
CREATE TABLE post_social_shares (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  post_id INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
  platform TEXT NOT NULL,
  platform_post_id TEXT,
  shared_at TEXT NOT NULL DEFAULT (datetime('now')),
  shared_by TEXT NOT NULL DEFAULT 'manual',
  UNIQUE(post_id, platform)
);
