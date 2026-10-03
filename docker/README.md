# MCGame Docker Stack

One Docker Compose file that runs the whole MCGame server for development and production: a self-hosted [Supabase](https://supabase.com/docs/guides/self-hosting/docker) (upstream, Envoy gateway) plus the game itself (monolith server, admin dashboard, Redis and an nginx edge).

- **One stack, no dev variant.** `docker-compose.yml` is the only compose file.
- **Reproducible.** `make game reset` always puts the database back to the migrations and seeds.
- **Secrets by default.** `make game setup` generates fresh keys; nothing ships with a default password.

## Contents

- [Architecture](#architecture)
- [Requirements](#requirements)
- [Quick start](#quick-start)
- [Commands](#commands)
- [Services and ports](#services-and-ports)
- [Configuration](#configuration)
- [Database access](#database-access)
- [Optional services](#optional-services)
- [Directory layout](#directory-layout)
- [Troubleshooting](#troubleshooting)
- [Upstream references](#upstream-references)

## Architecture

```text
 Flash client ──RTMPE──► rtmp-edge (nginx :1935) ──► mcgame-server ──► Postgres (supabase-db)
      │                                                    │  │
      └──HTTP── rtmp-edge (nginx :8888, SWF + assets)      │  └──► Redis
                                                           │
 Admin dashboard (:3000) ──► mcgame-server admin API       │
            └──────────────► Supabase API gateway (Envoy :8000) ──► auth / rest / studio / meta
```

The game server runs as a monolith (`MCGAME_GATEWAY_MODE=monolith`). The `main` + `line` split over gRPC is possible but is not part of this compose file.

## Requirements

- Docker with the Compose v2 plugin (`docker compose`)
- GNU Make
- [Supabase CLI](https://supabase.com/docs/guides/local-development/cli/getting-started). It only applies migrations to the compose database; it never starts its own stack
- `sh`, `openssl` (used by the key generators)

## Quick start

Run everything from the **repository root**, not from `docker/`.

```bash
make game setup   # one-time: writes docker/.env with fresh secrets
make game up      # database, migrations (+ seeds on a fresh database), then every service
```

When `up` finishes:

| What | Where |
| --- | --- |
| Game client (SWF) | <http://localhost:8888/s/sv/GameLoaders.swf?isExpand=true> |
| Admin dashboard | <http://localhost:3000> |
| Supabase API gateway | <http://localhost:8000> |
| Supabase Studio (host only) | <http://127.0.0.1:54323> |

To play, see [Play the Game](../README.md#play-the-game-flash-player) in the root README.

Stop and start again:

```bash
make game down    # stops every service, data stays
make game up
```

## Commands

| Command | What it does |
| --- | --- |
| `make game setup` | Writes `docker/.env` from `.env.example` with fresh Supabase secrets. Game server settings (`GAME_*`) live in the same file. Asks before wiping a database that was made with the old secrets. Keeps the `GOOGLE_*` sign-in values of an existing `.env`. |
| `make game up` | Starts the database, applies migrations (and seeds on a fresh database), then builds and starts every service. Prunes dangling images afterwards. |
| `make game down` | Stops every service, including the optional profile. Data stays. |
| `make game reset` | Wipes the database and storage back to the migrations and seeds, then runs `up`. |

Commands can be chained: `make game down up`.

On Windows, build the Go tool once with `go build -o bin/game.exe ./cmd/game` and run `bin\game <setup|up|down|reset>` from the repository root; it behaves the same, and `-y` answers the questions like `CONFIRM=1`.

`CONFIRM=1` answers the confirmation prompts, for example `CONFIRM=1 make game reset`.

Redeploy after a code or migration change with `make game up`; it applies new migrations and rebuilds only what changed.

The scripts live in [`utils/`](./utils):

| Script | Purpose |
| --- | --- |
| `game.sh` | Implements `make game <setup\|up\|down\|reset>` |
| `generate-keys.sh` | Generates the Postgres password, JWT secret, `ANON_KEY` / `SERVICE_ROLE_KEY` and the other secrets |
| `add-new-auth-keys.sh` | Generates the asymmetric (ES256) key pair and the opaque API keys |

## Services and ports

### Game

| Service | Container | Port | Notes |
| --- | --- | --- | --- |
| `rtmp-edge` | `mcgame-rtmp-edge` | `1935`, `8888` | nginx: RTMP proxy and static SWF / asset server (config in [`nginx/rtmp.conf`](./nginx/rtmp.conf)) |
| `mcgame-server` | `mcgame-server` | `2112` | Game server; RTMP (`1935`) and admin HTTP (`8080`) are only reachable inside the compose network. `2112` serves metrics |
| `dashboard` | `mcgame-dashboard` | `3000` | Admin dashboard (Next.js) |
| `redis` | `mcgame-redis` | `6379` | Cache, with append-only persistence in the `redis-data` volume |

### Supabase

| Service | Container | Port | Notes |
| --- | --- | --- | --- |
| `api-gw` | `supabase-envoy` | `8000` | Envoy API gateway for Auth, REST and Studio |
| `db` | `supabase-db` | `127.0.0.1:54322` | Postgres 17, direct access for this host only |
| `studio` | `supabase-studio` | `127.0.0.1:54323` | Studio and its MCP endpoint (`/api/mcp`), host only |
| `auth`, `rest`, `meta` | `supabase-auth`, `supabase-rest`, `supabase-meta` | internal | GoTrue, PostgREST, postgres-meta |

Ports `54322` and `54323` are bound to `127.0.0.1` on purpose. Do not expose them publicly.

Postgres schemas used by the game: `public` (auth), `player` (runtime state) and `data` (static templates).

## Configuration

Everything is configured through `docker/.env`, which `make game setup` creates from [`.env.example`](./.env.example) with `0600` permissions. **Never commit `.env`.**

Game server settings (passed to the container as `MCGAME_*`):

| Variable | Default | Description |
| --- | --- | --- |
| `GAME_SERVER_ENVIRONMENT` | `development` | Environment name |
| `GAME_LOG_LEVEL` | `debug` | Log level |
| `GAME_LOG_FORMAT` | `console` | `console` or structured output |
| `GAME_DB_MAX_CONNECTIONS` | `50` | Pool size for the game database |
| `GAME_AUTH_DB_MAX_CONNECTIONS` | `20` | Pool size for the auth database |
| `GAME_RTMP_CHUNK_SIZE` | `4096` | RTMP chunk size |
| `GAME_RTMP_MAX_CONNECTIONS` | `1000` | Maximum concurrent RTMP connections |
| `GAME_DEBUG_LOG_PLAYER_DATA` | `false` | Log player payloads (noisy, development only) |
| `GAME_TZ` | `Asia/Ho_Chi_Minh` | Time zone of the game containers and Postgres sessions |

Other variables you will likely touch:

| Variable | Description |
| --- | --- |
| `SUPABASE_PUBLIC_URL`, `API_EXTERNAL_URL` | Public URLs. Change both when deploying to a real domain |
| `ADMIN_DASHBOARD_PORT`, `ADMIN_DASHBOARD_SECRET` | Dashboard port and the shared secret for the admin API. **Change the secret** before exposing the dashboard |
| `DASHBOARD_USERNAME`, `DASHBOARD_PASSWORD` | Basic-auth login for Studio |
| `POSTGRES_DIRECT_PORT`, `STUDIO_LOCAL_PORT` | Host-only ports for Postgres (`54322`) and Studio (`54323`) |
| `GOOGLE_ENABLED`, `GOOGLE_CLIENT_ID`, `GOOGLE_SECRET` | Google sign-in |
| `ENABLE_EMAIL_SIGNUP`, `ENABLE_EMAIL_AUTOCONFIRM`, `DISABLE_SIGNUP`, `SMTP_*` | Auth sign-up and email behaviour |

The full list of Supabase variables is documented in [CONFIG.md](./CONFIG.md).

### Rotating secrets

Secrets are baked into the database on first start. Changing them later needs a new database, so `make game setup` asks before it wipes an existing one. To rotate on a stack you want to keep, back up first.

## Database access

Postgres is published on `127.0.0.1:54322` for the Supabase CLI, `go test` and `psql`:

```bash
DB_URL="postgresql://postgres:$(grep ^POSTGRES_PASSWORD= docker/.env | cut -d= -f2-)@127.0.0.1:54322/postgres"

psql "$DB_URL"
supabase db diff --db-url "$DB_URL" -f <migration_name>
```

Migrations live in `supabase/migrations/` and seeds in `supabase/seeds/` (one table per file). Capture schema changes with `supabase db diff` instead of writing migrations by hand.

To run the game server on the host against this database instead of the container: `make run`.

## Optional services

Realtime, Storage, imgproxy, Edge Functions and the Supavisor pooler are part of upstream Supabase but are off by default because the game does not need them. Enable them with the `optional` profile:

```bash
docker compose --env-file docker/.env -f docker/docker-compose.yml --profile optional up -d
```

## Directory layout

```text
docker/
├── docker-compose.yml     the one compose file
├── .env.example           template for .env (committed)
├── .env                   generated secrets (git-ignored)
├── nginx/rtmp.conf        RTMP proxy and static asset edge
├── utils/                 game.sh, generate-keys.sh, add-new-auth-keys.sh
├── volumes/               config mounted into Supabase containers; db/data and storage appear at runtime
├── CONFIG.md              upstream Supabase configuration reference
├── CHANGELOG.md           upstream Supabase changelog
└── versions.md            image version history
```

## Troubleshooting

**`Missing docker/.env; run: make game setup`**: run `make game setup` first.

**`The migration history is empty but the game tables exist`**: the database is half-applied. Run `make game reset`.

**The client cannot connect**: check that `1935` and `8888` are reachable and read the logs:

```bash
docker compose --env-file docker/.env -f docker/docker-compose.yml ps
docker logs -f mcgame-server
docker logs -f mcgame-rtmp-edge
```

The server also writes to `temp/mcgame-server.log` in the repository root.

**A port is already in use**: change it in `docker/.env` (`API_GW_HTTP_PORT`, `ADMIN_DASHBOARD_PORT`, `POSTGRES_DIRECT_PORT`, `STUDIO_LOCAL_PORT`). `1935`, `8888`, `6379` and `2112` are fixed in `docker-compose.yml`.

**Start from scratch**: `CONFIRM=1 make game reset`. This deletes the database and storage.

## Upstream references

This stack builds on the official self-hosted Supabase setup.

- [CONFIG.md](./CONFIG.md): configuration reference
- [CHANGELOG.md](./CHANGELOG.md): upstream changes
- [versions.md](./versions.md): Docker image versions
- [Self-hosting with Docker](https://supabase.com/docs/guides/self-hosting/docker)
