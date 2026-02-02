-- Add missing indexes on foreign key columns used in JOINs
CREATE INDEX IF NOT EXISTS idx_post_tags_post_id ON post_tags(post_id);
CREATE INDEX IF NOT EXISTS idx_post_tags_tag ON post_tags(tag);
CREATE INDEX IF NOT EXISTS idx_service_technologies_service_id ON service_technologies(service_id);
CREATE INDEX IF NOT EXISTS idx_project_technologies_project_id ON project_technologies(project_id);

-- Prevent duplicate tags on the same post
CREATE UNIQUE INDEX IF NOT EXISTS idx_post_tags_unique ON post_tags(post_id, tag);
