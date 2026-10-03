# TBL_QUEST_PRE

| Property | Value |
|---|---|
| Table ID | 64 |
| Record count | 2007 |
| JSON | `docs/database/game_data/TBL_QUEST_PRE.json` |
| Client constant | `GamePredef.TBL_QUEST_PRE = 64` |

## Purpose

Stores the unlock prerequisites for quests — conditions that must be true before a player can even accept a quest. Each row is one prerequisite on one quest. The table is double-indexed: `TBL_INDEX_ARRAY[64] = "qid"` (primary lookup by quest) and `TBL_INDEX_ARRAY2[64] = "itemId"` (secondary lookup). The client retrieves the prerequisite list for a quest via `DataManager.getQuestPre(qid)` → `gameDataIndex[TBL_QUEST_PRE][qid]` (`DataManager.as:708`).

The `preQuestType` field on [[TBL_QUEST]] controls how multiple prerequisite rows are combined: `1`=AND (all must pass), `2`=OR (any one suffices).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key of this prerequisite row. |
| `qid` | int | Foreign key → [[TBL_QUEST]].`id`. The quest that requires this prerequisite. Primary index key. |
| `kind` | int | Prerequisite category: `1`=must possess an item (`QUEST_PRE_ITEM`), `2`=must have finished another quest (`QUEST_PRE_QUEST`). Drives the check in `Player.as:1882`. |
| `type` | int | Item table type when `kind=1`: `29`=TBL_ITEM_TEMPLATE (61), `45`=TBL_QUEST (1365). When `kind=2` and the prerequisite is another quest, `type` holds the table id of the prerequisite quest table (`45`=TBL_QUEST) or `-1` (580 rows — legacy / no table lookup needed, `itemId` is used directly as a quest id). `0`=undefined (1 row). |
| `itemId` | int | The id of the required item (when `kind=1`, looked up in the table given by `type`) or the id of the prerequisite quest (when `kind=2`, a [[TBL_QUEST]].`id`). Secondary index key. |
| `num` | int | Quantity of the item that must be held (when `kind=1`). Checked via `haveItem(type, itemId, num)` at `Player.as:1882`. For `kind=2` (quest prerequisite), this field exists in the data but is always `1` (`inferred from data — no client usage found for num when kind=2`). |

## Value distributions / sentinels

- `kind`: `1`×60 (item prerequisite), `2`×1946 (prior quest required), empty×1.
- `type`: `45`×1365 (TBL_QUEST — quest-chain prerequisites), `-1`×580 (quest id with no table reference), `29`×61 (TBL_ITEM_TEMPLATE), `0`×1.
- The overwhelming `kind=2` / `type=45` combination confirms this table is primarily a quest-chain dependency graph.

## Client usage

- `Player.as:1882–1904` — called during quest accept eligibility check. Iterates all prerequisite rows for the target quest:
  - `kind=QUEST_PRE_ITEM` (`1`): calls `haveItem(type, itemId, num)` — returns false if the player lacks the item.
  - `kind=QUEST_PRE_QUEST` (`2`): calls `isFinishQuest(itemId)`. When `preQuestType=1` (AND), any unfinished prerequisite returns false. When `preQuestType=2` (OR), tracks whether at least one is finished.
- `DataManager.as:625` — `_local_2.pre = getQuestPre(arg_1)` — attaches the prerequisite list to the assembled quest VO at load time.

## Related tables

- `qid` → [[TBL_QUEST]] (the quest being gated)
- `itemId` (when `kind=2`) → [[TBL_QUEST]] (the prerequisite quest that must be completed)
- `itemId` (when `kind=1`) → [[TBL_ITEM_TEMPLATE]] (item the player must carry)
- Logic combined with `preQuestType` field on [[TBL_QUEST]]
