/**
 * Seed script for populating the D1 database with existing content
 *
 * Run locally with: wrangler d1 execute itguys-ro --local --file=migrations/0001_initial_schema.sql
 * Then run this script to populate with data.
 *
 * For production: Use wrangler d1 execute itguys-ro --file=migrations/0001_initial_schema.sql
 */

import { locales, type Locale } from '../src/i18n/config';

// Import content from each locale
import { aboutContent as aboutEn } from '../src/content/en/about';
import { portfolioContent as portfolioEn } from '../src/content/en/portfolio';
import { servicesContent as servicesEn } from '../src/content/en/services';

import { aboutContent as aboutRo } from '../src/content/ro/about';
import { portfolioContent as portfolioRo } from '../src/content/ro/portfolio';
import { servicesContent as servicesRo } from '../src/content/ro/services';

import { aboutContent as aboutFr } from '../src/content/fr/about';
import { portfolioContent as portfolioFr } from '../src/content/fr/portfolio';
import { servicesContent as servicesFr } from '../src/content/fr/services';

import { aboutContent as aboutDe } from '../src/content/de/about';
import { portfolioContent as portfolioDe } from '../src/content/de/portfolio';
import { servicesContent as servicesDe } from '../src/content/de/services';

import { aboutContent as aboutEs } from '../src/content/es/about';
import { portfolioContent as portfolioEs } from '../src/content/es/portfolio';
import { servicesContent as servicesEs } from '../src/content/es/services';

import { aboutContent as aboutIt } from '../src/content/it/about';
import { portfolioContent as portfolioIt } from '../src/content/it/portfolio';
import { servicesContent as servicesIt } from '../src/content/it/services';

// Content by locale
const aboutByLocale: Record<Locale, typeof aboutEn> = {
  en: aboutEn,
  ro: aboutRo,
  fr: aboutFr,
  de: aboutDe,
  es: aboutEs,
  it: aboutIt,
};

const portfolioByLocale: Record<Locale, typeof portfolioEn> = {
  en: portfolioEn,
  ro: portfolioRo,
  fr: portfolioFr,
  de: portfolioDe,
  es: portfolioEs,
  it: portfolioIt,
};

const servicesByLocale: Record<Locale, typeof servicesEn> = {
  en: servicesEn,
  ro: servicesRo,
  fr: servicesFr,
  de: servicesDe,
  es: servicesEs,
  it: servicesIt,
};

function slugify(text: string): string {
  return text
    .toLowerCase()
    .replace(/[^\w\s-]/g, '')
    .replace(/\s+/g, '-')
    .replace(/--+/g, '-')
    .trim();
}

// Generate SQL statements
function generateTeamMembersSQL(): string[] {
  const statements: string[] = [];

  // Get unique team members from English content
  const members = aboutEn.team.members;

  members.forEach((member, idx) => {
    const slug = slugify(member.name);

    statements.push(`
INSERT INTO team_members (slug, email, gravatar_email, linkedin_url, sort_order, is_active)
VALUES ('${slug}', ${member.email ? `'${member.email}'` : 'NULL'}, ${member.gravatarEmail ? `'${member.gravatarEmail}'` : 'NULL'}, ${member.linkedIn ? `'${member.linkedIn}'` : 'NULL'}, ${idx}, 1);
    `.trim());

    // Add translations for each locale
    locales.forEach((locale) => {
      const content = aboutByLocale[locale];
      const localizedMember = content.team.members[idx];
      if (localizedMember) {
        statements.push(`
INSERT INTO team_member_translations (team_member_id, locale, name, role, bio)
VALUES ((SELECT id FROM team_members WHERE slug = '${slug}'), '${locale}', '${localizedMember.name.replace(/'/g, "''")}', '${localizedMember.role.replace(/'/g, "''")}', '${localizedMember.bio.replace(/'/g, "''")}');
        `.trim());
      }
    });
  });

  return statements;
}

function generateCompaniesSQL(): string[] {
  const statements: string[] = [];

  // Get unique companies from English content
  const companies = aboutEn.experience.companies;

  companies.forEach((company, idx) => {
    const slug = slugify(company.name);

    statements.push(`
INSERT INTO companies (slug, logo_path, sort_order, is_active)
VALUES ('${slug}', '${company.logo}', ${idx}, 1);
    `.trim());

    // Add translations for each locale
    locales.forEach((locale) => {
      const content = aboutByLocale[locale];
      const localizedCompany = content.experience.companies[idx];
      if (localizedCompany) {
        statements.push(`
INSERT INTO company_translations (company_id, locale, name, description)
VALUES ((SELECT id FROM companies WHERE slug = '${slug}'), '${locale}', '${localizedCompany.name.replace(/'/g, "''")}', '${localizedCompany.description.replace(/'/g, "''")}');
        `.trim());
      }
    });
  });

  return statements;
}

function generateProjectsSQL(): string[] {
  const statements: string[] = [];

  // Get unique projects from English content
  const projects = portfolioEn.projects;

  projects.forEach((project, idx) => {
    const slug = slugify(project.name);

    statements.push(`
INSERT INTO projects (slug, image_path, external_url, sort_order, is_active)
VALUES ('${slug}', ${project.image ? `'${project.image}'` : 'NULL'}, ${project.url ? `'${project.url}'` : 'NULL'}, ${idx}, 1);
    `.trim());

    // Add technologies
    project.tech.forEach((tech, techIdx) => {
      statements.push(`
INSERT INTO project_technologies (project_id, technology, sort_order)
VALUES ((SELECT id FROM projects WHERE slug = '${slug}'), '${tech.replace(/'/g, "''")}', ${techIdx});
      `.trim());
    });

    // Add translations for each locale
    locales.forEach((locale) => {
      const content = portfolioByLocale[locale];
      const localizedProject = content.projects[idx];
      if (localizedProject) {
        statements.push(`
INSERT INTO project_translations (project_id, locale, name, client_type, industry, challenge, solution, result)
VALUES ((SELECT id FROM projects WHERE slug = '${slug}'), '${locale}', '${localizedProject.name.replace(/'/g, "''")}', '${localizedProject.clientType.replace(/'/g, "''")}', '${localizedProject.industry.replace(/'/g, "''")}', '${localizedProject.challenge.replace(/'/g, "''")}', '${localizedProject.solution.replace(/'/g, "''")}', ${localizedProject.result ? `'${localizedProject.result.replace(/'/g, "''")}'` : 'NULL'});
        `.trim());
      }
    });
  });

  return statements;
}

function generateServicesSQL(): string[] {
  const statements: string[] = [];

  // Get unique services from English content
  const services = servicesEn.services;

  services.forEach((service, idx) => {
    const slug = service.id;

    statements.push(`
INSERT INTO services (slug, category, sort_order, is_active)
VALUES ('${slug}', '${slug}', ${idx}, 1);
    `.trim());

    // Add technologies
    (service.technologies || []).forEach((tech, techIdx) => {
      statements.push(`
INSERT INTO service_technologies (service_id, technology, sort_order)
VALUES ((SELECT id FROM services WHERE slug = '${slug}'), '${tech.replace(/'/g, "''")}', ${techIdx});
      `.trim());
    });

    // Add subservices
    (service.subservices || []).forEach((sub, subIdx) => {
      const subSlug = slugify(sub.title);
      statements.push(`
INSERT INTO subservices (service_id, slug, sort_order)
VALUES ((SELECT id FROM services WHERE slug = '${slug}'), '${subSlug}', ${subIdx});
      `.trim());

      // Add subservice translations
      locales.forEach((locale) => {
        const content = servicesByLocale[locale];
        const localizedService = content.services[idx];
        const localizedSub = localizedService?.subservices?.[subIdx];
        if (localizedSub) {
          statements.push(`
INSERT INTO subservice_translations (subservice_id, locale, title, description)
VALUES ((SELECT id FROM subservices WHERE slug = '${subSlug}' AND service_id = (SELECT id FROM services WHERE slug = '${slug}')), '${locale}', '${localizedSub.title.replace(/'/g, "''")}', '${localizedSub.description.replace(/'/g, "''")}');
          `.trim());
        }
      });
    });

    // Add translations for each locale
    locales.forEach((locale) => {
      const content = servicesByLocale[locale];
      const localizedService = content.services[idx];
      if (localizedService) {
        statements.push(`
INSERT INTO service_translations (service_id, locale, title, description, details, note)
VALUES ((SELECT id FROM services WHERE slug = '${slug}'), '${locale}', '${localizedService.title.replace(/'/g, "''")}', '${localizedService.description.replace(/'/g, "''")}', ${localizedService.details ? `'${localizedService.details.replace(/'/g, "''")}'` : 'NULL'}, ${(localizedService as unknown as { note?: string }).note ? `'${(localizedService as unknown as { note: string }).note.replace(/'/g, "''")}'` : 'NULL'});
        `.trim());
      }
    });
  });

  return statements;
}

// Main seed function
function generateSeedSQL(): string {
  const allStatements: string[] = [];

  console.log('Generating team members...');
  allStatements.push(...generateTeamMembersSQL());

  console.log('Generating companies...');
  allStatements.push(...generateCompaniesSQL());

  console.log('Generating projects...');
  allStatements.push(...generateProjectsSQL());

  console.log('Generating services...');
  allStatements.push(...generateServicesSQL());

  return allStatements.join('\n\n');
}

// Output the SQL
const sql = generateSeedSQL();
console.log('\n--- SEED SQL ---\n');
console.log(sql);
console.log('\n--- END SEED SQL ---');
console.log(`\nTotal statements: ${sql.split(';').length - 1}`);
