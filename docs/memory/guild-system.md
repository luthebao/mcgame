# Guild System

## Domain layout

- `internal/domain/guild/guild.go` — `Guild`, `GuildMember`, constants; `ToDTO()` emits 18-key live wire shape.
- `internal/domain/guild/extras.go` — `GuildApplication`, `GuildWarehouseSlot`.
- `internal/application/guild/service.go` — `Repository` interface + `Service` struct.
- `internal/application/guild/service_extra.go` — enrichment helpers, `GetGuildByMemberForClient`, `GetGuildSkillData`, `enrichGuild`, etc.
- `internal/infrastructure/persistence/postgres/guild_repository_extra.go` — repo impl; `GetGuildSkillLevels` does a direct query (no PG function needed — simple two-column SELECT).

## DB schema

- `player.guilds` — columns: `id, name, leader_id, level, experience, population, max_population, icon, funds, contribution_total, announcement, description, join_level_req, join_approval_required, activity_points, last_activity_reset, created_at, updated_at`. Note: no `icon_code`, `daily_produce`, `money_limit`, `total_exp` columns — these are stubs emitted as defaults in `ToDTO()`.
- `player.guild_skills` — `(id, guild_id, skill_id, level)`, UNIQUE on `(guild_id, skill_id)`. `level` is populated by `player.upsert_guild_skill` (inserts with level 1 on conflict does nothing — level upgrades not yet implemented).

## Wire shape (18-key guild object, M5 parity)

`ToDTO()` emits:
- `id`, `name`, `cid`, `ln` (leader id), `level`, `exp`, `money`, `guildInfo`, `bagSlotNum`, `memLimit`, `memberNumber`, `announcement`, `joinLevelReq`, `members` — from real DB data.
- `iconCode: null` — stub; DB has only `icon` column; live capture shows `null`.
- `dailyProduce: "0"`, `daliyCost: "0"` (sic — live protocol misspelling), `moneyLimit: "0"`, `timeStamp: null`, `totalExp: g.Experience` — stubs/defaults (no backing columns).
- `time` — formatted from `g.CreatedAt` as `"2006-01-02 15:04:05"` or `nil` if zero.
- `skillData` — JSON string `{skillId: level}` from `SkillLevels map[int]int`; `"{}"` when no skills.

## skillData flow

`enrichGuild` calls `GetGuildSkillLevels` (returns `map[int]int` of skill_id→level from `guild_skills`), stores in `Guild.SkillLevels`. `buildSkillDataJSON()` serializes to JSON string. The existing `GetGuildSkillData` and `SkillDevData` are retained for backward compat with non-login guild handlers.

## Open questions (M5)

- `iconCode` has no backing DB column. Live shows `null`. When guild emblem feature lands, add `icon_code` column via Supabase CLI + `db diff` and wire it.
- `daliyCost` / `dailyProduce` / `moneyLimit` / `timeStamp` / `totalExp` as separate columns — not yet in schema. Emit defaults for now.
- `upsert_guild_skill` always inserts level=1 on new; no level-upgrade path exists yet. When guild-skill leveling is implemented, add a `level_up_guild_skill` PG function.
