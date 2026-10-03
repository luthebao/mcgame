# TBL_NPC_PLAN

| Property | Value |
|---|---|
| Table ID | 63 |
| Record count | 0 (empty export) |
| JSON | `docs/database/game_data/TBL_NPC_PLAN.json` |
| Client constant | `GamePredef.TBL_NPC_PLAN = 63` |

## Purpose

Maps loot-plan assignments to NPC battle nodes, linking an NPC to the drop-table plan it uses when defeated. This is a static join table between [[TBL_NPC]] and TBL_PLAN; the export is empty because the server populates this mapping at runtime or the data was not included in the client dump.

The table is indexed by `npcId` on the client (`TBL_INDEX_ARRAY[TBL_NPC_PLAN] = "npcId"`, `GamePredef.as:8378`).

## Classification

Runtime/configuration table — no static rows exported in the client JSON dump.

## Client constant

`GamePredef.TBL_NPC_PLAN = 63` (`GamePredef.as:556`). Index key: `"npcId"` (`GamePredef.as:8378`). No `TBL_INDEX_ARRAY2` or `TBL_INDEX_ARRAY3` entry was found for this table.

## Fields confirmed from .as usage

No field-level reads of `GameData.d[63]` were found in any non-data `.as` file. The index key `"npcId"` (`GamePredef.as:8378`) confirms the table has at minimum:

| Field | Type | Notes |
|---|---|---|
| `npcId` | int | Foreign key → [[TBL_NPC]].`id`. Primary index key used by `TBL_INDEX_ARRAY`. |

Additional fields (e.g., `planId` → TBL_PLAN.`id`) are expected by analogy with similar junction tables but cannot be confirmed from static analysis alone.

## Related tables

- `npcId` → [[TBL_NPC]].`id`
- (expected) `planId` → TBL_PLAN.`id` (loot-plan template)
