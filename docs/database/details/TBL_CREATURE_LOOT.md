# TBL_CREATURE_LOOT

| Property | Value |
|---|---|
| Table ID | 13 |
| Record count | 1669 |
| JSON | `docs/database/game_data/TBL_CREATURE_LOOT.json` |
| Client constant | `GamePredef.TBL_CREATURE_LOOT = 13` |

## Purpose

Defines the drop table for every creature: which items can drop, at what rate, with optional quest and quality constraints. Indexed by `cid` so the server can retrieve all loot rows for a given creature in one pass. The client constant is registered in `TBL_INDEX_ARRAY[13] = "cid"` but loot resolution itself is performed server-side; the client does not read this table directly during gameplay.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Row primary key (global sequence). Not used as a lookup key. |
| `cid` | int | Foreign key → [[TBL_CREATURE]].`id`. The creature whose kill produces this loot entry. Client/server index key: `TBL_INDEX_ARRAY[TBL_CREATURE_LOOT] = "cid"`. |
| `itemId` | int | Foreign key → TBL_ITEM_TEMPLATE.`id` (table 29). The item that can drop. |
| `type` | int | Item table type: uniformly `29` across all 1669 records, confirming `itemId` references `TBL_ITEM_TEMPLATE` (GamePredef constant `TBL_ITEM_TEMPLATE = 29`). |
| `rate` | int | Drop rate in units of 1/10 000. Range 0–30 000 (0%–300%; rates >10 000 represent guaranteed multi-drops or bonus mechanics). Example: `5000` = 50%, `10000` = 100%. |
| `quality` | int | Minimum item quality for the drop: `0`=any/normal (1521 records), `1`=+1 quality (126 records), `2`=+2 quality (14 records), `5`/`6`=high-quality overrides (8 records). `0` means quality is not constrained. (inferred from data and field name — no direct client UI read found) |
| `qid` | int | Quest ID constraint: `-1`=always available (1129 records); positive value = drop is only active when the player has that quest active or at that stage. Foreign key → TBL_QUEST.`id` when non-negative. |
| `b` | bool(0/1) | Bind-on-drop flag: `0`=tradeable drop (892 records), `1`=bound to character on drop (777 records). All quest-linked drops (`qid != -1`) in the sample have `b=1`. (inferred from data — no direct client field read found) |

## Value distributions / sentinels

- `type`: `29`×1669 — uniform; all loot items are from TBL_ITEM_TEMPLATE.
- `qid`: `-1`×1129 (always drops), positive quest IDs×540 (conditional quest drops).
- `b`: `0`×892 (tradeable), `1`×777 (bound). Quest-conditional drops are exclusively bound.
- `quality`: `0`×1521, `1`×126, `2`×14, `5`×1, `6`×7.
- `rate` range: 0–30 000 (0%–300% in 1/10 000 units).

## Client usage

Loaded into `GameData.d[13]` with secondary index `gameDataIndex[13]` keyed by `cid`. No direct UI panel reads this table — loot resolution is entirely server-side. The constant and index registration exist so server-side tooling and the game-data loader can reference the table by its numeric ID.

## Related tables

- `cid` → [[TBL_CREATURE]]: the creature this loot belongs to.
- `itemId` → TBL_ITEM_TEMPLATE (table 29): the item definition for the drop.
- `qid` → TBL_QUEST (when `>= 0`): quest that gates this drop.
