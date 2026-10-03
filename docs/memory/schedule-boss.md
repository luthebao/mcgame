# Schedule Boss System

Per-channel respawn loop for the 35 "Các kênh" ground bosses (NPC 706–1556 from `frontend/s/sv/profile/activity.xml`). Distinct from `bossDailyBattle` (the handbook system documented at `memory/boss-daily.md`).

Loot drops for schedule kills go through the shared `data_tbl_boss_loot` registry — see `memory/boss-loot.md`. `data_tbl_schedule_boss` is now the canonical boss key for that system: a nullable `daily_boss_id` column was added, and `kind='daily_only'` rows can be inserted for daily IDs that have no world-map twin.

## Tables

- `data.data_tbl_schedule_boss` — static config seeded by `cmd/seed-schedule-bosses` from `frontend/s/sv/profile/activity.xml`. 48 rows on a fresh seed: 35 normal-tier (`LINE="Các kênh"`) + 13 mythic-tier (`LINE="Kênh 1"`). Mythic / special tier rows are present but not subject to respawn — the scheduler and the kill hook both filter on `tier = 'normal'`.
- `player.schedule_boss_state` — runtime state keyed by `(nid, channel_id)`. `is_alive=false` + `next_spawn_at` are the two fields the scheduler watches; a partial index `schedule_boss_state_due_idx` covers `next_spawn_at where not is_alive`.

## DB access (functions, not raw SQL)

Every query in the two Postgres repos goes through schema-qualified functions defined in `supabase/migrations/20260514035429_scheduleboss_functions.sql`. Repos call them as `select [*] from <schema>.fn(...)`:

| Repo method | Function |
| --- | --- |
| `ConfigRepo.List` | `data.list_active_schedule_bosses()` |
| `StateRepo.Upsert` | `player.upsert_schedule_boss_state(...)` |
| `StateRepo.Get` | `player.get_schedule_boss_state(nid, channel_id)` → `setof state` |
| `StateRepo.FetchDueSpawns` | `player.fetch_due_schedule_boss_spawns(now)` |
| `StateRepo.MarkAlive` | `player.mark_schedule_boss_alive(...)` → `boolean` |
| `StateRepo.MarkKilled` | `player.mark_schedule_boss_killed(...)` → `boolean` |
| `StateRepo.ListExistingKeys` | `player.list_schedule_boss_keys()` |
| `StateRepo.InsertMissing` | `player.insert_missing_schedule_boss_states(jsonb)` |
| `StateRepo.ListAliveByChannel` | `player.list_alive_schedule_bosses(channel_id)` |

`InsertMissing` passes the row batch as a single JSONB array (`jsonb_to_recordset` expands it server-side). All functions use `security invoker` + `set search_path to ''` and schema-qualify every relation, per project convention.

## Cooldown formula (`internal/domain/scheduleboss/cooldown.go`)

- Ground: `8h + floor(level/30) * 30min`
- Flying: `4h + floor(level/10) * 30min`
- Negative levels clamp to 0.

**Flying classifier — canonical column found**: `data.data_tbl_npc.layer = 3` marks every flying NPC (vs `layer = 1` for ground). 53 NPCs ship with `layer=3` across the world (`type=10`) and daily (`type=19`) catalogs. Description-text heuristics (`bay lên`, `cánh`) are unreliable — use the layer column.

`cmd/seed-schedule-bosses` now generates the full seed from three sources in a single pass:

1. `activity.xml <Node name="Boss">` → 48 `kind='ground'` rows (lvl 5–140 world bosses).
2. `select … from data.data_tbl_npc where type=10 and layer=3 and lv>0 and pos_map_id<>200` → 23 `kind='flying'` rows (lvl 65–160, NIDs 1638–1656, 1694, 1696, 2460, 2462). The `pos_map_id<>200` filter drops virtual encounter maps (e.g. NPC 2567 Buli has type=10 layer=3 but lives on map 200 — its real engagement is the daily panel).
3. `internal/domain/activity.BossDailyConfigs` joined to `data_tbl_npc` for name/level → 79 `kind='daily_only'` rows; tier = `'mythic'` when `IsSuper=1`; `daily_boss_id = nid` for every row.

Run via `go run ./cmd/seed-schedule-bosses > supabase/seeds/data_tbl_schedule_boss.sql`. Default DSN points to local Supabase (`postgres://postgres:postgres@127.0.0.1:54322/postgres?sslmode=disable`); override with `-dsn`. Requires `make game up` to be running.

Layer-3 daily-encounter rows (`type=19, pos_map_id=200`: 2221, 2223, 2226, …, 2456, 2458) stay `kind='daily_only'` because they're only fightable through the daily panel; their world twins (`type=10`, NIDs 1638-series, 2460/2462) carry `kind='flying'`. A boss with both modes therefore appears as two registry rows — loot is configured per-row so the world spawn and the daily encounter can drop different reward tables.

## Scheduler

`internal/application/scheduleboss/scheduler.go` — single goroutine started from `cmd/gameserver/main.go`, ticks every `cfg.ScheduleBoss.TickInterval` (default 30s), fetches due rows (`next_spawn_at <= now`, `not is_alive`), marks alive, broadcasts `onBossOn` via the injected `SceneBroadcaster` (the live `*rtmp.SceneManager`). Spawns are silent by design — only warning paths log. The DB state is the authoritative proof of spawn.

## Kill hook

`internal/application/combat/service.go:EndBattle` — on PVE victory with `battle.ChannelID > 0` and `s.scheduleBoss != nil`, iterates enemy participants; for each `ParticipantTypeCreature` whose `EntityID` is a schedule boss, calls `Service.OnBossKilled`. `OnBossKilled` is idempotent (only `MarkKilled`s alive rows). Non-schedule-boss creature kills are no-ops at the service layer (the tier check rejects them).

## Channel propagation

`combat.Battle.ChannelID int` (added in this PR) is set by the 5 RTMP handler call sites that create battles (`pvp_start.go`, `combat/battle.go` x2, `combat/encounters.go`, `npc/quest_battle.go`) right after `Start*Battle*` returns, using `ctx.Connection.GetChannelID()`. The handbook battle path (`activity/boss_daily.go:82`) uses `context.Background()` and leaves `ChannelID=0` — the kill hook is intentionally a no-op for those, since they are not schedule-boss kills.

## Client callbacks

Reuses existing client hooks in `CallBack.as`:

- `onBossOn(Object)` — sprite appears on scene.
- `onBossOff(int nid)` — sprite vanishes.

No new RPC was added. Initial scene join continues to flow through `onCreateNpcs`. The scene handler (`internal/presentation/rtmp/handlers/scene/world.go`) filters out dead schedule bosses via `Service.IsAlive` before emitting the NPC list.

## Config

`schedule_boss.{enabled, tick_interval, announce_on_spawn}` were bootstrap config keys; they were removed (config is env-only) and `internal/infrastructure/config/config.go` no longer carries them. The channel count is **not** a Schedule Boss config — it derives from the `gateway_config` DB rows (line ids), served by `config/store`. In this codebase "line" and "channel" are the same thing (`misc.go:97` literally does `SetChannelID(newLineID)`).

## Bootstrap

`internal/application/scheduleboss/bootstrap.go:Bootstrap(ctx, state, configs, channelIDs, clock)` — runs once on server start. Iterates the explicit `channelIDs` slice (built in `cmd/gameserver/main.go` from `cfg.Gateway.Lines[].ID`). For every (TierNormal config × channelID) pair, if no state row exists, inserts `is_alive=false, next_spawn_at = boot_time + Cooldown(level, kind)`. Existing rows are left alone (idempotent across restarts). With a 3-line gateway and 35 normal bosses, expect 35 × 3 = 105 state rows; with 7 lines, 35 × 7 = 245.

## Open follow-ups

- Flying-boss reclassification (SQL update on `kind`).
- Anti-zerg / damage attribution (only the first character participant currently gets `last_killer_id`).
- Drop overrides for schedule bosses (currently inherits whatever `data_tbl_npc_creature` provides).
- Admin RPC to force-spawn / force-kill a boss.
- Optional Info-level log in `Scheduler.tickOnce` per spawn for ops observability.
