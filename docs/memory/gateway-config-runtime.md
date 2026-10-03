# Gateway Config & DB-Backed Runtime Config

Runtime-tunable server config now lives in four `public` schema tables and is hot-reloaded into the Go server via Postgres `LISTEN/NOTIFY`. The admin dashboard exposes CRUD for all of them.

## Tables

| Table | Purpose | Key |
|---|---|---|
| `public.gateway_config` | Lines / channels advertised through `getLineInfo`. Operator intent. | `id smallint` |
| `public.server_settings` | Live-ops controls: `maintenance_mode`, `login_enabled`, `announcement_banner`, `global_max_players`. | `key text` |
| `public.game_tuning` | Rates (`exp_multiplier`, `drop_multiplier`, `gold_multiplier`), events (`schedule_boss_enabled`, `schedule_boss_tick_seconds`), features (`feature_pk_enabled`, etc). `category` column groups the admin UI. | `key text` |
| `public.gm_settings` | GM/security knobs: `audit_retention_days`, `login_lockout_attempts`, `login_lockout_minutes`. | `key text` |

All four tables have:
- `AFTER INSERT/UPDATE/DELETE` trigger → `public.notify_config_change()` → `pg_notify('config_change', '{"table":..., "key":..., "op":...}')`. Payload kept tiny; the Go listener does a fresh `SELECT` for the canonical state.
- `BEFORE UPDATE` trigger → `public.touch_updated_at()` to keep `updated_at` honest.

## Helper functions (schema-qualified)

- `public.list_gateway_config()` — `setof public.gateway_config`, ordered by `sort_order, id`.
- `public.upsert_gateway_config(p_id, p_name, p_url, p_max_clients, p_auction, p_guild, p_status, p_sort_order)` — returns the resulting row.
- `public.delete_gateway_config(p_id smallint)` — returns `boolean` via `with upd as (... returning 1) select exists(...)`.
- `public.list_server_settings()` / `list_game_tuning()` / `list_gm_settings()` — KV listers.
- `public.set_kv_setting(p_table, p_key, p_value, p_description, p_category)` — polymorphic upsert. `p_table::regclass` is checked against a server-side allow-list and used in dynamic `execute format(...)`. Sidesteps the pgx `VALUES (...)` text-cast bug for `jsonb` placeholders.
- `public.delete_kv_setting(p_table, p_key)` — same shape, returns `boolean`.

Migration: `supabase/migrations/<ts>_runtime_config_tables.sql` (captured via `supabase db diff -f runtime_config_tables`).
Seed: `supabase/seeds/runtime_config.sql` — idempotent defaults (3 lines + the documented KV keys).

## Go store

`internal/infrastructure/config/store/` (3 files):

- `types.go` — `GatewayLine` struct, `snapshot` value type, decoder helpers, `defaultSnapshot()`.
- `store.go` — `Store` with `sync.RWMutex`-guarded snapshot, typed accessors (`GatewayLines`, `MaintenanceMode`, `LoginEnabled`, `AnnouncementBanner`, `GlobalMaxPlayers`, `ExpMultiplier`, `DropMultiplier`, `GoldMultiplier`, `ScheduleBossEnabled`, `ScheduleBossTick`, `FeatureEnabled`, `AuditRetentionDays`, `LoginLockout`).
- `listener.go` — long-lived goroutine that acquires a pool connection, `listen config_change`, loops on `WaitForNotification` (60s deadline so the loop ticks even when idle), exp-backoff reconnect on failure. On every notify it re-fetches only the affected table.

Defaults from `defaultSnapshot()` apply when a row/key is absent — the system is safe to boot even before the seed runs.

## Wiring

`cmd/gameserver/main.go`:
- Three-mode dispatch (`monolith` / `main` / `line`) collapsed to two (`monolith` / `line`). `main` mode and its gRPC heartbeat plumbing are gone.
- `runGameServer(cfg, log, mode)` builds the `pgxpool` first → constructs `store.New(...)` → fails fast in `line` mode if `cfg.Gateway.LineID` has no matching `gateway_config` row.
- `rtmp.NewDBLineProvider(configStore, rtmpServer)` replaces `StaticLineProvider`. `getLineInfo` reads through it and gets live client counts from `rtmpServer.GetChannelConnectionCount(line.ID)`.
- Schedule boss reads `configStore.ScheduleBossEnabled()` / `ScheduleBossTick()` instead of `cfg.ScheduleBoss.*`. The `cfg.ScheduleBoss` struct has been removed.
- Auth handler has `SetConfigStore(*store.Store)`. `OnConnectAuth` returns `pkgerrors.ErrServerMaintenance` when `MaintenanceMode()` is true or `LoginEnabled()` is false.

Deleted in the same change:
- `internal/application/lineserver/`, `internal/domain/lineserver/`, `internal/infrastructure/grpc/`, `internal/infrastructure/persistence/memory/lineserver_repository.go`.
- `internal/infrastructure/rtmp/static_line_provider.go`.
- `defaultLineInfo()` hardcoded fallback in `internal/presentation/rtmp/handlers/auth/characters.go`.
- `config.LineInfo`, `config.MainServerConfig`, `config.LineServerConfig`, `config.ModeMain`. `config.GatewayConfig` reduced to `Mode` + `LineID`.

## Admin dashboard

New routes:
- `src/app/dashboard/lines/page.tsx` — table with inline status select + Edit/Delete.
- `src/app/dashboard/lines/new/page.tsx` — wraps `LineForm` in create mode.
- `src/app/dashboard/lines/[id]/page.tsx` — wraps `LineForm` in edit mode.
- `src/components/lines/line-form.tsx` — shared create/edit form.
- `src/app/dashboard/game-config/page.tsx` — `Tabs` for `server` | `tuning` | `gm`, with inline `NewEntryForm` and per-row `EntryRow` editor that infers kind (bool / number / string / json).

New API routes (all `createAdminClient()` / service-role):
- `src/app/api/lines/route.ts` — GET, POST. Server-side validation: name ≤ 80 chars, url ≤ 200 and `rtmpe?://` prefix, max_clients in `[0, 100000]`, status allow-list, control-byte rejection.
- `src/app/api/lines/[id]/route.ts` — PATCH (partial), DELETE.
- `src/app/api/game-config/[group]/route.ts` — GET, PATCH, DELETE keyed by group `server` | `tuning` | `gm`. KV keys must match `/^[a-z0-9_]+$/i`, length ≤ 64.

New service modules:
- `src/services/gateway-config.service.ts`
- `src/services/game-config.service.ts`

Sidebar gained two entries: "Lines" (Network icon) and "Game Config" (Settings icon).

## Bootstrap config (env-only)

The former YAML config files are removed; bootstrap config is env-only (`MCGAME_*` over the defaults in `internal/infrastructure/config/config.go`). The `gateway.lines` / main_server / line_server subsections and the `schedule_boss` block no longer exist there (moved to DB-backed config). What remains is bootstrap-only: DB, Redis, RTMP listener, logging, admin_http, performance, and a minimal gateway pair `mode` + `line_id`.

Mode is set with `MCGAME_GATEWAY_MODE` (`monolith` or `line`); the line id with `MCGAME_GATEWAY_LINE_ID`. Viper maps `gateway.line_id` to `MCGAME_GATEWAY_LINE_ID` (dots become underscores), not `MCGAME_LINE_ID`.

## Operator notes

- Auto-spawning line workers is out of scope. Creating a row in the dashboard does NOT start a process — the operator launches a separate `line`-mode container against the same DB.
- Auto-kicking players when a line flips to `offline` / `maintenance` is also out of scope. Use the existing dashboard kick action.
- Per-line heartbeat / liveness badge: not implemented. The status column is operator-driven, not derived from process health.
- The `dashboard/server/` page predates this work; its maintenance toggle is still cosmetic. Folding it into `server_settings.maintenance_mode` is a small follow-up — the table and Go-side reader already exist.

## Verification entry points

- NOTIFY round-trip: `psql LISTEN config_change` + `UPDATE public.gateway_config ...` (see test commands in `supabase/migrations/<ts>_runtime_config_tables.sql` comments).
- Schedule boss: edit `game_tuning.schedule_boss_enabled` → next tick reads new value (no restart).
- Maintenance: flip `server_settings.maintenance_mode` to `true::jsonb`; new `onConnectAuth` returns `ErrServerMaintenance`.
- Dashboard end-to-end: any edit → `pg_notify` → Go's `listener.go` logs `config refreshed` at debug level.
