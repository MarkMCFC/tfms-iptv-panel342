# TFMS IPTV Panel — Cloudflare Worker Deploy

This package wraps the provided Worker code into a Cloudflare-ready project with:

- `src/index.js` Worker entry
- `wrangler.toml` Worker, D1, and KV bindings
- `migrations/0001_init.sql` D1 schema
- GitHub Actions deploy workflow

## One-click deploy option

1. Upload this folder to a GitHub repository.
2. Replace `YOUR_GITHUB_REPO_URL` in the button below with your repository URL.
3. Click the button:

[![Deploy to Cloudflare](https://deploy.workers.cloudflare.com/button)](https://deploy.workers.cloudflare.com/?url=https://github.com/smokindope/panel-1-click)

Cloudflare will ask you to connect your account and deploy the Worker.

## Local deploy option

Install dependencies:

```bash
npm install
```

Create Cloudflare resources:

```bash
npm run d1:create
npm run kv:create
```

Copy the created D1 `database_id` and KV namespace `id` into `wrangler.toml`.

Apply the remote database migration:

```bash
npm run db:migrate:remote
```

Deploy:

```bash
npm run deploy
```

## Default login

After deploy, visit your Worker URL and log in with:

- Username: `admin`
- Password: `SecretPassword123`

Change these immediately in **Tools & Settings → Admin Settings**.

## Required bindings

The Worker expects these Cloudflare bindings:

- D1 database binding: `DB`
- KV namespace binding: `KV_CONNECTIONS`

Both are already defined in `wrangler.toml`; only the generated IDs need replacing.
