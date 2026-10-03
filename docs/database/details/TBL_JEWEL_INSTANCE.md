# TBL_JEWEL_INSTANCE

| Property | Value |
|---|---|
| Table ID | 30 |
| Record count | 0 (empty export) |
| JSON | `docs/database/game_data/TBL_JEWEL_INSTANCE.json` |
| Client constant | `GamePredef.TBL_JEWEL_INSTANCE = 30` |

## Purpose

Empty export; no static rows. This is a runtime/instance table that would hold per-player socketed jewel state. Like its sibling `TBL_JEWEL_TEMPLATE`, it is registered with null indexes and carries the link type `"JE"` for in-chat item linking. No field-level reads were found in any client UI or logic file, indicating the jewel instance system was either not active in this client build or all jewel state is managed via a different mechanism (e.g., embedded within equipment instance records in `TBL_EQUIPT_INSTANCE`).

## Classification

Instance / runtime / character-scoped. No static rows exist in the client data dump.

## Key reference

Empty export; no field-level usage recovered from `.as` static analysis. No `GameData.d[GamePredef.TBL_JEWEL_INSTANCE]` or `gameData[30]` reads found in any UI, logic, or system file outside of `GamePredef.as`.

## Client usage

- `GamePredef.as:523` — constant declaration: `TBL_JEWEL_INSTANCE:uint = 30`.
- `GamePredef.as:8346` — `TBL_INDEX_ARRAY[TBL_JEWEL_INSTANCE] = null`.
- `GamePredef.as:8434` — `TBL_INDEX_ARRAY2[TBL_JEWEL_INSTANCE] = null`.
- `GamePredef.as:8509` — `TBL_INDEX_ARRAY3[TBL_JEWEL_INSTANCE] = null`.
- `GamePredef.as:8558` — `LINK_TYPE_ARRAY[TBL_JEWEL_INSTANCE] = "JE"` (chat-link type for jewel instances).
- No `GameData.d[30]` reads found in any UI/logic/system file.

## Related tables

- Jewel template definitions: [[TBL_JEWEL_TEMPLATE]].
- Equipment socketing map: [[TBL_EQUIPT_JEWEL]].
