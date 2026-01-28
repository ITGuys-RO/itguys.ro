-- Add slug column to service_translations for localized URLs
-- NOTE: This column is now included in the initial schema (0001_initial_schema.sql)
-- This migration populates the localized slugs for existing services

-- Set English slugs (same as the service slug)
UPDATE service_translations SET slug = (
  SELECT s.slug FROM services s WHERE s.id = service_translations.service_id
) WHERE locale = 'en' AND slug IS NULL;

-- Romanian service slugs
UPDATE service_translations SET slug = 'consultanta'
WHERE locale = 'ro' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'consulting');

UPDATE service_translations SET slug = 'securitate'
WHERE locale = 'ro' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'security');

UPDATE service_translations SET slug = 'analiza-date'
WHERE locale = 'ro' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'data-analytics');

UPDATE service_translations SET slug = 'testare-qa'
WHERE locale = 'ro' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'qa-testing');

UPDATE service_translations SET slug = 'inteligenta-artificiala'
WHERE locale = 'ro' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'ai-ml');

UPDATE service_translations SET slug = 'aplicatii-web'
WHERE locale = 'ro' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'web-applications');

UPDATE service_translations SET slug = 'aplicatii-mobile'
WHERE locale = 'ro' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'mobile');

UPDATE service_translations SET slug = 'infrastructura-cloud'
WHERE locale = 'ro' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'cloud');

UPDATE service_translations SET slug = 'backend'
WHERE locale = 'ro' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'backend');

UPDATE service_translations SET slug = 'baze-de-date'
WHERE locale = 'ro' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'database');

-- French service slugs
UPDATE service_translations SET slug = 'conseil'
WHERE locale = 'fr' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'consulting');

UPDATE service_translations SET slug = 'securite'
WHERE locale = 'fr' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'security');

UPDATE service_translations SET slug = 'analyse-donnees'
WHERE locale = 'fr' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'data-analytics');

UPDATE service_translations SET slug = 'tests-qa'
WHERE locale = 'fr' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'qa-testing');

UPDATE service_translations SET slug = 'intelligence-artificielle'
WHERE locale = 'fr' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'ai-ml');

UPDATE service_translations SET slug = 'applications-web'
WHERE locale = 'fr' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'web-applications');

UPDATE service_translations SET slug = 'applications-mobiles'
WHERE locale = 'fr' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'mobile');

UPDATE service_translations SET slug = 'infrastructure-cloud'
WHERE locale = 'fr' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'cloud');

UPDATE service_translations SET slug = 'backend'
WHERE locale = 'fr' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'backend');

UPDATE service_translations SET slug = 'bases-de-donnees'
WHERE locale = 'fr' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'database');

-- German service slugs
UPDATE service_translations SET slug = 'beratung'
WHERE locale = 'de' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'consulting');

UPDATE service_translations SET slug = 'sicherheit'
WHERE locale = 'de' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'security');

UPDATE service_translations SET slug = 'datenanalyse'
WHERE locale = 'de' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'data-analytics');

UPDATE service_translations SET slug = 'qa-tests'
WHERE locale = 'de' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'qa-testing');

UPDATE service_translations SET slug = 'kuenstliche-intelligenz'
WHERE locale = 'de' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'ai-ml');

UPDATE service_translations SET slug = 'webanwendungen'
WHERE locale = 'de' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'web-applications');

UPDATE service_translations SET slug = 'mobile-apps'
WHERE locale = 'de' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'mobile');

UPDATE service_translations SET slug = 'cloud-infrastruktur'
WHERE locale = 'de' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'cloud');

UPDATE service_translations SET slug = 'backend'
WHERE locale = 'de' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'backend');

UPDATE service_translations SET slug = 'datenbanken'
WHERE locale = 'de' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'database');

-- Italian service slugs
UPDATE service_translations SET slug = 'consulenza'
WHERE locale = 'it' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'consulting');

UPDATE service_translations SET slug = 'sicurezza'
WHERE locale = 'it' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'security');

UPDATE service_translations SET slug = 'analisi-dati'
WHERE locale = 'it' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'data-analytics');

UPDATE service_translations SET slug = 'test-qa'
WHERE locale = 'it' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'qa-testing');

UPDATE service_translations SET slug = 'intelligenza-artificiale'
WHERE locale = 'it' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'ai-ml');

UPDATE service_translations SET slug = 'applicazioni-web'
WHERE locale = 'it' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'web-applications');

UPDATE service_translations SET slug = 'app-mobile'
WHERE locale = 'it' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'mobile');

UPDATE service_translations SET slug = 'infrastruttura-cloud'
WHERE locale = 'it' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'cloud');

UPDATE service_translations SET slug = 'backend'
WHERE locale = 'it' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'backend');

UPDATE service_translations SET slug = 'database'
WHERE locale = 'it' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'database');

-- Spanish service slugs
UPDATE service_translations SET slug = 'consultoria'
WHERE locale = 'es' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'consulting');

UPDATE service_translations SET slug = 'seguridad'
WHERE locale = 'es' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'security');

UPDATE service_translations SET slug = 'analisis-datos'
WHERE locale = 'es' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'data-analytics');

UPDATE service_translations SET slug = 'pruebas-qa'
WHERE locale = 'es' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'qa-testing');

UPDATE service_translations SET slug = 'inteligencia-artificial'
WHERE locale = 'es' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'ai-ml');

UPDATE service_translations SET slug = 'aplicaciones-web'
WHERE locale = 'es' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'web-applications');

UPDATE service_translations SET slug = 'aplicaciones-moviles'
WHERE locale = 'es' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'mobile');

UPDATE service_translations SET slug = 'infraestructura-cloud'
WHERE locale = 'es' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'cloud');

UPDATE service_translations SET slug = 'backend'
WHERE locale = 'es' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'backend');

UPDATE service_translations SET slug = 'bases-de-datos'
WHERE locale = 'es' AND slug IS NULL AND service_id = (SELECT id FROM services WHERE slug = 'database');

-- Create index for service slug lookups
CREATE INDEX IF NOT EXISTS idx_service_translations_slug ON service_translations(locale, slug);
