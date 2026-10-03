# Boss Daily Panel RPC (`bossDailyGetData`)

Loot drops for daily kills run through the shared `data_tbl_boss_loot` registry — see `memory/boss-loot.md`. The daily handler tags `battle.BossCtx` after `StartPVEBattleWithMultipleEnemies` so `combat.EndBattle` can attribute the kill to the canonical `schedule_boss.nid` (resolved from `daily_boss_id`).

Client panel contract for Beast Handbook (`BossDailyPanel`) supports two data paths:

- responder result from `_core.remote.call("bossDailyGetData", new Responder(onGetData))`
- callback bridge `onOpenBossDailyPanel(payload)` in `CallBack.as`

Server compatibility implementation now provides both in one RPC call:

- returns payload directly
- also sends callback `onOpenBossDailyPanel` when connection exists

Payload shape required by panel:

- `total`: daily total quota
- `t`: current server timestamp (milliseconds)
- `data`: object containing:
  - `d`: cycle day string (`month-1|day|weekday`)
  - `n`: used count
  - `data`: per-boss progress map

Current default behavior in Go scope:

- `total = 16`
- `data.n = 0`
- `data.data = {}`
- `data.now = t`
- `data.dfd = {}`

RPC dispatcher now rate-limits `bossDailyGetData` at `1100ms`.

## Boss level preservation

Boss-flagged templates (`BossFlag > 0`) bypass `NormalizeEncounterTemplateForPlayer` so
boss-daily encounters (and any map boss with `boss_flag > 0`) keep their configured level.
Wild encounters (`BossFlag == 0`) continue to be clamped to `playerLevel + 5` via
`clampEncounterLevel`. The fix is in `internal/application/combat/npc_stats.go:37-51`.

- `boss_flag = 1`: main boss row — level preserved
- `boss_flag = 2`: minion row — level preserved (minions of a level-160 boss spawn at 160)

The Flash client relies on receiving the true configured boss level to run its own
`script_npc_level` under-leveled-reward penalty check.

## World boss ↔ daily entry mapping

Each daily boss in `BossDailyConfigs` (`internal/domain/activity/boss_config.go`) has a twin
`data.data_tbl_npc` row that shares the Vietnamese name. The two rows differ:

- **Daily row** (e.g. id 2204): `type=19` (`NPCTypeStoryBattle`, a few are 10), `pos_map_id=200`
  (virtual instance), spawns the `【Sổ Tay Ma Thú】` creature variant via
  `data_tbl_npc_creature.nid=<daily_id>` with richer EXP. Fought only through
  `bossDailyBattle(<daily_id>)`.
- **World row** (e.g. id 706): `type=10` (`NPCTypeBattle`), `pos_map_id` is a real map,
  spawns the un-suffixed world creature template via `data_tbl_npc_creature.nid=<world_id>`.
  Fought by clicking the NPC on the live map — but only when an active quest matches it;
  otherwise `ClickNpc` falls through to `npcFuncInit state=-1`.

Click-to-fight without a quest is **not implemented** today: world bosses with wired
`data_tbl_npc_creature` rows (NPC 706 → cid 348, etc.) cannot trigger their encounter from
a plain click. See `docs/research/2026-05-14_01_BOSS_DAILY_NPC_MAPPING_RESEARCH.md` for the
full 58-row table and the four daily-only entries (2218 Thủy Tinh Bào lv55, 2275 Mehdi
Urboss, 2567 Buli, 2568 Bula) that have no world counterpart, plus the `WildList` cluster
whose world rows also live on `pos_map_id=200`.
