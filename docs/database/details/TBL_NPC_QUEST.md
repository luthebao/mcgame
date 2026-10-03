# TBL_NPC_QUEST

| Property | Value |
|---|---|
| Table ID | 37 |
| Record count | 0 (empty export) |
| JSON | `docs/database/game_data/TBL_NPC_QUEST.json` |
| Client constant | `GamePredef.TBL_NPC_QUEST = 37` |

## Purpose

Maps quests to NPC nodes for server-side quest availability lookups. This table is the server's authoritative join between [[TBL_NPC]] and [[TBL_QUEST]], distinct from the inline `qid` field on TBL_NPC (which holds a client-display pipe-list). The export is empty because quest-to-NPC assignments are resolved server-side and not shipped in the client data dump.

The table is indexed by `nid` on the client (`TBL_INDEX_ARRAY[TBL_NPC_QUEST] = "nid"`, `GamePredef.as:8353`).

## Classification

Runtime/server-side table — no static rows exported in the client JSON dump.

## Client constant

`GamePredef.TBL_NPC_QUEST = 37` (`GamePredef.as:530`). Index key: `"nid"` (`GamePredef.as:8353`). No `TBL_INDEX_ARRAY2` or `TBL_INDEX_ARRAY3` entry exists for this table.

## Fields confirmed from .as usage

No field-level reads of `GameData.d[37]` were found in any non-data `.as` file. The index key `"nid"` confirms the table has at minimum:

| Field | Type | Notes |
|---|---|---|
| `nid` | int | Foreign key → [[TBL_NPC]].`id`. Primary index key. |

The runtime object `npcQuest` in `NpcFuncPanel.as:816–827` (which carries `state`, `npcId`, and a `list` of quest objects each with a `qid`) is a server-sent payload, not a direct read of this static table.

## Related tables

- `nid` → [[TBL_NPC]].`id`
- (expected) `qid` → [[TBL_QUEST]].`id` (quest template)
