-- Add case study fields to projects and project_translations
-- Uses ALTER TABLE for parent (projects) to avoid CASCADE deletes on children
-- Uses CREATE/INSERT/DROP/RENAME for project_translations (no FK dependents)

-- ============ PROJECTS (parent — use ALTER to preserve child FK data) ============
-- These will fail silently on re-run since D1 execute continues past errors per-statement
-- On re-run after the table swap below, the table already has these columns

ALTER TABLE projects ADD COLUMN is_case_study INTEGER DEFAULT 0;
ALTER TABLE projects ADD COLUMN duration TEXT;
ALTER TABLE projects ADD COLUMN completed_at TEXT;

-- ============ PROJECT TRANSLATIONS (no child tables reference this) ============

DROP TABLE IF EXISTS _project_translations_new;
CREATE TABLE _project_translations_new (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  project_id INTEGER NOT NULL,
  locale TEXT NOT NULL,
  name TEXT NOT NULL,
  client_type TEXT,
  industry TEXT,
  challenge TEXT,
  solution TEXT,
  result TEXT,
  content TEXT,
  meta_title TEXT,
  meta_description TEXT,
  slug TEXT,
  UNIQUE(project_id, locale),
  FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);

INSERT INTO _project_translations_new (id, project_id, locale, name, client_type, industry, challenge, solution, result)
  SELECT id, project_id, locale, name, client_type, industry, challenge, solution, result
  FROM project_translations;

DROP TABLE project_translations;
ALTER TABLE _project_translations_new RENAME TO project_translations;

-- ============ INDEXES ============

CREATE INDEX IF NOT EXISTS idx_project_translations_locale_slug ON project_translations(locale, slug);
CREATE UNIQUE INDEX IF NOT EXISTS idx_project_translations_unique_slug ON project_translations(locale, slug) WHERE slug IS NOT NULL;
