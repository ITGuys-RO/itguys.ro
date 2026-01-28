-- Add long_description column to service_translations for SEO-focused long-form content
ALTER TABLE service_translations ADD COLUMN long_description TEXT;
