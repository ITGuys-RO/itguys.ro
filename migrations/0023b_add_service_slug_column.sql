-- Add slug column to service_translations for localized URLs
-- This column was added to the initial schema but production DB was created before that update
-- NOTE: This migration will fail on fresh local DBs where the column already exists in 0001
-- In that case, delete local DB (.wrangler/state/) and re-run migrations

ALTER TABLE service_translations ADD COLUMN slug TEXT;

-- Create index for service slug lookups (this is also in 0024 but adding here for completeness)
CREATE INDEX IF NOT EXISTS idx_service_translations_slug ON service_translations(locale, slug);
