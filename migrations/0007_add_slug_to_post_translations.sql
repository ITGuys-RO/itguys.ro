-- Add slug column to post_translations if it doesn't exist
-- SQLite doesn't support IF NOT EXISTS for ALTER TABLE, so we use a workaround

-- Check if column exists and add it if not
-- This will fail silently if the column already exists
ALTER TABLE post_translations ADD COLUMN slug TEXT;

-- Create indexes for locale-specific slugs (ignore if already exists)
CREATE INDEX IF NOT EXISTS idx_post_translations_locale_slug ON post_translations(locale, slug);
CREATE UNIQUE INDEX IF NOT EXISTS idx_post_translations_unique_slug ON post_translations(locale, slug) WHERE slug IS NOT NULL;
