# TBL_CHARACTOR_QUEST_KILL

| Property | Value |
|---|---|
| Table ID | 65 |
| Record count | 0 (empty export) |
| JSON | n/a — no static rows |
| Client constant | `GamePredef.TBL_CHARACTOR_QUEST_KILL = 65` |

## Purpose

Runtime per-character kill-progress table for quest objectives. Each row tracks how many of a required creature type a character has killed for a specific active quest. This is a live/instance table — no static rows exist in the client game-data dump. The server maintains kill counters and delivers updates (increments) to the client as creatures are killed.

The double index structure (`TBL_INDEX_ARRAY[65] = "cid"`, `TBL_INDEX_ARRAY2[65] = "charactorQuestId"`) indicates the server schema keys kill rows by character id then by the character-quest row id.

## Classification

Instance / runtime / character-scoped. Kill increments are pushed server-to-client via callbacks as the player defeats qualifying creatures during an active quest. Not present in the static game-data JSON export.

## Client constant

`GamePredef.TBL_CHARACTOR_QUEST_KILL = 65`

Index registration:
- `TBL_INDEX_ARRAY[65] = "cid"` (`GamePredef.as:8380`)
- `TBL_INDEX_ARRAY2[65] = "charactorQuestId"` (`GamePredef.as:8468`)
- `TBL_INDEX_ARRAY3[65] = null`

## Fields confirmed from .as usage

Kill-progress objects are surfaced through the `questKill` array on the quest state object (see [[TBL_CHARACTOR_QUEST]]). The client iterates `questKill` at `QuestManager.as:543` and `QuestCanvas.as:1093–1095`. Fields observable in that context:

| Field | Type | Function |
|---|---|---|
| `cid` | int | Character id. Primary index key. |
| `charactorQuestId` | int | Foreign key → [[TBL_CHARACTOR_QUEST]] row id. Secondary index key. |
| `num` | int | Current kill count for this creature type on this quest (`QuestManager.as:562`: `_local_7.num = _local_6.num`). Displayed as progress against the required count from [[TBL_QUEST_REQUIRE]].`num`. |

Empty export; no static rows. Client constant present; field-level usage confirmed from `QuestManager.as:543–563` and `QuestCanvas.as:1093–1095`.

## Related tables

- `charactorQuestId` → [[TBL_CHARACTOR_QUEST]]
- Kill targets defined in → [[TBL_QUEST_REQUIRE]] (`kind=2`, creature kill objectives)
- Creature definitions → [[TBL_CREATURE]]
