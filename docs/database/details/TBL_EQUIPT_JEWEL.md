# TBL_EQUIPT_JEWEL

| Property | Value |
|---|---|
| Table ID | 20 |
| Record count | 0 (empty — runtime socket data table) |
| JSON | `docs/database/game_data/TBL_EQUIPT_JEWEL.json` |
| Client constant | `GamePredef.TBL_EQUIPT_JEWEL = 20` |

## Purpose

Runtime per-instance jewel socket table. Each row stores which item-template-ID gems are socketed into which holes of a given equipment instance. No static rows exist in the client dump because this is entirely live player data. The server returns this data via the `getJewelData` RPC callback (`onJeweSetUpdate`), not via the static game-data bundle. The client secondary index is `TBL_INDEX_ARRAY[20] = "eid"` (`GamePredef.as:8336`), meaning rows are keyed by equipment instance ID (`eid`).

Classification: **per-equipment-instance runtime data** — one row per equipment instance that has socketed jewels, scoped to the owning character.

## Key reference

Fields recovered from `EquipFunc.as:8508–8531` (`onJeweSetUpdate` handler):

| Field | Type | Function |
|---|---|---|
| `eid` | int | Equipment instance ID. Secondary index key (links to [[TBL_EQUIPT_INSTANCE]] `id`). Used by `GamePredef.as:8336` as the index field. |
| `holeNum` | int | Number of active socket holes on this equipment instance (0–10). The handler iterates 1 to `holeNum` to populate jewel slots (`EquipFunc.as:8514–8527`). |
| `t1`–`t10` | int | Item template ID of the jewel socketed in slot N. `0` or absent = empty slot. Fetched as `_arg_1[("t" + i)]` where i=1..holeNum. The jewel template itself is in [[TBL_ITEM_TEMPLATE]] (type `ITEM_TYPE_JEWEL = 503`). |

## Client usage

- **`EquipFunc.as:9363`** — calls `_core.remote.call("getJewelData", new Responder(onJeweSetUpdate), jewelSetItem.slotData.id)` to request this data from the server for the displayed equipment piece.
- **`EquipFunc.as:8508–8531`** (`onJeweSetUpdate`) — the callback handler. Reads `_arg_1.holeNum` and loops over `_arg_1["t" + i]` for i=1..holeNum to populate `jewelSet1`..`jewelSet10` slot displays with `GamePredef.TBL_ITEM_TEMPLATE` icon data.
- **`EquipFunc.as:1450/1463/8868`** — `jewelDel` (remove jewel) and `jewelSet` (set jewel batch) RPCs reference the equipment instance ID; server updates the jewel row accordingly.
- `TBL_INDEX_ARRAY[20] = "eid"` — confirms the client indexes this table by equipment instance ID rather than a row-level primary key.

## Related tables

- `eid` → [[TBL_EQUIPT_INSTANCE]] (the equipment instance whose sockets this row describes).
- `t1`–`t10` values → [[TBL_ITEM_TEMPLATE]] (jewel item templates, type `ITEM_TYPE_JEWEL = 503`).
