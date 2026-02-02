-- Fix posts.author_id FK to use ON DELETE SET NULL
-- SQLite requires table rebuild to alter FK constraints.
--
-- D1 pitfall: PRAGMA foreign_keys=OFF does not persist across statements,
-- and ALTER TABLE RENAME updates child FK references to track the renamed table.
-- So both DROP and RENAME-then-DROP trigger ON DELETE CASCADE on children.
--
-- Safe pattern: backup child data, drop parent (cascade empties children),
-- create corrected table, restore all data.

-- Step 1: Create the corrected table under a temporary name
CREATE TABLE posts_new (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT NOT NULL UNIQUE,
  image_path TEXT,
  author_id INTEGER,
  published_at TEXT,
  is_published INTEGER DEFAULT 0,
  created_at TEXT DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (author_id) REFERENCES team_members(id) ON DELETE SET NULL
);

-- Step 2: Copy posts data into the new table
INSERT INTO posts_new SELECT * FROM posts;

-- Step 3: Backup all child table data before the CASCADE wipe
CREATE TABLE _bak_post_translations AS SELECT * FROM post_translations;
CREATE TABLE _bak_post_tags AS SELECT * FROM post_tags;
CREATE TABLE _bak_post_social_shares AS SELECT * FROM post_social_shares;
CREATE TABLE _bak_post_image_candidates AS SELECT * FROM post_image_candidates;

-- Step 4: Drop the old posts table (CASCADE empties children, but we have backups)
DROP TABLE posts;

-- Step 5: Rename the new table into place
ALTER TABLE posts_new RENAME TO posts;

-- Step 6: Restore child data
INSERT INTO post_translations SELECT * FROM _bak_post_translations;
INSERT INTO post_tags SELECT * FROM _bak_post_tags;
INSERT INTO post_social_shares SELECT * FROM _bak_post_social_shares;
INSERT INTO post_image_candidates SELECT * FROM _bak_post_image_candidates;

-- Step 7: Clean up backup tables
DROP TABLE _bak_post_translations;
DROP TABLE _bak_post_tags;
DROP TABLE _bak_post_social_shares;
DROP TABLE _bak_post_image_candidates;

-- Step 8: Recreate indexes
CREATE INDEX IF NOT EXISTS idx_posts_slug ON posts(slug);
CREATE INDEX IF NOT EXISTS idx_posts_published ON posts(is_published);
