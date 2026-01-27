# IT Guys Website

Next.js website deployed to Cloudflare Workers.

## Architecture

```mermaid
graph TB
    subgraph "Public Site"
        Pages[Pages]
        Components[Components]
        Content[Static Content]
        ContactForm[Contact Form]
        ContactAPI[Contact API]
    end

    subgraph "Admin Panel"
        AdminUI[Admin UI]
        AdminAPI[Admin API]
    end

    subgraph "Blog Automation"
        GHA[GitHub Actions<br/>Daily 10:30 UTC]
        Generator[generate-news-post.ts]
        Perplexity[Perplexity API<br/>News Research + English]
        Claude[Claude API<br/>Translations x5]
        AutomationAPI[Automation API]
    end

    subgraph "Database"
        D1[(Cloudflare D1)]
    end

    subgraph "External Services"
        Turnstile[Cloudflare Turnstile]
        Telegram[Telegram Bot]
        IndexNow[IndexNow SEO]
        Gravatar[Gravatar]
        GA4[Google Analytics]
    end

    Pages --> Components
    Pages --> Content
    Pages --> D1
    Pages --> Gravatar
    Pages --> GA4
    ContactForm --> ContactAPI
    ContactAPI --> Turnstile
    ContactAPI --> Telegram
    AdminUI --> AdminAPI
    AdminAPI --> D1
    AdminAPI --> IndexNow
    GHA --> Generator
    Generator --> Perplexity
    Perplexity --> Generator
    Generator --> Claude
    Claude --> Generator
    Generator --> AutomationAPI
    AutomationAPI --> D1
    AutomationAPI --> IndexNow
```

## Setup

1. Install dependencies:
   ```bash
   npm install
   ```

2. Copy environment files:
   ```bash
   cp .env.example .env
   cp wrangler.toml.example wrangler.toml
   ```

3. Configure environment variables in `.env`:
   - `TELEGRAM_BOT_TOKEN` / `TELEGRAM_CHAT_ID` - Contact form notifications
   - `NEXT_PUBLIC_TURNSTILE_SITE_KEY` / `TURNSTILE_SECRET_KEY` - Spam protection

## Development

```bash
npm run dev
```

## Deployment

Build and deploy to Cloudflare:
```bash
npm run build:cloudflare
npm run deploy
```

Or preview locally with Wrangler:
```bash
npm run preview
```
