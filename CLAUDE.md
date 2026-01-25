# ITGuys Website

## Tech Stack
- **Framework**: Next.js 16 with App Router
- **Deployment**: Cloudflare Workers via @opennextjs/cloudflare
- **Database**: Cloudflare D1 (SQLite)
- **Styling**: Tailwind CSS v4
- **Package Manager**: pnpm

## Project Structure

### Frontend (Public Site)
- `src/app/(en)/` - English pages (default locale)
- `src/app/[locale]/` - Localized pages (ro, fr, de, it, es)
- `src/content/` - Static content files (current data source for public pages)
- `src/components/` - Reusable UI components

### Admin Panel
- `src/app/admin/` - Admin UI pages (CRUD for all entities)
- `src/app/api/admin/` - Admin API routes
- `src/lib/admin-auth.ts` - Cloudflare Access authentication
- Authentication: Cloudflare Access JWT (bypassed in development)

### Database Layer
- `src/lib/db/client.ts` - D1 client wrapper
- `src/lib/db/schema.ts` - TypeScript types for all entities
- `src/lib/db/*.ts` - Query functions for team, projects, companies, services, faq, posts, translations
- `migrations/` - SQL migration files

## Database Schema
Tables with translation support (entity + entity_translations pattern):
- `team_members` / `team_member_translations`
- `projects` / `project_translations` / `project_technologies`
- `companies` / `company_translations`
- `services` / `service_translations` / `subservices` / `subservice_translations`
- `faq_items` / `faq_translations`
- `posts` / `post_translations` / `post_tags`
- `translations` (UI strings)
- `settings` (site settings)

## Data Flow
- **Public pages**: Currently use static TypeScript files in `src/content/`
- **Admin panel**: Uses D1 database via API routes
- **Blog**: D1 only (no static fallback)

To connect public pages to D1, replace `getContent()` calls with db query functions.

## Development

```bash
# Local dev with D1 (builds and runs Cloudflare worker)
pnpm dev

# Run migrations locally
pnpm wrangler d1 execute itguys-ro --local --file=migrations/0001_initial_schema.sql

# Lint
pnpm lint
```

Local D1 data is stored in `.wrangler/state/` (SQLite).

## Deployment
- **CI/CD**: GitHub Actions (`.github/workflows/deploy.yml`)
- **Process**: Push to master → build → run migrations → deploy to Cloudflare
- **Config**: `wrangler.toml.example` with placeholders, secrets substituted via `envsubst`

## Key Files
- `wrangler.toml` - Local config (gitignored, contains secrets)
- `wrangler.toml.example` - Template with `${VAR}` placeholders for CI
- `.github/workflows/deploy.yml` - CI/CD pipeline

## Locales
Supported: en (default), ro, fr, de, it, es

## Notes
- Admin panel uses dark theme (works in both light/dark site themes)
- Cloudflare Access must be configured in Zero Trust dashboard to protect `/admin/*` in production
- `NODE_ENV=development` bypasses admin auth for local testing
