# Plant Therapist

A "coming soon" landing page for **Plant Therapist** — emotional support tips for people who keep killing their houseplants. Visitors can drop their email to get notified at launch.

The product concept is a placeholder. The real point of this repo is practicing a **full CI/CD pipeline**: automated tests, lint/format checks, Docker builds, database migrations, and automatic deployment on every push to `main`.

## What it actually does

- Static landing page with an email signup form
- `POST /api/subscribers` validates the email and stores it in Postgres, ignoring duplicates
- `GET /health` checks database connectivity for uptime monitoring
- No confirmation or auto-reply emails are sent — submitted addresses are just stored in the database (viewable directly from the Neon dashboard) for manual follow-up later

## Tech stack

- Node.js + Express
- PostgreSQL ([Neon](https://neon.tech) serverless) via Drizzle ORM
- Jest + Supertest for testing
- ESLint + Prettier
- Docker
- GitHub Actions → Docker Hub → Render

## CI/CD pipeline

**On every push or PR to `main` (CI job):**
1. Install dependencies
2. Check formatting (`prettier --check`) and linting (`eslint`)
3. Run tests (`jest`)
4. Verify the Docker image builds

**On every push to `main`, once CI passes (deploy job):**
1. Run Drizzle migrations against the production database
2. Build and push a tagged Docker image to Docker Hub
3. Trigger a Render deploy hook with the new image

## Branches

- `main` — the deployed pipeline
- `cd-course` — where the CI/CD course exercises were worked through step by step, kept separate to keep `main`'s history clean

## Local development

```bash
npm install
npm run db:migrate
npm start
```

App runs at `http://localhost:3000`, health check at `/health`.

## Testing

```bash
npm test
```
