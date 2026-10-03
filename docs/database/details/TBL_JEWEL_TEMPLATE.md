# TBL_JEWEL_TEMPLATE

| Property | Value |
|---|---|
| Table ID | 31 |
| Record count | 0 (empty export) |
| JSON | `docs/database/game_data/TBL_JEWEL_TEMPLATE.json` |
| Client constant | `GamePredef.TBL_JEWEL_TEMPLATE = 31` |

## Purpose

Empty export; no static rows. This table defines jewel/gem template types that can be socketed into equipment. The client registers this table with `TBL_INDEX_ARRAY[TBL_JEWEL_TEMPLATE] = null` and `TBL_INDEX_ARRAY2[TBL_JEWEL_TEMPLATE] = null` (no secondary indexing), and assigns the link type `"JET"` (`LINK_TYPE_ARRAY[TBL_JEWEL_TEMPLATE] = "JET"`). Because the record count is 0 in this dump, it is classified as a static-template table whose data was not exported (not a runtime-instance table) — the jewel system may have been disabled or the data omitted from this client build's data package.

## Key reference

No field-level usage recovered from static analysis — no `GameData.d[GamePredef.TBL_JEWEL_TEMPLATE]` or `gameData[31]` reads were found in any UI, logic, or system `.as` files outside of `GamePredef.as` constant declarations. The jewel property type (used in socketed equipment tooltips) is read from `TBL_ITEM_TEMPLATE.propType` and `GamePredef.JEWEL_PROP_NAME[propType]`, not from this table directly.

## Client usage

- `GamePredef.as:524` — constant declaration: `TBL_JEWEL_TEMPLATE:uint = 31`.
- `GamePredef.as:8347` — `TBL_INDEX_ARRAY[TBL_JEWEL_TEMPLATE] = null` (no primary index).
- `GamePredef.as:8435` — `TBL_INDEX_ARRAY2[TBL_JEWEL_TEMPLATE] = null` (no secondary index).
- `GamePredef.as:8510` — `TBL_INDEX_ARRAY3[TBL_JEWEL_TEMPLATE] = null`.
- `GamePredef.as:8559` — `LINK_TYPE_ARRAY[TBL_JEWEL_TEMPLATE] = "JET"` (chat-link type).
- No `GameData.d[31]` reads found in any UI/logic/system file — table data not consumed by the client in this build.

## Related tables

- Jewel socketing into equipment: [[TBL_EQUIPT_JEWEL]] (equipment-to-jewel socket map).
- Element jewel variants: [[TBL_ELEMENT_JEWEL]].
- Per-player socketed jewel instances: [[TBL_JEWEL_INSTANCE]].
