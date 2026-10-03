# TBL_ELEMENT_JEWEL

| Property | Value |
|---|---|
| Table ID | 17 |
| Record count | 0 (empty export) |
| JSON | `docs/database/game_data/TBL_ELEMENT_JEWEL.json` |
| Client constant | `GamePredef.TBL_ELEMENT_JEWEL = 17` |

## Purpose

Element Jewel is the companion instance/lookup table to `TBL_ELEMENT_TEMPLATE`. While the template table defines item definitions, the jewel table likely holds gem/jewel instance data or a secondary index variant for elemental jewel items. The JSON export is empty — no static rows were included in the client data dump.

## Classification

Static or instance-adjacent table (empty export). The presence of a `"eid"` secondary index strongly suggests this holds instance or sub-variant records keyed by element ID (`eid`), rather than being a pure runtime table.

## Client constant and registry

- `GamePredef.TBL_ELEMENT_JEWEL = 17` (`GamePredef.as:510`).
- `TBL_INDEX_ARRAY[TBL_ELEMENT_JEWEL] = "eid"` (`GameData.as:8333`) — secondary index on field `eid`.
- `TBL_INDEX_ARRAY2[TBL_ELEMENT_JEWEL] = null` (`GameData.as:8421`).
- `TBL_INDEX_ARRAY3[TBL_ELEMENT_JEWEL] = null` (`GameData.as:8496`).

## Fields confirmed from client usage

No field-level reads were recovered from any identified `.as` file outside `GamePredef.as` and `GameData.as`. The secondary index key `"eid"` indicates each row carries at minimum an `eid` field (element ID, likely foreign key to `TBL_ELEMENT_TEMPLATE.id`).

Empty export; no static rows. Client constant and secondary index (`eid`) are present but no field-level usage beyond the index registration was recovered.

## Related tables

- `eid` secondary index likely references [[TBL_ELEMENT_TEMPLATE]] `id`.
- Sibling: [[TBL_EQUIPT_JEWEL]] (which also has `"eid"` secondary index per `GameData.as:8336`) — the element jewel table mirrors the equipment jewel pattern.
