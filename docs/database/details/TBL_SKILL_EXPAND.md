# TBL_SKILL_EXPAND

| Property | Value |
|---|---|
| Table ID | 54 |
| Record count | 0 (empty export) |
| JSON | `docs/database/game_data/TBL_SKILL_EXPAND.json` |
| Client constant | `GamePredef.TBL_SKILL_EXPAND = 54` |

## Purpose

Empty export; no static rows. This table appears to be either a runtime extension table for dynamic skill expansion data, or a feature that was planned but not shipped in this version of the client. No `TBL_INDEX_ARRAY` entry for table ID 54 appears in `GamePredef.as`, and no `ui/`, `logic/`, or `object/` file was found accessing `GameData.d[54]` or `GamePredef.TBL_SKILL_EXPAND` by constant name.

The constant `GamePredef.TBL_SKILL_EXPAND = 54` is declared at `GamePredef.as:547` alongside the other skill table constants, confirming the table ID is reserved and the table is known to the client — but field-level usage has not been recovered from static analysis.

## Key reference

Empty export; no static rows. Client constant present but no field-level usage recovered.

## Client usage

No field access found in any `ui/`, `logic/`, `system/`, or `object/` `.as` file. The constant is declared in `GamePredef.as:547`.

## Related tables

- Likely extends [[TBL_SKILL]] with per-expansion or per-event overrides (inferred from name — no data to confirm).
