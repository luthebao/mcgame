# TBL_EQUIPT_TYPE

| Property | Value |
|---|---|
| Table ID | 21 |
| Record count | 0 (empty — no static rows in client dump) |
| JSON | `docs/database/game_data/TBL_EQUIPT_TYPE.json` |
| Client constant | `GamePredef.TBL_EQUIPT_TYPE = 21` |

## Purpose

Intended to store equipment type metadata (display names, filter categories, or UI groupings for the `type` field in [[TBL_EQUIPT_TEMPLATE]]). The table is empty in the client game-data export, which means its content was either never populated in the client bundle or was fully superseded by the hardcoded `ITEM_TYPE_*` constants and `ITEM_KIND_TYPE` object in `GamePredef.as`. The type system is entirely client-side and requires no server-loaded records.

Classification: **empty static reference table** — no records exist in this export. The equipment type enum is hardcoded in `GamePredef.as` (`ITEM_TYPE_HAMMER = 100`, `ITEM_TYPE_STICK = 101`, etc., lines 1025–1082).

## Key reference

Empty export; no static rows. Client constant present but no field-level usage of `GameData.d[21]` or `TBL_EQUIPT_TYPE` data access recovered from any `.as` file.

The `TBL_INDEX_ARRAY[21] = null` assignment in `GamePredef.as:8337` confirms no secondary index is used. No UI or logic file references `d[21]` or calls `getGameData(GamePredef.TBL_EQUIPT_TYPE, ...)`.

## Client usage

`GamePredef.TBL_EQUIPT_TYPE = 21` is declared in `GamePredef.as:514`. The constant appears only in that declaration and in the index setup (`TBL_INDEX_ARRAY[21] = null` at line 8337). No UI panel, manager, or callback reads from this table at runtime. Equipment type filtering is handled by the `ITEM_KIND_TYPE` object (populated in `GamePredef.as:9410–9430+`) and the `ITEM_TYPE_*` constants directly.

## Related tables

- Equipment type codes in [[TBL_EQUIPT_TEMPLATE]] field `type` correspond to the `ITEM_TYPE_*` constants in `GamePredef.as`.
