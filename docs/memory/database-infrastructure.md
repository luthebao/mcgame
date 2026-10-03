# Database & Infrastructure

## Supabase Single DB Deployment

Schema mapping: `public` replaces old `mcgame_auth`. `player` and `data` schemas replace old `mcgame_game`. Deployment: `docker/docker-compose.yml` (single file: upstream self-hosted Supabase + the game services). Source of truth: `supabase/migrations` and per-table seed files under `supabase/seeds/`. The old monolithic dumps such as `supabase/seed.sql` and `supabase/original_seed.sql` are archival inputs, not the active reset path.

Bootstrap flow: Start `db` container -> `supabase db push --db-url ...` -> load `supabase/seeds/*.sql` on fresh provision -> start remaining services.

Seed generation caveat: exported `GameData.as` records can use hexadecimal array indexes such as `d[29][0x0200]`, but the authoritative row ID remains the embedded `id` field in the record body. `cmd/seedgen/main.go` must parse both decimal and hex indexes or rows will be silently omitted from generated seed data.

`moreData.as` uses a different matching rule: overlay records target the original ActionScript assignment index, not the embedded `id` field. The shared parser preserves both values so export, merge, and seed tooling match Flash-client behavior.

Verified on 2026-04-02: backfilling the hex-keyed records added 870 missing rows across 42 `data.*` tables in the legacy monolithic seed dump before the later split into `supabase/seeds/*.sql`.

Server wiring: Separate auth and game database configs, both can point to same PostgreSQL. Auth repos read `public.accounts`, `public.sessions`, `public.login_history`. Game repos use `player.*` and `data.*` schema references.

Commands: `make game setup` (docker/.env with fresh secrets), `make game up` (db, migrations + seeds when fresh, then every service), `make game down`, `make game reset` (wipe database + storage back to migrations + seeds). `docker/utils/game.sh` implements them; direct Postgres is on `127.0.0.1:54322`, Studio + MCP on `127.0.0.1:54323`.

## One Stack For Dev And Prod

There is no separate dev compose: the Supabase CLI never starts its own stack (`supabase start` is not used). It works against the compose database through `--db-url` (`127.0.0.1:54322`). There is no `config.yaml`: the server reads `MCGAME_*` env vars over the defaults in `internal/infrastructure/config/config.go`, set from `docker/.env` (`GAME_*`) by `docker/docker-compose.yml`.

Database function workflow: for long or reused SQL in Go repositories, create or replace a schema-qualified Postgres function in the local Supabase database first, keep the default `security invoker` unless a `security definer` case is required, schema-qualify relations inside the function body, then capture the change with `supabase db diff -f <migration_name>` and call it from Go with a short `select * from schema.function_name(...)` or `select schema.function_name(...)`. `supabase db query -f <sql_file>` is fine for single statements; for multi-function local batches, apply them directly to the local Supabase Postgres container with `docker exec ... psql` first, then generate the migration with `supabase db diff -f ...`, and finish by replaying with `supabase db reset --local --yes`. This workflow now covers the major persistence repos, including account, battle, character, guild, item, pet, pet arena, quest, and relationship reads/writes.

## Redis Cache

Three-layer cache: Active Sessions (in-memory) -> Redis (primary, TTL 2h) -> PostgreSQL (source of truth).

Redis key: `player_data:<charID>` with 2-hour TTL. JSON structure: `{CharacterID, Character{}, Items{}, Skills{}, Pets{}, Quests{}}`.

`CachedQuestRepository` reads `FindByCharacterAndQuest` / `FindActiveByCharacter` from `coldLoader.GetQuests` (Redis key `player:cold:quests:<charID>`) before falling back to the in-memory `PlayerData` map. Therefore every write path that produces a new active quest must also call `coldLoader.SaveQuests` (mirrored from `Update` and the pet repo's `upsertColdPet`); otherwise reads stay stale and `takeQuest` looks like it has no effect — the start NPC keeps offering the quest, the finish NPC never lights up, and a retry hits the `character_quests_character_id_quest_id_key` unique constraint at the DB.

Data Flow - Load: activeSessions -> Redis GET -> PostgreSQL -> cache to Redis -> store in activeSessions.
Data Flow - Save: check isDirty -> update Redis SET, persist to PostgreSQL (dirty entities only).
Data Flow - Disconnect: Remove from activeSessions -> persist dirty to PostgreSQL -> delete from Redis.

Config: `MCGAME_REDIS_HOST` (default redis), `MCGAME_REDIS_PORT` (6379), `MCGAME_REDIS_PASSWORD` (empty), `MCGAME_REDIS_DB` (0).

## Giftcode System

Tables: `public.giftcode_campaigns`, `public.giftcode_codes`, `public.giftcode_rewards`, `public.giftcode_redemptions`. Uses `character_id` (not `player_id`). Gift codes are global (no server scoping).

Retained reward types: `exp`, `gold`, `gold_bind`, `silver`, `silver_bind`, `reputation`, `honor`, `vigor`, `banggong`, `arena_point`, `pet_arena_point`, `pet_arena_act_point`, `pet_chip`, `shop_gold`, `mc_beans`, various event points, and `item`.

Legacy normalization: `ninja` -> `gold_bind`, `es_points` -> `honor`.

## Infrastructure Layer

`internal/infrastructure/` contains 8 subsystem packages: `adminhttp` (admin HTTP API), `cache` (multi-layer caching with 16+ files), `config` (env-only config loading), `grpc` (gRPC for main-line server communication), `logger` (structured logging), `metrics` (Prometheus metrics), `persistence` (PostgreSQL repositories), `redis` (Redis client integration).

## Database Migrations

13 migration files in `supabase/migrations/` (as of 2026-04-05):

1. `20260328184527_baseline_mcgame_schema.sql` — Full baseline schema (147 KB)
2. `20260329035311_enable_rls.sql` — Row-level security
3. `20260329103000_add_giftcode_schema.sql` — Giftcode tables
4. `20260330070756_character_element_state.sql` — Character element state columns
5. `20260331000000_character_selected_money_type.sql` — Money type selection
6. `20260331010000_character_selected_gold_type.sql` — Gold type selection
7. `20260401174236_add_character_aptitude_columns.sql` — Character aptitude stat columns (apt_*, apt_*_evolution)
8. `20260402093000_character_pet_guard.sql` — Pet guard data column
9. `20260403000000_convert_slot_fields_to_counts.sql` — Bag/bank/pet slot field conversions
10. `20260403034544_character_gold_bigint.sql` — Gold/GoldBind int4 to bigint
11. `20260403110000_character_pm_state.sql` — PM/VIP persistence columns (vip_type, vip_expires_at, pm_exp, pm_process_data, pm_findback)
12. `20260403182718_add_character_farm_plots.sql` — Farm plot persistence table
13. `20260404153000_farm_shared_harvest_state.sql` — Farm shared harvest state

## Game Data Export Command

`cmd/exportgamedata/main.go` exports merged client-source tables from `GameData.as` plus `moreData.as` to JSON. Table names are resolved from `GamePredef.as`. Default aggregate output is `docs/data/game_data_export.json`.

Use `-tables` for a subset, `-moredata ""` to disable overlays, and `-outdir` to also emit one file per table. Utility scripts were moved under `cmd/scripts/`.

## moreData Overlay

- `moreData.as` is the decompiled `ChFields` class from `resource/ui/ChFields.swf`, which the client loads at runtime and merges into `GameData.d` (see `ResManager.as` ~line 970). It carries all localized text (`description`, `info`, `startText`, `completeText`, `msg`, `onServiceText`) **and the authoritative `awardExp` for all 5530 quests** — base GameData awardExp differs from the overlay on every quest.

## Seed SQL Sync Command

`cmd/seedsync/main.go` compares exported game data against the legacy monolithic seed dump and appends missing `data.data_tbl_*` rows without rewriting existing seed blocks. It reuses the shared ActionScript parser so hex-keyed `GameData.as` indexes and `moreData.as` overlays are interpreted consistently across export and seed-sync flows.

Verified on 2026-04-02: one run appended 1099 missing rows across 30 `data_tbl_*` tables, after which the audit reported full coverage.

## Missing Cell Value Remediation

Verified on 2026-04-02: JSON-vs-DB audit found no missing tables or row IDs, but it did find missing/defaulted cell values in `TBL_BUFF`, `TBL_CREATURE`, `TBL_EQUIPT_TEMPLATE`, `TBL_ITEM_TEMPLATE`, `TBL_NPC`, `TBL_QUEST`, and `TBL_SKILL`.

The working remediation path was: generate per-table JSON payloads, serve them over temporary HTTP on the Docker network, fetch them via `net.http_get` from PostgreSQL, and update the affected `data.data_tbl_*` rows through `jsonb_to_recordset(...)`. After the fixes, the previous seed dump was preserved as `supabase/seed.pre_missing_cell_fix_20260402_1318.sql` and the monolithic export was later superseded by per-table files under `supabase/seeds/`.

## Character Table Split (2026-04-18)

`player.characters` grew to 93 columns and was split into 8 feature-scoped tables, each keyed by `character_id bigint PRIMARY KEY REFERENCES player.characters(id) ON DELETE CASCADE` with strict 1:1 rows created eagerly in the same transaction as the core insert. All columns were preserved — nothing was dropped.

Tables:

- `player.characters` (retained) — identity, position, guild_id, VIP, dress_info, gm_level, guild_restore_*, timestamps.
- `player.character_progression` — level, experience, rebirth_*, awaken_*, star_level, soul_*.
- `player.character_attributes` — base STR/AGI/STA/INT/SPI, attr_points, current_hp/mp/sp, all apt_*+ apt_*_evolution pairs.
- `player.character_wallet` — money/money_bind, gold/gold_bind, honor, chivalry, reputation, pop, selected_money_type, selected_gold_type.
- `player.character_resources` — move_points/max, activity_points/max, vigor/max, bag_slots, bank_slots, pet_slots, temp_bag_slots, mx_temp_bag_slots.
- `player.character_life_skills` — cook_dex, fish_dex, herb_dex, medicine_dex, plant_dex.
- `player.character_feature_states` — element_type, element_rank, element_max, pm_exp, pm_process_data, pm_findback, pet_guard_data, boss_daily. Collapses small isolated feature blobs into one place.

Character combat stats are no longer persisted. `max_hp/mp/sp`, `attack`, `defense`, `magic_attack`, `magic_defense`, `hit`, `dodge`, `critical`, `critical_dmg`, and `speed` are runtime-only fields owned by Go. Repository loads now pull source attributes plus class aptitude inputs from `data.data_tbl_class`, then call `Character.RefreshRuntimeStats()` so every loaded `character.Character` already carries a fresh in-memory derived-stat cache.

Backward-compatibility: `player.characters_full` still exists for the admin dashboard PostgREST routes (`dashboard/src/app/api/players/**`), but its old combat-stat columns are now `NULL` placeholders only. Do not treat those view columns as authoritative derived stats; the live values come from the Go server's runtime character payloads and admin `player_detail` action.

Go-side load path: `internal/infrastructure/persistence/postgres/character_repository_scan.go` holds the canonical runtime-hydration scan order. `player.query_characters_full(...)` now joins `data.data_tbl_class` for `class_apt_*` inputs instead of reading `player.character_combat_stats`, and `character_repository.go` Create/Update only persist source inputs. Raw-SQL consumers that previously joined `player.characters` for `c.level`/`c.experience` (guild member and application queries in `guild_repository.go`, `guild_repository_extra.go`) now also inner-join `player.character_progression p` and reference `p.level`/`p.experience`.

DB functions updated to match: `player.get_character_progression(bigint)` now reads from `player.character_progression`; `player.get_character_social_info(bigint)` joins progression for `level`. The rest of the `player.*` functions that referenced dropped columns (e.g. `create_character`, `update_character`, `list_character_details`, `get_guild_members`) are unused by the Go server and left as broken no-op targets — they should be rewritten or dropped when someone touches them again.

Migration files: `supabase/migrations/20260417181855_character_table_split.sql` (tables + drops + view), `supabase/migrations/20260417182437_character_split_function_updates.sql` (function updates), `supabase/migrations/20260417183544_character_db_functions.sql` (new DB functions replacing long Go SQL).

Long-SQL → DB functions: all multi-line character and guild queries were extracted into schema-qualified Postgres functions, per the CLAUDE.md rule "prefer schema-qualified Postgres functions over embedding large multiline SQL in Go." The Go repositories now call a single function per operation:

- `player.query_characters_full(p_id, p_account_id, p_map_id, p_name)` — one SETOF-returning function covers all four `FindBy*` lookups via nullable filter parameters and returns class aptitude inputs for Go-side stat hydration
- `player.create_character_full(...)` — persists only source character inputs and returns the new `characters.id`
- `player.update_character_full(...)` — persists only source character inputs; returns `boolean` (false when the row is missing)
- `player.update_character_vitals(p_id, p_current_hp, p_current_mp, p_current_sp, p_last_active)` — current_hp/mp/sp + last_active touch
- `player.list_guild_members_detailed(p_guild_id)` / `get_guild_member_detailed(p_member_id)` — member list/detail joined to `character_progression`
- `player.get_guild_application_detailed(p_id)` / `get_guild_application_by_character(p_character_id)` / `list_guild_applications_detailed(p_guild_id)` — application finders joined to `character_progression`

`internal/infrastructure/persistence/postgres/character_repository_scan.go` holds a tiny `positionalArgs(n int) string` helper used by Create/Update to emit `$1,$2,...,$N` dynamically from an arg slice — keeps the Go call to a single line regardless of parameter count.

The same pattern was extended across `gamedata_repository`, `guild_repository_extra`, `magic_estate_repository`, and `marriage_repository` (migration `20260417184534_extra_db_functions.sql`). Notable additions:

- `player.get_pet_client(p_pet_id)` / `list_pet_clients()` / `get_item_instance_client(p_item_id, p_client_type)` — return client-shaped JSONB directly, replacing the 30-line `row_to_json(...)` blocks in Go
- `player.list_guilds_full()`, `add_guild_member_contribution(...)`, `set_guild_member_contribution(...)`, `update_guild_leader(p_guild_id, p_old_leader_id, p_new_leader_id, p_leader_rank, p_member_rank)` — guild member admin
- `player.list_guild_warehouse_slots(p_guild_id)` / `upsert_guild_warehouse_material(p_guild_id, p_template_id, p_count)` — warehouse slot management (the plpgsql upsert encapsulates the update-then-insert-into-free-slot logic that used to live in Go)
- `player.insert_guild_log(...)` / `load_latest_guild_log_details(p_guild_id, p_action_type)` — guild log read/write
- `player.get_magic_estate_profile(p_character_id)` / `list_magic_estate_slots(p_character_id)` / `list_magic_estate_bag(p_character_id)` — three focused SELECTs that `FindByCharacter` now composes
- `player.upsert_magic_estate_full(..., p_slots jsonb, p_bag jsonb)` — one call replaces the profile upsert + slots/bag delete+insert transaction. Go marshals its `Slots` and `Bag` maps to JSON arrays using the exact column names (`slot_id`, `mineral_id`, `cooldown_ends_at_ms`, etc.) and the plpgsql body expands them with `jsonb_array_elements`
- `player.list_magic_estate_logs(p_character_id, p_limit)` / `list_magic_estate_replays(p_character_id, p_limit)` / `save_magic_estate_replay(...)` / `save_magic_estate_log(...)`
- `player.find_marriage_by_partner(p_character_id)` / `create_marriage(...)` / `list_marriage_ranks(p_offset, p_limit)`

Dynamic-table queries in `gamedata_repository` (`GetByTableAndID`, `GetAllByTable`, `CountByTable`, the `Upsert`/`UpsertBatch` into `player.game_data_templates`, and the short `Delete*`) intentionally stayed inline — the table name is a whitelisted parameter and wrapping them in DB functions would either require one function per table or unsafe dynamic SQL.
