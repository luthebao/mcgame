# TBL_CHARACTOR_QUEST

| Property | Value |
|---|---|
| Table ID | 7 |
| Record count | 0 (empty export) |
| JSON | `docs/database/game_data/TBL_QUEST.json` (n/a — no static rows) |
| Client constant | `GamePredef.TBL_CHARACTOR_QUEST = 7` |

## Purpose

Runtime per-character quest state table. Each row tracks one quest currently accepted by one character. This is a live/instance table — no static rows exist in the client game-data dump. The server populates it per session and sends the active quest list to the client on login or state sync. The client does not access this table via `GameData.d[7]` by id lookup; instead, the server delivers a serialized quest-state array and the client stores it in `player.questList` or similar runtime properties.

The secondary index `TBL_INDEX_ARRAY[7] = "cid"` (character id) indicates the server-side schema groups quest states per character.

## Classification

Instance / runtime / character-scoped. Populated server-side and pushed to the client as part of login or quest-accept/complete callbacks. Not present in the static game-data JSON export.

## Client constant

`GamePredef.TBL_CHARACTOR_QUEST = 7`

Index registration:
- `TBL_INDEX_ARRAY[7] = "cid"` (`GamePredef.as:8323`)
- `TBL_INDEX_ARRAY2[7] = null`
- `TBL_INDEX_ARRAY3[7] = null`

## Fields confirmed from .as usage

The client interacts with quest-state objects (delivered by server) that carry these fields:

| Field | Type | Function |
|---|---|---|
| `cid` | int | Character id. Primary index key for server-side grouping. |
| `qid` | int | Quest id → [[TBL_QUEST]].`id`. Identifies which quest is active. |
| `state` | int | Quest state enum. Referenced against `GamePredef.ST_QUEST_CANFINISH` at `QuestManager.as:1709`. |
| `data` | Object | Embedded quest template data (fields from [[TBL_QUEST]] such as `.name`, `.type`, `.color`, `.finishNpc`, etc.) merged into the state object by `DataManager`. |
| `require` | Object | Active requirement sub-objects keyed by row id; merged from [[TBL_QUEST_REQUIRE]] rows at `DataManager.as:625–640`. |
| `questKill` | Array | Kill-progress sub-objects built from [[TBL_CHARACTOR_QUEST_KILL]] runtime data. Populated at `QuestManager.as:543–563`. |
| `award` | Object | Award sub-objects keyed by row id; from [[TBL_QUEST_AWARD]] rows. |
| `pre` | Object | Prerequisite index from [[TBL_QUEST_PRE]] rows; attached at `DataManager.as:625`. |
| `info` | string | Objective description text (mirrors `TBL_QUEST.info`) shown in tracker. |

Empty export; no static rows. Client constant present; field-level usage confirmed from `QuestManager.as`, `QuestPanel.as`, `QuestCanvas.as`, and `DataManager.as`.

## Related tables

- `qid` → [[TBL_QUEST]]
- Kill progress → [[TBL_CHARACTOR_QUEST_KILL]]
- Requirements merged from → [[TBL_QUEST_REQUIRE]]
- Awards merged from → [[TBL_QUEST_AWARD]]
