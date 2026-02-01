# ITGuys Website — AI Assistant Reference

## Tech Stack
- **Framework**: Next.js 16 with App Router, React 19
- **Deployment**: Cloudflare Workers via @opennextjs/cloudflare
- **Database**: Cloudflare D1 (SQLite)
- **Styling**: Tailwind CSS v4
- **Package Manager**: pnpm
- **Auth**: Cloudflare Access JWT (admin panel)

## Commands

```bash
pnpm dev              # Build + run Cloudflare worker locally
pnpm db:migrate:local # Run all D1 migrations
pnpm lint             # ESLint
pnpm tsx scripts/generate-news-post.ts  # Generate blog post
```

Local D1 stored in `.wrangler/state/`.

## Project Structure

### Frontend Pages
- `src/app/(en)/` — English pages (default locale, no prefix)
- `src/app/[locale]/` — Localized pages (ro, fr, de, it, es)
- `src/content/{locale}/` — Static page copy (home, about, services, development, portfolio, contact)

Pages available: `/`, `/about`, `/services`, `/services/[slug]`, `/development`, `/portfolio`, `/blog`, `/blog/[slug]`, `/contact`

All pages use `export const dynamic = 'force-dynamic'` since D1 is unavailable at build time.

### Components
- `src/components/admin/` — DataTable, FormField, MarkdownEditor, LocaleTabs, Sidebar, GlobalSearch, validation
- `src/components/layout/` — Header, Footer
- `src/components/ui/` — Button, Input, Card, Section, Carousel, AnimateOnScroll, ThemeSwitcher, LanguageSwitcher, CookieConsent
- `src/components/sections/` — Hero, CTA, ContactForm
- `src/components/illustrations/` — 8 SVG illustration components
- `src/components/providers/` — ThemeProvider, CookieConsentProvider
- `src/components/structured-data/` — Schema.org JSON-LD (Breadcrumb, Organization, WebPage)

### Admin Panel
- `src/app/admin/` — Admin UI (CRUD for services, posts, team, projects, companies, FAQ, translations)
- `src/app/api/admin/` — Admin API routes
- Auth: Cloudflare Access JWT header `Cf-Access-Jwt-Assertion` (bypassed locally with `ADMIN_DEV_BYPASS=true`)
- Dark theme, client components with fetch-based data loading

**API pattern:**
```ts
// Option A: wrapper
export const GET = withAdmin(async (request) => { ... });

// Option B: manual
export async function GET(request: NextRequest) {
  try {
    requireAdmin(request);
    // ...
  } catch (error) {
    return handleApiError(error);
  }
}
```

Dynamic params: `const { id } = await params;`

### Database Layer
- `src/lib/db/client.ts` — D1 client: `query<T>()`, `queryFirst<T>()`, `execute()`, `batch()`
- `src/lib/db/schema.ts` — TypeScript types (base, translations, localized, input variants)
- `src/lib/db/services.ts` — Service CRUD + localized queries with COALESCE fallback
- `src/lib/db/posts.ts` — Post CRUD + localized queries
- `src/lib/db/team.ts`, `projects.ts`, `companies.ts`, `faq.ts` — Same pattern
- `src/lib/db/translations.ts` — UI string management (namespace-based)
- `src/lib/db/search.ts` — Global admin search across all entities
- `migrations/` — 25 SQL migration files (0000-0024)

### Other Lib Files
- `src/lib/admin-auth.ts` — `requireAdmin()`, `withAdmin()`, `handleApiError()`
- `src/lib/gravatar.ts` — Gravatar URL from email
- `src/lib/indexnow.ts` — Submit URLs to IndexNow
- `src/lib/utils.ts` — `cn()` (Tailwind classes), `getCombinedYears()`, `generateSlug()`

## Database Schema

Entity + translations pattern (all have CASCADE deletes):
- `services` / `service_translations` / `service_technologies` / `subservices` / `subservice_translations`
- `posts` / `post_translations` / `post_tags`
- `team_members` / `team_member_translations`
- `projects` / `project_translations` / `project_technologies`
- `companies` / `company_translations`
- `faq_items` / `faq_translations`
- `translations` (UI strings: key, namespace, locale, value)
- `indexnow_submitted` (URL tracking)

Translation tables have `UNIQUE(entity_id, locale)` constraints. Queries use `COALESCE(t.field, t_en.field)` for locale fallback to English.

## Localization

**Locales:** en (default), ro, fr, de, it, es

**URL structure:**
- English: `/services` (no prefix)
- Other: `/{locale}/{localized-path}` (e.g., `/ro/servicii`, `/de/dienstleistungen`)

**Key files:**
- `src/i18n/config.ts` — `locales`, `pathnames` map, `getLocalizedPath()`, `getInternalPath()`, `generateAlternates()`
- `src/i18n/navigation.tsx` — Custom `Link`, `usePathname()`, `useRouter()` with locale awareness
- `middleware.ts` — Rewrites localized paths to internal routes (e.g., `/ro/servicii` → `/ro/services`)

**Localized slugs:** Service and blog detail pages have per-locale slugs stored in translation tables. Use `getServiceLocaleSlugs()` / `getPostLocaleSlugs()` for hreflang alternates.

**Content files:** `src/content/{locale}/*.ts` — Static page copy. Access via `getContent(locale)`.

**In-page text pattern:**
```ts
const text: Record<Locale, string> = { en: 'Back', ro: 'Înapoi', fr: 'Retour', ... };
```

## CI/CD

Three GitHub Actions workflows:
1. **deploy.yml** — Push to master: build → migrate D1 → deploy workers → set worker secrets
2. **daily-tech-news.yml** — Cron: generate blog post via Perplexity + Claude APIs → publish via automation API
3. **sitemap-indexing.yml** — After deploy/blog: submit new URLs to IndexNow + Google Search Console

**Secrets handling:**
- Worker secrets (TELEGRAM_BOT_TOKEN, TURNSTILE_SECRET_KEY, etc.) are set via `wrangler secret put` after deploy — **never** placed in `wrangler.toml` `[vars]`
- `wrangler.toml.example` only contains non-secret config + `${D1_DATABASE_ID}` placeholder (substituted via `envsubst`)
- In workflows, always pass secrets via `env:` block and reference as `$VAR` — **never** interpolate `${{ secrets.* }}` directly in `run:` blocks (prevents process-list exposure and script injection)
- For local dev, secrets go in `.dev.vars` (gitignored), not in `wrangler.toml`

## Environment Variables

**Public** (`.env.local`):
- `NEXT_PUBLIC_TURNSTILE_SITE_KEY`, `NEXT_PUBLIC_GTM_ID`, `NEXT_PUBLIC_GOOGLE_SITE_VERIFICATION`

**Worker Secrets** (set via `wrangler secret put` in deploy workflow):
- `TELEGRAM_BOT_TOKEN`, `TELEGRAM_CHAT_ID` — Contact notifications
- `TURNSTILE_SECRET_KEY` — Turnstile validation
- `INDEXNOW_KEY` — SEO submission
- `AUTOMATION_API_KEY` — Blog automation auth

## Integrations
- **Cloudflare Turnstile** — Contact form CAPTCHA
- **Telegram Bot** — Contact form notifications
- **IndexNow** — Auto-submit new content to search engines
- **Google Tag Manager** — Analytics (conditional on cookie consent)
- **Gravatar** — Team member avatars
- **Perplexity API** — Blog news research
- **Claude API** — Blog translation to 5 locales

## Important Patterns

- All admin pages are `'use client'` with `useState`/`useEffect` fetch pattern
- Database queries return camelCase types via `as` aliases in SQL
- `TranslationsWithRequiredEnglish<T>` — en is required, other locales optional
- Structured data via JSON-LD components on public pages
- Image optimization disabled (`unoptimized: true`) for Cloudflare compatibility
- Build limited to 1 CPU core (`cpus: 1, workerThreads: false`)

## Workflow
When working on any task, create a corresponding task in the repo's GitHub Project (`gh project`), and transition it through statuses (e.g. Todo → In Progress → Done) as work progresses. When a priority is specified (e.g. "critical"), set it using the project's priority field (`gh project item-edit`) instead of putting it in the title.

## CLI Tools
- **GitHub CLI (`gh`)** — PRs, secrets, workflows, project task tracking
- **Wrangler (`pnpm wrangler`)** — D1 queries, deployments
