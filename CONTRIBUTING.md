# Contributing

This is a proprietary project. External contributions are not accepted at this time.

## Internal Contributors

If you are a team member, follow these guidelines:

### Getting Started

1. Clone the repository
2. Install dependencies: `pnpm install`
3. Copy `.env.example` to `.env.local` and fill in the required values
4. Copy `.dev.vars.example` to `.dev.vars` for worker secrets
5. Run migrations: `pnpm db:migrate:local`
6. Start the dev server: `pnpm dev`

### Branch Workflow

- Create a feature branch from `master`
- Use descriptive branch names (e.g., `feature/add-twitter-integration`, `fix/contact-form-validation`)
- Open a pull request when ready for review
- Ensure `pnpm lint` passes before requesting review

### Commit Messages

Write clear, concise commit messages that explain the *why*, not just the *what*.

### Code Standards

- Follow existing patterns in the codebase
- Run `pnpm lint` before committing
- All admin pages use the client component fetch pattern
- Database queries should use camelCase aliases
- Translations require English (`en`) at minimum; other locales are optional

### Security

- Never commit secrets or credentials
- Worker secrets go in `.dev.vars` locally and are set via `wrangler secret put` in CI
- Never place secrets in `wrangler.toml`

### Questions

Reach out to the team at **contact@itguys.ro**.
