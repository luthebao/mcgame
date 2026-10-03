# TBL_NPC_SKILL

| Property | Value |
|---|---|
| Table ID | 38 |
| Record count | 540 |
| JSON | `docs/database/game_data/TBL_NPC_SKILL.json` |
| Client constant | `GamePredef.TBL_NPC_SKILL = 38` |

## Purpose

Maps skills to NPC templates, defining which combat skills a given NPC may use during battle. The table is indexed by `nid` on the client (`TBL_INDEX_ARRAY[TBL_NPC_SKILL] = "nid"`, `GamePredef.as:8354`), allowing the server to look up all skills for a given NPC in one pass. The client loads this table into `GameData.d[38]` but no UI code reads individual records directly; skill resolution during battles is server-driven.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key of this skill-assignment row. |
| `nid` | int | Foreign key → [[TBL_NPC]].`id`. The NPC that owns this skill. Primary index key. |
| `sid` | int | Foreign key → TBL_SKILL.`id`. The skill template assigned to this NPC. |
| `position` | string | Skill slot/priority position within the NPC's skill set. `"0"` = primary slot (441 records), `""` = unassigned/legacy (99 records). (inferred from data — no direct client read of this field found in non-data files) |

## Value distributions / sentinels

- `position`: `"0"`×441, `""`×99.
- Each `nid` typically maps to 1–6 skills. NPC 490 has 5 rows with empty position, while NPC 339 has entries with position=0.

## Client usage

Loaded into `GameData.d[38]` and indexed by `nid` via `TBL_INDEX_ARRAY[TBL_NPC_SKILL]`. No UI or logic file outside of `GameData.as` and `moreData.as` was found referencing `TBL_NPC_SKILL` or accessing records from this table by index 38. Skill dispatch during NPC combat encounters is handled server-side; the client receives battle outcomes, not raw skill data for NPCs.

## Related tables

- `nid` → [[TBL_NPC]].`id` (owning NPC)
- `sid` → TBL_SKILL.`id` (skill template)
