# TBL_CHARACTOR_PLAN_TYPE

| Property | Value |
|---|---|
| Table ID | 6 |
| Record count | 0 (runtime/instance table) |
| JSON | `docs/database/game_data/TBL_CHARACTOR_PLAN_TYPE.json` |
| Client constant | `GamePredef.TBL_CHARACTOR_PLAN_TYPE = 6` |

## Purpose

A character-scoped runtime table for tracking plan or build-type selections — likely the character's active skill/talent build plan or class specialization choice. No static rows exist in the JSON export. Indexed by `cid` (`TBL_INDEX_ARRAY[TBL_CHARACTOR_PLAN_TYPE] = "cid"` — `GamePredef.as:8322`).

Classification: **runtime / character-scoped instance data**.

## Key reference

Empty export; no static rows. Client constant present but no field-level usage recovered.

No reads of `GameData.d[GamePredef.TBL_CHARACTOR_PLAN_TYPE]` or code referencing this table constant by name outside of `GamePredef.as` were found in the exported `.as` files. Based on the index configuration and the `TBL_CHARACTOR_PLAN_TYPE` name:

| Key | Type | Function |
|---|---|---|
| `id` | int | Record primary key. |
| `cid` | int | Character ID (index key) → [[TBL_CHARACTOR]]. |

Additional fields are unknown without runtime data or server-side DTO inspection.

## Client usage

- `GamePredef.as:499` — `TBL_CHARACTOR_PLAN_TYPE = 6`.
- `GamePredef.as:8322` — `TBL_INDEX_ARRAY[TBL_CHARACTOR_PLAN_TYPE] = "cid"`.

No UI panel or game-logic `.as` file in the exported tree references `GamePredef.TBL_CHARACTOR_PLAN_TYPE` directly. This table is confirmed as a registered runtime table in the game-data infrastructure but its field structure cannot be recovered from static analysis alone.

## Related tables

- `cid` → [[TBL_CHARACTOR]].
