# TBL_ELEMENT_TEMPLATE

| Property | Value |
|---|---|
| Table ID | 16 |
| Record count | 0 (empty export) |
| JSON | `docs/database/game_data/TBL_ELEMENT_TEMPLATE.json` |
| Client constant | `GamePredef.TBL_ELEMENT_TEMPLATE = 16` |

## Purpose

Element Template defines the static metadata for elemental gear/synthesis items used in crafting (referenced by `TBL_MYSTRE_RECIPE.st` as the output type `"16-<slot>-<qty>"`). The JSON export is empty — this is a server-side or lazily-populated static table whose rows were not included in the client data dump. The client constant and link-type marker are present, indicating the system is used.

## Classification

Static template table (game-data definition). Empty in this export; rows likely exist server-side or were stripped from the client data bundle. Not a runtime/instance table.

## Client constant and registry

- `GamePredef.TBL_ELEMENT_TEMPLATE = 16` (`GamePredef.as:509`).
- `TBL_INDEX_ARRAY[TBL_ELEMENT_TEMPLATE] = null` (`GameData.as:8332`) — no secondary index.
- `TBL_INDEX_ARRAY2[TBL_ELEMENT_TEMPLATE] = null` (`GameData.as:8420`).
- `TBL_INDEX_ARRAY3[TBL_ELEMENT_TEMPLATE] = null` (`GameData.as:8495`).
- `LINK_TYPE_ARRAY[TBL_ELEMENT_TEMPLATE] = "ELT"` (`GameData.as:8561`) — the link-type abbreviation "ELT" is registered, indicating the client can resolve item lookups under this type.

## Fields confirmed from client usage

- `Core.as:2073` — `TBL_ELEMENT_TEMPLATE` appears in the template-type switch alongside `TBL_ITEM_TEMPLATE` and `TBL_EQUIPT_TEMPLATE`, meaning the client handles it as a standard template VO for tooltip and drag-drop.
- `TBL_MYSTRE_RECIPE.st` format `"16-<elementSlotId>-<qty>"` — the second component (slot ID) and third component (quantity) describe which element template record to produce. The exact field schema of each row is not recoverable from this empty export.

## Key reference

No field-level schema can be confirmed from the empty export. Based on its role as a synthesis output and its treatment identically to `TBL_ITEM_TEMPLATE` in the client dispatch (`Core.as:2073–2076`), it likely carries at minimum: `id`, `name`, `iconCode`, and type/category fields. These are `(inferred — no static rows present and no field reads identified beyond the type dispatch)`.

## Related tables

- `TBL_MYSTRE_RECIPE.st` prefix `"16"` references this table as the crafting output type.
- Sibling: [[TBL_ELEMENT_JEWEL]] (id=17) — jewel instance table with secondary index on `"eid"`.
