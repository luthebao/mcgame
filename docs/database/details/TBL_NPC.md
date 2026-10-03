# TBL_NPC

| Property | Value |
|---|---|
| Table ID | 35 |
| Record count | 1943 |
| JSON | `docs/database/game_data/TBL_NPC.json` |
| Client constant | `GamePredef.TBL_NPC = 35` |

## Purpose

Defines every interactive NPC placed in the world: its type, map position, sprite asset, functional behaviour (shop, transport, quest giver, boss, resource node, etc.), available quest IDs, server-side script text, and availability schedule. The Flash client indexes this table three ways — by `posMapId` (primary), by `name` (secondary), and by `classId` (tertiary) — so all NPC lookups on a map use `GameData.d[35][posMapId]` buckets.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Referenced everywhere as `npc.id`, `npcData.id`, `nid` in child tables. |
| `name` | string | Vietnamese display name shown in map tooltips and NPC dialog title. Read in `NPCView.as:129`, `GameIntroPanel.as:3575`, `DailyActPanel.as:2708`. |
| `type` | int | NPC functional category; mapped to `NPC_TYPE_*` constants in `GamePredef.as:308–334`. `Npc.as:41` copies this into `npc.npcType`. See value distribution below. |
| `subType` | string | Secondary classification. For type-10 (BATTLE) NPCs, `"all"` means every class can trigger the encounter; numeric values reference `TBL_CREATURE.id` for type-20 boss NPCs. Also used for class-ID gates on quest NPCs. Parsed as string throughout client (`NPCView.as:188`, `QuestCanvas.as:1279`). |
| `classId` | int | Character-class filter (0 = all classes). `NpcFuncPanel.as:301` compares with `_core.player.classId`. Also used as `TBL_INDEX_ARRAY3` key for the class-scoped NPC index (`GamePredef.as:8514`). Distribution: 0×1937, 1–6×1 each. |
| `resCode` | string | 13-digit SWF asset code for the NPC sprite. Passed to `ResManager.getResUrl(resCode)` in `GameScene.as:86` and `GameIntroPanel.as:3535`. |
| `iconCode` | string | 13-digit icon asset code. Passed to `ResManager.getIconUrl(iconCode)`. Used in map legend and tooltip displays. |
| `colorCode` | int | Hue-rotation angle (0–360°) applied to the NPC sprite via `ResManager.setColorCode(...)` (`ResManager.as:555`). 0 = no tint. For anti-bot bosses (`ANTI_WAIGUA_BOSSID`), the server overrides this with a random value each spawn (`GameScene.as:90`). |
| `brightCode` | string | Lighting/brightness preset code applied to the NPC sprite. 0 = default; numeric values encode a palette or brightness level. Read in `GameIntroPanel.as:3537` via `layer` access. (inferred from data — no direct brightCode read confirmed in logic files) |
| `layer` | int | Render depth layer used when building the NPC display object. `GameIntroPanel.as:3537` reads it explicitly. |
| `miniMap` | int | Whether the NPC dot appears on the mini-map. `1` = visible (1148 records), `−1` = hidden (553 records), null = absent (242 records). `Npc.as:16` declares it defaulting to 1. |
| `mirror` | bool(0/1) | When `1` the NPC sprite is horizontally flipped. 0×1940, 1×3. |
| `posMapId` | int | Map ID where this NPC is placed. Foreign key → [[TBL_MAP]].`id`. Primary grouping index: `TBL_INDEX_ARRAY[TBL_NPC] = "posMapId"`. |
| `posX` | int | X pixel coordinate on the map. |
| `posY` | int | Y pixel coordinate on the map. |
| `posDir` | int | Initial facing direction (0–7). 0 = default/down (1472 records), 7 = up-left (392 records). `NPCView.as:66` assigns this on spawn. |
| `lv` | int | Minimum player level required to interact. `−1` = no gate. `NPCView.as:179–186` shows a gray nameplate when the player's level is too low or too high relative to `_gameObject.lv`. |
| `lk` | int | Display-state flag. `1` = NPC shows on client (1294 records), `−1` = hidden (407 records). (inferred from data — no direct client read of this field found) |
| `v` | int | Visibility/existence flag. `1` = active (1697 records), `−1` = suppressed (4 records). (inferred from data — no direct client read found) |
| `together` | int | Group/companion flag. `1` = NPC participates in group spawning logic (717 records), `−1` = standalone (984 records). (inferred from data — no direct client read found) |
| `num` | int | Spawn count or quest-target quantity depending on type. `−1` = use server default (1003 records), `0` = none (649 records), positive integers specify an exact count. |
| `shopId` | string | Foreign key → TBL_SHOP when non-empty/non-zero. Populated for type-2 (SHOP) NPCs. |
| `qid` | string | Pipe-separated list of quest IDs offered by this NPC (→ [[TBL_QUEST]]). Used for type-24 (GATHER) and similar NPC types. Example: `"\|1462"`, `"3817"`. |
| `skill` | string | Empty in all 1943 records in this dump. Field is declared but unused at data level; server may populate it at runtime. |
| `funcInfo` | string | Type-specific extra configuration, pipe-delimited. For type-9 (TRANSPORT) NPCs: `"\|mapId,destName,cost,x,y\|..."` tuples parsed in `NpcFuncOther.as:271`. Empty for most other types. |
| `onServiceText` | string | Ambient dialogue shown in the NPC panel greeting area. `NpcFuncPanel.as:367` assigns to `info.text`; `NpcFuncPanel.as:800` triggers `view.onSay(onServiceText)` when non-empty. |
| `newsOn` | int | Bulletin/news ID to show when NPC is active (`-1` = none). (inferred from data — no client read confirmed in non-data files) |
| `newsOff` | int | Bulletin/news ID to show when NPC is inactive (`-1` = none). (inferred from data — no client read confirmed in non-data files) |
| `randOff` | int | Random-spawn offset in seconds or tile range. `−1` = disabled (1295 records), positive values encode a random offset applied at spawn. (inferred from data — no client read found) |
| `rf` | int | Respawn flag or refresh timer override. `−1` = use default, positive integers = seconds. Wide distribution (see below). (inferred from data — no client read found) |
| `fd` | int | "Face direction" or flee distance override. `−1` = disabled (1552 records), `1` = enabled-short, `2` = enabled-long. (inferred from data — no direct field read confirmed) |
| `at` | string | Availability schedule. Empty = always available. Non-empty formats: `"hour_start-hour_end\|day_start-day_end\|date_start-date_end\|month_start-month_end\|EventTag"` or `"new\|YYYY/M/D/H/m/s-YYYY/M/D/H/m/s"` for dated events. Parsed server-side; the client receives only active NPCs. |
| `scriptOff` | script | Server-side ActionScript executed when the NPC dies or an event completes. Contains embedded game-scripting logic (addChaExp, addItem, addMoney, etc.). Client never reads this field — it is server-only. Do not transcribe. |

## Value distributions / sentinels

- `type`: 1 (QUEST)×725, 19 (wild/world-encounter)×498, 10 (BATTLE)×283, 24 (GATHER)×46, 21 (FISH_POOL)×37, 4 (PLAN)×81, 22 (PLANT)×38, 23 (HERB)×13, 25 (WALK)×12, 27 (HULA)×12, 28 (DOTA)×18, 29 (TRIPLE_TOWN)×16, 2 (SHOP)×57, 9 (TRANSPORT)×24, 18 (BUILD)×11, 11 (CLASSQUEST)×6, 20 (event/named-boss)×16, others <10 each.
- Types 19 and 20 have no `NPC_TYPE_NAME` entry in `GamePredef.as:8134–8149`. Type 19 = roaming wild/world-encounter NPC (subType often `"all"`). Type 20 = named field boss; `subType` holds the `TBL_CREATURE.id` of its creature template.
- `miniMap`: 1×1148, −1×553, null×242.
- `mirror`: 0×1940, 1×3.
- `posDir`: 0×1472 (down), 7×392 (up-left), others rare.
- `classId`: 0×1937 (all classes), 1–6×1 each (class-gated NPCs).

## Client usage

- `Npc.as:35–42` — `Npc` constructor sets `type = GamePredef.TBL_NPC`; `data` setter copies `_arg_1.type` → `npc.npcType`.
- `GameScene.as:86–93` — receives NPC list from server, sets `resCode`, optionally randomises `colorCode` for anti-bot bosses, calls `_core.createNpc(npcData)`.
- `NPCView.as:112–300` — renders the NPC sprite on the game stage; branches on `npcType` for WALK, DOTA, TRIPLE_TOWN, BOSS, HULA, GATHER-class node display; reads `lv`, `name`, `id`, `nid`.
- `NpcFuncPanel.as:277–827` — NPC interaction panel: reads `onServiceText`, `classId`, `npcType`, `shopId`, `qid`, `funcInfo`.
- `NpcFuncOther.as:247–294` — builds transport-destination list by splitting `funcInfo` on `"\|"` and `","` for type-9 NPCs.
- `MapCanvas.as:191/369` — filters NPC list by map; dispatches click events; reads `name`, `type`.
- `GuideAlertPanel.as:101` — `gameDataIndex[TBL_NPC][posMapId]` lookup for quest guide.
- `QuestCanvas.as:1129/1168/1279` — links start/finish NPCs to quest text; reads `classId`, `posMapId`.
- `GameIntroPanel.as:3533–3537` — reads `colorCode`, `resCode`, `layer` for cut-scene NPC rendering.
- `BossDailyRect.as:367`, `LinkTextArea.as:72`, `CrossContentionBossAreaPanel.as:604`, `DailyActPanel.as:2708` — `GameData.d[35][npcId].name` for display.

## Related tables

- `posMapId` → [[TBL_MAP]] (map placement)
- `shopId` → TBL_SHOP (item shop configuration)
- `qid` → [[TBL_QUEST]] (quests this NPC offers)
- `id` ← [[TBL_NPC_CREATURE]].`nid` (creatures spawned at this NPC / boss)
- `id` ← [[TBL_NPC_SKILL]].`nid` (combat skills available to this NPC)
- `id` ← [[TBL_NPC_PLAN]].`npcId` (loot-plan mapping for this NPC)
- `subType` (type-20 NPCs) → [[TBL_CREATURE]].`id` (creature template of named boss)
