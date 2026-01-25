-- Track URLs submitted to IndexNow to avoid rate limiting
CREATE TABLE IF NOT EXISTS indexnow_submitted (
  url TEXT PRIMARY KEY,
  submitted_at TEXT DEFAULT CURRENT_TIMESTAMP
);
