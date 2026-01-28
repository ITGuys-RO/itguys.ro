# ITGuys Website

## Tech Stack
- **Framework**: Next.js 16 with App Router, React 19
- **Deployment**: Cloudflare Workers via @opennextjs/cloudflare
- **Database**: Cloudflare D1 (SQLite)
- **Styling**: Tailwind CSS v4
- **Package Manager**: pnpm

## Project Structure

### Frontend
- `src/app/(en)/` - English pages (default locale)
- `src/app/[locale]/` - Localized pages (ro, fr, de, it, es)
- `src/content/` - Static page copy (heroes, CTAs)
- `src/components/` - Reusable UI components
- `src/i18n/` - Internationalization config and navigation

### Admin Panel
- `src/app/admin/` - Admin UI (CRUD for all entities)
- `src/app/api/admin/` - Admin API routes
- Auth: Cloudflare Access JWT (bypassed locally with `ADMIN_DEV_BYPASS=true`)

**API pattern:** `withAdmin()` wrapper or `requireAdmin()` + `handleApiError()`. Dynamic params: `const { id } = await params`.

### Database
- `src/lib/db/client.ts` - D1 client (`query<T>`, `queryFirst<T>`, `execute`, `batch`)
- `src/lib/db/schema.ts` - TypeScript types
- `src/lib/db/*.ts` - Query functions per entity
- `migrations/` - SQL migrations (24 files)

## Database Schema
Entity + translations pattern:
- `services` / `service_translations` / `service_technologies` / `subservices`
- `posts` / `post_translations` / `post_tags`
- `team_members` / `team_member_translations`
- `projects` / `project_translations` / `project_technologies`
- `companies` / `company_translations`
- `faq_items` / `faq_translations`

Other: `translations` (UI strings), `settings`, `indexnow_submitted`

## Localization

**Locales:** en (default), ro, fr, de, it, es

**Localized URLs:** Routes have translated paths per locale (configured in `src/i18n/config.ts`):
- `/services` → `/ro/servicii`, `/de/dienstleistungen`, `/it/servizi`, `/es/servicios`
- `/about` → `/ro/despre-noi`, `/de/ueber-uns`, `/it/chi-siamo`

**Localized slugs:** Service detail pages use translated slugs:
- `/services/consulting` → `/ro/servicii/consultanta`, `/fr/services/conseil`

Use `getLocalizedPath()` and `generateAlternates()` from `src/i18n/config.ts` for URL handling.

## Development

```bash
pnpm dev              # Build + run Cloudflare worker locally
pnpm db:migrate:local # Run all migrations
pnpm lint             # Lint code
```

Local D1 stored in `.wrangler/state/`.

## Deployment
- **CI/CD**: GitHub Actions → push to master → build → migrations → deploy
- **Config**: `wrangler.toml.example` with `${VAR}` placeholders

## Environment Variables

**Public** (`.env.local`):
- `NEXT_PUBLIC_TURNSTILE_SITE_KEY` - Cloudflare Turnstile
- `NEXT_PUBLIC_GTM_ID` - Google Tag Manager
- `NEXT_PUBLIC_GOOGLE_SITE_VERIFICATION` - Search Console verification

**Secrets** (`wrangler.toml`):
- `TELEGRAM_BOT_TOKEN`, `TELEGRAM_CHAT_ID` - Contact notifications
- `TURNSTILE_SECRET_KEY` - Turnstile validation
- `INDEXNOW_KEY` - SEO index submission
- `AUTOMATION_API_KEY` - Blog post API auth

## Integrations
- **Turnstile** - Contact form CAPTCHA
- **Telegram Bot** - Contact form notifications
- **IndexNow** - Auto-submit new content to search engines
- **Google Tag Manager** - Analytics and tracking
- **Gravatar** - Team avatars

## Utilities
- `cn()` from `src/lib/utils.ts` - Tailwind class composition
- `getCombinedYears()` - Years since 2000 for experience text

## Notes
- Image optimization disabled for Cloudflare compatibility
- Build limited to 1 CPU core for memory constraints
- Admin panel uses dark theme

## Workflow
When working on any task, create a corresponding task in the repo's GitHub Project (`gh project`), and transition it through statuses (e.g. Todo → In Progress → Done) as work progresses. When a priority is specified (e.g. "critical"), set it using the project's priority field (`gh project item-edit`) instead of putting it in the title.

## CLI Tools
- **GitHub CLI (`gh`)** - PRs, secrets, workflows, project task tracking
- **Wrangler (`pnpm wrangler`)** - D1 queries, deployments
