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

**Admin API pattern:** Use `withAdmin()` wrapper or `requireAdmin()` + `handleApiError()` for auth and error handling. Dynamic params: `const { id } = await params` (Next.js 16 syntax).

### Database Layer
- `src/lib/db/client.ts` - D1 client wrapper
- `src/lib/db/schema.ts` - TypeScript types for all entities
- `src/lib/db/*.ts` - Query functions for team, projects, companies, services, faq, posts, translations
- `migrations/` - SQL migration files

**DB client helpers** (`src/lib/db/client.ts`):
- `query<T>(sql, params?)` - Returns `T[]`
- `queryFirst<T>(sql, params?)` - Returns `T | null`
- `execute(sql, params?)` - Returns `{ changes, lastRowId }`
- `batch(statements[])` - Bulk operations

## Database Schema
Tables with translation support (entity + entity_translations pattern):
- `team_members` / `team_member_translations`
- `projects` / `project_translations` / `project_technologies`
- `companies` / `company_translations`
- `services` / `service_translations` / `service_technologies` / `subservices` / `subservice_translations`
- `faq_items` / `faq_translations`
- `posts` / `post_translations` / `post_tags`

Other tables:
- `translations` (UI strings by key/namespace/locale)
- `settings` (site settings, optionally locale-specific)
- `indexnow_submitted` (tracks URLs submitted to IndexNow for rate limiting)

## Data Flow
- **Entity data** (team, companies, projects, services, FAQ, posts): Served from D1 database
- **Page copy** (hero text, section titles, CTAs): Static TypeScript files in `src/content/`
- **Admin panel**: Full CRUD via D1 database and API routes
- **Blog**: D1 only (no static fallback)

## Development

```bash
# Local dev with D1 (builds and runs Cloudflare worker)
pnpm dev

# Run all migrations locally
pnpm db:migrate:local

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

## Environment Variables
**Public** (`.env`):
- `NEXT_PUBLIC_TURNSTILE_SITE_KEY` - Cloudflare Turnstile CAPTCHA
- `NEXT_PUBLIC_GTM_ID` - Google Tag Manager container ID

**Secrets** (`wrangler.toml` vars):
- `TELEGRAM_BOT_TOKEN`, `TELEGRAM_CHAT_ID` - Contact form notifications
- `TURNSTILE_SECRET_KEY` - Validate Turnstile tokens
- `INDEXNOW_KEY` - SEO index submission
- `AUTOMATION_API_KEY` - External API auth for blog posts

## Integrations
- **Turnstile** - CAPTCHA for contact form
- **Telegram Bot** - Contact form notifications
- **IndexNow** - Auto-submits blog posts to search engines (`src/lib/indexnow.ts`)
- **Gravatar** - Team member avatars (`src/lib/gravatar.ts`)
- **Google Tag Manager** - Tag management (analytics, conversion tracking, etc.)

## Utilities
- `cn()` from `src/lib/utils.ts` - Tailwind className composition (clsx wrapper)
- `getCombinedYears()` - Returns years since 2000 (for "25+ years experience" text)

## Notes
- Admin panel uses dark theme (works in both light/dark site themes)
- Cloudflare Access must be configured in Zero Trust dashboard to protect `/admin/*` in production
- `NODE_ENV=development` bypasses admin auth for local testing
- Image optimization disabled (`unoptimized: true`) for Cloudflare compatibility
- Build limited to 1 CPU core for Cloudflare memory constraints

## CLI Tools Available
You have access to these CLIs and should use them proactively:
- **GitHub CLI (`gh`)** - Manage secrets, PRs, issues, workflows (e.g., `gh secret set`, `gh workflow run`)
- **Wrangler (`pnpm wrangler`)** - Cloudflare D1 queries, deployments, secrets (e.g., `wrangler d1 execute`)
