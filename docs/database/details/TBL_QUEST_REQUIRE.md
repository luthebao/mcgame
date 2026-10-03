# TBL_QUEST_REQUIRE

| Property | Value |
|---|---|
| Table ID | 47 |
| Record count | 4765 |
| JSON | `docs/database/game_data/TBL_QUEST_REQUIRE.json` |
| Client constant | `GamePredef.TBL_QUEST_REQUIRE = 47` |

## Purpose

Defines the in-progress objectives a player must satisfy before a quest can be completed. Each row is one condition on one quest. Multiple rows with the same `qid` form the full objective list. The table is indexed by `qid` (`TBL_INDEX_ARRAY[47] = "qid"`). The three `kind` values map to: collect items (`QUEST_REQUIRE_ITEM=1`), kill creatures (`QUEST_REQUIRE_CREATUR=2`), or capture/submit pets (`QUEST_REQUIRE_PET=3`).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key of this requirement row. |
| `qid` | int | Foreign key → [[TBL_QUEST]].`id`. Groups all requirements for one quest. |
| `kind` | int | Objective type: `1`=collect/submit item (`QUEST_REQUIRE_ITEM`), `2`=kill creature (`QUEST_REQUIRE_CREATUR`), `3`=capture/submit pet (`QUEST_REQUIRE_PET`). Drives which display path and kill-tracking logic is used (`QuestCanvas.as:1044,1074,1089`). |
| `type` | int | Table type of the target: `12`=`TBL_CREATURE` (monster to kill, 2583 rows), `19`=`TBL_EQUIPT_TEMPLATE` (93 rows), `29`=`TBL_ITEM_TEMPLATE` (2088 rows), `0`=undefined/legacy (1 row). Used with `itemId` to call `getTemplateData(type, itemId)`. |
| `itemId` | int | ID of the required item/creature/pet within the table specified by `type`. |
| `num` | int | Required quantity (items to collect) or kill count. |
| `q` | int | Quality constraint. `-1`=none (1968), `0`=not quality-gated (165), positive = minimum quality level. For equipment, compared via `getColorByQuality(q)` (`QuestPanel.as:1104`); for pets, used as a growth-rate threshold divided by 10 (`QuestPanel.as:1210`). |

## Value distributions / sentinels

- `kind`: `1`×2181 (item collect), `2`×1239 (creature kill), `3`×1344 (pet), empty×1.
- `type`: `12`×2583 (TBL_CREATURE), `29`×2088 (TBL_ITEM_TEMPLATE), `19`×93 (TBL_EQUIPT_TEMPLATE), `0`×1.
- `q`: `-1`×1968, `1`×2217, `0`×165, remaining spread across quality tiers 5–23.

## Client usage

- `DataManager.as:625–640` — assembles the quest VO; iterates `gameDataIndex[TBL_QUEST_REQUIRE][qid]` and merges each requirement row. For `kind=QUEST_REQUIRE_CREATUR`, initialises a kill-progress tracking sub-object.
- `QuestCanvas.as:1044–1100` — iterates the requirement list to render objective slots and current kill/collect progress:
  - `kind=1`: shows item icon and quantity, with quality-color check for equipment.
  - `kind=3` (pet): shows pet icon with growth-rate floor.
  - `kind=2` (creature): shows monster portrait and kill counter from `questKill` runtime data.
- `QuestPanel.as:1093–1145` — validates completion: checks bag contents for item requirements (`kind=1`) and pet list for pet requirements (`kind=3`), with quality gate.

## Related tables

- `qid` → [[TBL_QUEST]]
- `type=12, itemId` → [[TBL_CREATURE]]
- `type=29, itemId` → [[TBL_ITEM_TEMPLATE]]
- `type=19, itemId` → [[TBL_EQUIPT_TEMPLATE]]
- Kill progress tracked at runtime in [[TBL_CHARACTOR_QUEST_KILL]]
