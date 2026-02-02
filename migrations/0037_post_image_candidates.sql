CREATE TABLE IF NOT EXISTS post_image_candidates (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  post_id INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
  image_url TEXT NOT NULL,
  source_url TEXT,
  page_title TEXT,
  is_selected INTEGER DEFAULT 0,
  sort_order INTEGER DEFAULT 0,
  scraped_at TEXT NOT NULL DEFAULT (datetime('now'))
);
