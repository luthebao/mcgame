# TBL_QUEST_AWARD

| Property | Value |
|---|---|
| Table ID | 46 |
| Record count | 1437 |
| JSON | `docs/database/game_data/TBL_QUEST_AWARD.json` |
| Client constant | `GamePredef.TBL_QUEST_AWARD = 46` |

## Purpose

Each row is one item, pet, or skill that can be awarded when a quest is completed. Multiple rows share the same `qid`, forming the award list for that quest. The client indexes this table by `qid` (`TBL_INDEX_ARRAY[46] = "qid"`), so all awards for a quest are retrieved in a single lookup: `gameDataIndex[TBL_QUEST_AWARD][qid]`.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key of this award row. |
| `qid` | int | Foreign key → [[TBL_QUEST]].`id`. Groups all awards belonging to one quest. Primary index key. |
| `kind` | int | Award category: `1` = item (`QUEST_AWARD_ITEM`), `2` = pet (`QUEST_AWARD_PET`), `3` = skill (`QUEST_AWARD_SKILL`). Drives which icon slot type and lookup path the client uses (`QuestCanvas.as:1273–1320`). |
| `type` | int | Item table type: `29` = `TBL_ITEM_TEMPLATE` (1349 rows, dominant), `19` = `TBL_EQUIPT_TEMPLATE` (81 rows), `12` = `TBL_CREATURE` for pet awards (6 rows), `0` = undefined/legacy (1 row). Used by the client to call `getTemplateData(type, itemId)`. |
| `itemId` | int | ID within the table specified by `type` (item template id, creature id, or skill id). |
| `num` | int | Quantity of the item or skill awarded. |
| `q` | int | Quality / rarity filter or minimum quality requirement. `-1` = no requirement (16 rows). `0` = not quality-gated (1046 rows). Positive values are quality levels used for equipment awards (client checks via `getColorByQuality(q)` at `QuestCanvas.as:1055`) or pet growth-rate thresholds (divided by 10 at `QuestPanel.as:1210`). |
| `b` | int | Bound-on-award flag: `1` = item is given bound (1369 rows, dominant), `0` = not bound (68 rows). `(inferred from data — no client usage found in UI layer; server applies this flag when granting items)` |

## Value distributions / sentinels

- `kind`: `1`×1430 (items), `2`×6 (pets), `3`×0 confirmed (skill awards are present in constants but 0 rows in this dump), empty×1.
- `type`: `29`×1349 (TBL_ITEM_TEMPLATE), `19`×81 (TBL_EQUIPT_TEMPLATE), `12`×6 (TBL_CREATURE), `0`×1.
- `b`: `1`×1369, `0`×68.
- `q`: `0`×1046, `-1`×16, positive values scattered (quality levels 1–20).

## Client usage

- `QuestCanvas.as:1273–1342` — iterates the award list for a quest; dispatches on `kind` to fill award icon slots (`awardItem1`–`awardItem6`). For `kind=1` items, filters by `at=3` class restriction using `reqClass`. For `kind=2` pets, sets slot type to `TBL_CREATURE`. For `kind=3` skills, sets slot type to `TBL_SKILL`.
- `QuestCanvas.as:1329–1342` — special `at=2` "choose one" mode; `aScriptText` award shown as an extra slot.
- `QuestPanel.as:985–1015` — bag-space pre-check before completion; counts pending item awards filtered by `at` mode and `kind`.
- `QuestPanel.as:1093–1115` — require-check loop that also references award `q` and `type` for equipment color validation.

## Related tables

- `qid` → [[TBL_QUEST]]
- `type=29, itemId` → [[TBL_ITEM_TEMPLATE]]
- `type=19, itemId` → [[TBL_EQUIPT_TEMPLATE]]
- `type=12, itemId` → [[TBL_CREATURE]] (pet award)
