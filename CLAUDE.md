# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

This file is the single source of truth for AI coding assistants in this repo (Claude Code, Codex / `AGENTS.md`, GitHub Copilot / `.github/copilot-instructions.md` are all symlinks to it).

**Project**: Go 1.23 game server for a Flash MMO client using RTMPE (encrypted RTMP) with AMF0 serialization.

## Hard Rules

- **Languages**: Go only for backend/tools/scripts; TypeScript + pnpm only for frontend. No other languages or frameworks.
- **Never**: edit `.as` (ActionScript) files (decompiled Flash client). Never run `git commit` / `git push`, use worktrees unless the user asks.
- **Binaries**: `go build -o bin/<name> ./<pkg>` only. Never `go build ./...` or `./cmd/...` without `-o bin/...`. `bin/` is the only sanctioned output path.
- **`.go` files**: no inline comments — file-level notes at the top only. Split files >300–400 lines.
- **DB**: all database and migration work goes through the compose stack only: the project Supabase MCP (`.mcp.json` → `http://127.0.0.1:54323/api/mcp`) or the Supabase CLI with `--db-url "$DB_URL"` built from `docker/.env`. Never use the claude.ai cloud Supabase connector (`mcp__claude_ai_Supabase__*`) or any other database. `auth_database` and `database` may point to the same Supabase Postgres.
- Read the reference files (below) before starting.

## Code Layout

- `internal/application/<feature>/` — feature services (e.g. `battle/`, `quest/`).
- `internal/presentation/rtmp/handlers/<feature>/` — RPC handlers grouped by domain (e.g. `item/`, `combat/`).
- Shared RTMP helpers in `internal/presentation/rtmp/utils/`. Feature-specific helpers stay in the feature package.
- Layers depend inward: `presentation` → `application` → `domain` ← `infrastructure` (postgres/redis/rtmp/grpc). Wiring lives in `cmd/gameserver/main.go`; `pkg/rtmp` (forked go-rtmp with RTMPE) and `pkg/amf0` are vendored forks, not upstream.
- Request flow: Flash client → RTMPE → `pkg/rtmp` → `internal/infrastructure/rtmp/dispatcher.go` → handler → service → repository → Postgres. Deployable as one monolith or split into `main` (auth + registry) and `line` (gameplay) over gRPC.
- Skills and subagents live in `.agents/skills/` and `.agents/agents/`; `.claude/skills` and `.claude/agents` are directory symlinks to them. Add new ones under `.agents/` only.
- Postgres schemas: `public` (auth), `player` (runtime state), `data` (static templates).
- Other `cmd/` tools (`seedgen`, `seedsync`, `exportgamedata`, `dataimport`, `codegen`) are seed/data pipelines; build them with `-o bin/<name>` like everything else.

## Flash Client Reference

- The decompiled client is in `docs/client/` (read-only; `config/Language.as`, `system/CallBack.as`, `system/CallBackGlobal.as` are the entry points).
- RPC method names, arg order and callback payload keys must match the client exactly (typos included, e.g. `chooseCharactor`). AMF0 numbers arrive as `float64`; `iconCode` / `resCode` / `imgCode` / `portraitCode` / `colorCode` must be `int64`.
- Client tracing goes through the `flash-client-researcher` agent; end-to-end features go through the `feature-pipeline` skill.

## Database & Migrations

- **Access**: only two sanctioned paths, both against the docker compose database. (1) Project Supabase MCP (`mcp__supabase__*`, Studio port `STUDIO_LOCAL_PORT=54323`). (2) Supabase CLI with `DB_URL="postgresql://postgres:$(grep ^POSTGRES_PASSWORD= docker/.env | cut -d= -f2-)@127.0.0.1:${POSTGRES_DIRECT_PORT:-54322}/postgres"` — password and ports come from `docker/.env` (`POSTGRES_PASSWORD`, `POSTGRES_DIRECT_PORT`, `STUDIO_LOCAL_PORT`); never hard-code or print them. If the stack is down, `make game up` first.
- Schema changes: apply to the compose database, then capture with `supabase db diff --db-url "$DB_URL" -f <migration_name>`. Never hand-write migrations, never use MCP migration tools, never put `insert` statements in migrations.
- Seeds: export with `pg_dump` or `supabase db dump` to `supabase/seeds/`, one table per file.
- **Long SQL (SELECT / INSERT / UPDATE / DELETE) goes through schema-qualified Postgres functions, not inline strings in Go.** Call from Go as `select schema.fn(...)` or `select * from schema.fn(...)`. One-line lookups on a single indexed column are the only exception.
- Function workflow:
  1. Draft the functions in a `.sql` file. Defaults: `language sql` (use `plpgsql` only when you need branching or `EXECUTE`), `security invoker`, `set search_path to ''`, schema-qualify every relation as `"schema"."table"` in the body.
  2. Apply to the compose database. For multi-function files, use `docker exec -i supabase-db psql -U postgres -d postgres < file.sql` — `supabase db query -f` only runs a single statement and rejects multi-statement files.
  3. Smoke-test against real data, then capture with `supabase db diff --db-url "$DB_URL" -f <name>` so the migration lands in `supabase/migrations/`.
- Reusable function patterns:
  - `returns setof <schema>.<table>` for `Get`/`List` — reuses the existing Go `Scan` signature, and `QueryRow` surfaces "no row" as `pgx.ErrNoRows` for free.
  - `returns boolean` with `with upd as (... returning 1) select exists(...)` for single-row deletes/updates — replaces `result.RowsAffected() == 0` checks at the call site.
  - `jsonb_to_recordset($1)` for bulk inserts. Also sidesteps the pgx `VALUES (...)` type-inference bug where placeholders inside a `VALUES` row default to `text` and fail on integer columns.
  - `p_table::regclass` + `execute format('… %s …', v_regclass)` inside a `plpgsql` function for dynamic-table queries — the `regclass` cast validates the identifier server-side, so no Go-side allow-list is needed.
- Supabase MCP tool usage by intent:
  - `search_docs` — Supabase docs (prefer over web search / memory)
  - `list_tables`, `list_migrations`, `get_advisors` — inspection / review
  - `execute_sql` — queries, validation, targeted updates
  - `get_logs`, `get_project_url`, `get_publishable_keys` — environment troubleshooting

## Docs Workflow

- **Format**: `.md` is the default for all docs (research, plans, memory). Use `.html` only when visualization adds clarity — diagrams, interactive tables, charts, side-by-side comparisons. Pure-text docs stay `.md`.
- Research: `docs/research/<YYYY-MM-DD>_<INDEX>_<FEATURE_NAME>_RESEARCH.{md,html}`
- Plans: `docs/plans/<YYYY-MM-DD>_<INDEX>_<PLAN_NAME>.{md,html}`
- Per-feature memory: `docs/memory/<feature>.{md,html}` — update after every implementation; create a new file if none fits, then add a one-line link to `docs/PROJECT_KNOWLEDGE_BASE.md`.
- `docs/PROJECT_KNOWLEDGE_BASE.md` is an index only — never put content there.

## Development Commands

- One stack, no dev variant: `make game setup` writes `docker/.env` (fresh secrets), `make game up` / `make game down` start and stop the one compose file `docker/docker-compose.yml` (upstream self-hosted Supabase plus the game: monolith server, dashboard, Redis, nginx edge). `make game reset` puts the database back to the migrations and seeds. `make run` runs the host binary against the compose database.
- Redeploy after a change: `make game up` (applies new migrations, rebuilds what changed).
- Supabase CLI never starts its own stack (`supabase start` is not used): it works against the compose database on `127.0.0.1:54322` through `--db-url "$DB_URL"`, with `DB_URL="postgresql://postgres:$(grep ^POSTGRES_PASSWORD= docker/.env | cut -d= -f2-)@127.0.0.1:54322/postgres"`. Supabase MCP: `http://127.0.0.1:54323/api/mcp`.
- Build: `make build` (`bin/gameserver`).
- Tests: `make test` (all), `make test-race`, `make vet` (also `make lint`). Single test: `go test ./internal/application/auth -run TestName`. Per-area targets: `make test-rtmp`, `test-infra`, `test-cache`, `test-center`, `test-errors`.

## RPC Debug Logging (`quietMethods`)

`internal/infrastructure/rtmp/dispatcher.go` has a `quietMethods` map controlling per-method log suppression — critical for readable Docker logs.

- New methods start logged (not in map). Keep logs on during development.
- Set `quietMethods: true` only **after the user confirms** the feature works. Always ask first.

## References

- `README.md` — overview & setup.
- `docs/PROJECT_KNOWLEDGE_BASE.md` — index of `docs/memory/*.md`.
- `docs/memory/*.{md,html}` — authoritative per-feature knowledge.
- `docs/research/*.{md,html}`, `docs/plans/*.{md,html}` — research notes and feature proposals.

## Subagents

Spawn subagents to isolate context, parallelize independent work, or offload bulk mechanical tasks. Don't spawn when the parent needs the reasoning, when synthesis requires holding things together, or when spawn overhead dominates.

Pick the cheapest model that can do the subtask well (if using claude code):

- Haiku: bulk mechanical work, no judgment
- Sonnet: scoped research, code exploration, in-scope synthesis
- Opus: subtasks needing real planning or tradeoffs

If a subagent realizes it needs a higher tier than itself, return to the parent.

Parent owns final output and cross-spawn synthesis. User instructions override.
