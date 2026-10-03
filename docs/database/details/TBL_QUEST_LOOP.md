# TBL_QUEST_LOOP

| Property | Value |
|---|---|
| Table ID | 58 |
| Record count | 11 |
| JSON | `docs/database/game_data/TBL_QUEST_LOOP.json` |
| Client constant | `GamePredef.TBL_QUEST_LOOP = 58` |

## Purpose

Defines the 11 repeatable "loop quest" series in the game (e.g., 60-Round Quest, Guild Quest, Valentine Quest). Each loop quest is a named series of rounds; each individual round is a regular [[TBL_QUEST]] entry whose `subType` encodes `"7-<loop_id>"`. The table is indexed by NPC (`TBL_INDEX_ARRAY[58] = "nid"`), so the client can look up the loop quest series offered by a given NPC. The client reads this table at `QuestManager.as:880` to drive timer display, round-progress counters, and NPC navigation.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Referenced in [[TBL_QUEST]].`subType` as `"7-<id>"`. |
| `name` | string | Vietnamese display name of the loop series (e.g., `"Nhiệm Vụ 60 Vòng"`, `"Rèn Luyện Pet"`). Shown in the loop quest tab name and progress messages (`QuestManager.as:960,1196`). |
| `info` | string | Rich HTML description of eligibility conditions, rules, and rewards. Displayed in the loop quest info area (`QuestManager.as:883`). |
| `nid` | int | NPC id (→ [[TBL_NPC]]) that offers and accepts this loop quest series. Used for auto-pathfinding via `setNpcState` (`QuestManager.as:950,1154,1759`). Primary index key. |
| `num` | int | Total number of rounds in the series. Client compares against the player's current round count (`QuestManager.as:895,1189`): `ft / num` tracks progress. |
| `minLevel` | int | Minimum player level to enter this loop series (displayed in `info`; used for eligibility filtering in `QuestManager.as:1063`). Note: in the data, id=1 has `minLevel=200` (no restriction enforced by the client — the `info` text is authoritative). |
| `maxLevel` | int | Maximum player level. Same usage as `minLevel`. |
| `refresh` | int | Cooldown in seconds before the series can be restarted after completion or abandonment. Values: `600`×9 (10 minutes), `43200`×1 (12 hours), `259200`×1 (72 hours). Client computes remaining cooldown as `((now + timeLag - takeDate) / 1000) - refresh` (`QuestManager.as:888,933`). |
| `team` | int | Party requirement: `0`=solo (6), `1`=party allowed or required (3), `2`=specific party composition required (2, e.g., Valentine quest requires one male + one female friend). `(inferred from data and info text — no explicit client-side team check found; server enforces composition)` |
| `scriptGet` | string | Server-side AS script run when a round of this loop is accepted. Contains server logic (e.g., random sub-quest selection via `getQuestByRate`). Empty or `"\"\""` when unused. Client does not execute this field. |
| `scriptGiveUp` | string | Server-side AS script run when the player abandons a round of this loop. May write event logs (id=9 has a logging script). Client does not execute this field. |

## Value distributions / sentinels

- `refresh`: `600`×9, `43200`×1, `259200`×1.
- `team`: `0`×6, `1`×3, `2`×2.
- `num` values: 10, 15, 20, 60, 200 — matching the "N-round quest" naming convention in `name`.

## Client usage

- `QuestManager.as:880` — `getData(TBL_QUEST_LOOP, loopList.selectedItem.lid)` fetches the loop definition.
- `QuestManager.as:888–895` — uses `refresh` and `num` to show cooldown timer and round progress (`ft / num`).
- `QuestManager.as:950` — `getData(TBL_NPC, loopData.nid)` for auto-navigation.
- `QuestManager.as:960` — displays `loopData.name` in the loop tab.
- `QuestManager.as:1040,1145,1186` — player's active loop list entries reference `qid` which is looked up here.
- The secondary connection: `TBL_QUEST.subType == "7-<loop_id>"` links individual round quests back to the loop definition. Client parses this at `QuestPanel.as:891`, `QuestManager.as:903`.

## Related tables

- `nid` → [[TBL_NPC]]
- Individual rounds → [[TBL_QUEST]] (where `type=7` and `subType="7-<id>"`)
