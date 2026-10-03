---
name: mcgame-go-server
description: "This skill should be used when working on MCGame server Go code — RTMP handlers, clean-architecture services, PostgreSQL persistence, game-data wiring, Supabase-backed database tasks, or server-side refactors. Triggers on \"add RPC handler\", \"fix Go server bug\", \"refactor handler package\", \"update DTO payloads\", \"inspect Supabase schema\", or any server change that must preserve Flash client compatibility."
argument-hint: "Describe the Go server task, affected feature area, and any RPC or client behavior that must be preserved."
user-invocable: true
---

# MCGame Go Server

Apply this skill to server-side Go work in the MCGame codebase whenever the task must preserve Flash client compatibility and repository conventions.

## When To Use

- Implement or fix Go server features under `cmd/`, `internal/`, `pkg/`, or Go-focused docs.
- Add or refactor RTMP handlers, application services, domain models, PostgreSQL persistence, or bootstrap wiring.
- Inspect or update Supabase-backed schema, migrations, SQL flows, or diagnostics.
- Align server DTOs and RPC behavior to the Flash client contract.

## Hard Constraints

Root `CLAUDE.md` is authoritative; the rules most at risk in server work:

- Never edit `.as` files or suggest changing Flash client source.
- Stay focused on Go server code unless writing Go server documentation.
- Do not add inline comments in `.go` files — file-level notes at the top only.
- Build binaries only into `bin/` via `go build -o bin/<name> ./<pkg>`.
- Preserve exact RPC names and payload field names, including intentional typos such as `chooseCharactor`.
- New RPC methods stay logged (not in the `quietMethods` map in `internal/infrastructure/rtmp/dispatcher.go`) until the user confirms the feature works — always ask before quieting.
- Use repository naming rules for new docs in `docs/research/` and `docs/plans/`.

## Project Facts

- Architecture follows `internal/presentation`, `internal/application`, `internal/domain`, and `internal/infrastructure`.
- RTMP handlers belong under `internal/presentation/rtmp/handlers/<feature>/`; shared RTMP helpers live in `internal/presentation/rtmp/utils/`.
- Request arguments arrive as `[]interface{}` and numeric AMF0 values are typically `float64` — cast deliberately.
- Critical client codes such as `iconCode`, `resCode`, `imgCode`, `portraitCode`, and `colorCode` must be handled as `int64`.
- Response DTOs use `map[string]interface{}` with exact Flash client field names.
- Every RPC the client awaits must send its callback on every code path — including error paths; a missing reply hangs the Flash client UI.
- The server uses logical `authDb` and `gameDb` connections (which may point to the same Supabase Postgres), and game templates are loaded through `gamedata.Manager`.

## Workflow

1. Read repository instructions first: `AGENTS.md`, `CLAUDE.md`, the `docs/PROJECT_KNOWLEDGE_BASE.md` index, the matching `docs/memory/<feature>.md` files for the affected area, and any relevant files in `docs/research/` or `docs/plans/`.
2. Trace the affected flow end to end before editing: RPC or callback, handler, service, repository, persistence, and any game data lookup.
3. Decide the change surface:
   - Handler and payload mapping
   - Application business logic
   - Domain model or repository contract
   - PostgreSQL or Supabase integration
   - Bootstrap wiring in `cmd/gameserver/main.go`
4. If the task touches database behavior, prefer Supabase-aware workflows first:
   - Search Supabase docs before guessing behavior.
   - Inspect tables, migrations, and advisors before changing schema.
   - Never use MCP migration tools for schema changes.
   - Apply database changes through Supabase CLI and always generate the migration with `supabase db diff -f <migration_name>`.
   - Route long SQL through schema-qualified Postgres functions, not inline strings in Go (see `CLAUDE.md` for the function workflow).
   - Use targeted SQL only for validation or data fixes.
5. Implement with repository conventions:
   - Keep handler packages feature-scoped.
   - Split large Go files when they approach 300 to 400 lines.
   - Cast AMF0 numeric inputs deliberately.
   - Preserve client-facing field names exactly.
6. Validate with focused Go tests when available, then build the affected binary with `go build -o bin/...` or use the relevant Makefile command.
7. If behavior or architecture changed, update the matching per-feature file under `docs/memory/<feature>.md` (create a new file and add a one-line entry to the `docs/PROJECT_KNOWLEDGE_BASE.md` index when none fits). Do not write content directly into the index file. Use the repository naming convention for new `docs/research/` or `docs/plans/` entries.

## Decision Points

- If the task only changes server behavior, stay within Go code and tests.
- If the task depends on database schema or stored behavior, inspect Supabase state before editing code and use Supabase CLI for any resulting database update.
- If a handler file becomes oversized, refactor into a feature subfolder rather than growing a top-level handler file.
- If the Flash client contract is unclear, prefer preserving existing names and payload shapes over "correcting" them; when the contract must be discovered, delegate to the `flash-client-researcher` agent rather than guessing.

## Completion Checks

- The relevant handler, service, repository, and wiring path is internally consistent.
- RPC names and payload fields still match client expectations, and every awaited RPC replies on every path.
- No `.as` files were touched.
- Any required tests or builds succeeded, or the remaining failure is clearly reported.
- The final report includes the task handled, key files changed, validation performed, and remaining risks or follow-up work.
