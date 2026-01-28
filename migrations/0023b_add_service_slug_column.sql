-- Add slug column to service_translations for localized URLs
--
-- HISTORY:
-- - Production DB: Column was added when this migration first deployed (2026-01-28)
-- - Fresh local DBs: Column already exists in 0001_initial_schema.sql
--
-- This migration is now a no-op since the column exists in both environments.
-- Keeping the file for migration tracking consistency.

SELECT 1;

-- Create index for service slug lookups (IF NOT EXISTS makes this idempotent)
CREATE INDEX IF NOT EXISTS idx_service_translations_slug ON service_translations(locale, slug);
