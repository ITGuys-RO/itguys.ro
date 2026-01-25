-- Remove duplicate project technologies, keeping the one with the lowest id
DELETE FROM project_technologies
WHERE id NOT IN (
  SELECT MIN(id)
  FROM project_technologies
  GROUP BY project_id, technology
);

-- Remove duplicate service technologies, keeping the one with the lowest id
DELETE FROM service_technologies
WHERE id NOT IN (
  SELECT MIN(id)
  FROM service_technologies
  GROUP BY service_id, technology
);

-- Add unique constraints to prevent future duplicates
CREATE UNIQUE INDEX IF NOT EXISTS idx_project_technologies_unique
ON project_technologies(project_id, technology);

CREATE UNIQUE INDEX IF NOT EXISTS idx_service_technologies_unique
ON service_technologies(service_id, technology);
