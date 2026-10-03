# TBL_PET_SKILL

| Property | Value |
|---|---|
| Table ID | 40 |
| Record count | 0 (empty export) |
| JSON | `docs/database/game_data/TBL_PET_SKILL.json` |
| Client constant | `GamePredef.TBL_PET_SKILL = 40` |

## Purpose

Runtime instance table holding the skills assigned to a specific pet instance. Records are per-pet and server-managed, so no static rows exist in the client dump. The secondary index `TBL_INDEX_ARRAY[40] = "pid"` (`GamePredef.as:8356`) groups skill records by pet instance ID (`pid`).

## Key reference

Fields confirmed from `.as` client usage:

| Key | Type | Function |
|---|---|---|
| `pid` | int | Parent pet instance ID (`TBL_PET.id`). Used as the index key to retrieve all skills for a given pet. |

Empty export; no static rows. The client constant is present and the index scheme is confirmed (`TBL_INDEX_ARRAY[40] = "pid"`), but no field-level reads of `gameData[40]` were found in the non-data AS files — skill data appears to be accessed via `petData.skills` object attached directly to the pet instance rather than through a separate GameData array lookup.

## Client usage

- `TBL_INDEX_ARRAY[40] = "pid"` (`GamePredef.as:8356`) — confirms `pid` as the grouping key.
- No `gameData[GamePredef.TBL_PET_SKILL]` or `GameData.d[40]` reads were found in `ui/`, `logic/`, `object/`, `system/`, or `utils/` packages.
- Skill upgrade RPCs `remote.petUpSkill(petId, index)` and `remote.petDelSkill(petId, index, pass)` operate on skill slot indexes, not on rows from this table directly.

## Related tables

- `pid` → [[TBL_PET]] (parent pet instance).
- Skill definitions come from [[TBL_SKILL]] (static, keyed by skill template ID).
