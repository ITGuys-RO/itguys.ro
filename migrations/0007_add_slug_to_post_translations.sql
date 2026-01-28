-- Add slug column to post_translations
-- NOTE: This column is now included in the initial schema (0001_initial_schema.sql)
-- This migration is kept for backwards compatibility with existing databases

-- Create indexes for locale-specific slugs (uses IF NOT EXISTS for idempotency)
CREATE INDEX IF NOT EXISTS idx_post_translations_locale_slug ON post_translations(locale, slug);
CREATE UNIQUE INDEX IF NOT EXISTS idx_post_translations_unique_slug ON post_translations(locale, slug) WHERE slug IS NOT NULL;
