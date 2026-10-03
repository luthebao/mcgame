# TBL_EXTEND_POSITION

| Property | Value |
|---|---|
| Table ID | 71 |
| Record count | 11 |
| JSON | `docs/database/game_data/TBL_EXTEND_POSITION.json` |
| Client constant | `GamePredef.TBL_EXTEND_POSITION = 71` |

## Purpose

Defines the fixed spawn positions for building-type objects placed on a specific map. All 11 records in this export are on map 49 and share `buildType = 1`, placing them as a set of guild-building or construction-site anchor points. Each record provides the pixel coordinate, direction facing, and render layer for the building's initial world position.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. |
| `mid` | int | Map ID where this position is located. All 11 records reference map `49`. Foreign key → [[TBL_MAP]]. |
| `tid` | int | Building template ID. All 11 records have `tid = 1`. Foreign key → [[TBL_BUILDING]] (id=70). `BuildSlot.as:86` and `BuildInfoPanel.as:548` resolve `GameData.d[TBL_BUILDING][tid]` to get building data. |
| `buildType` | int | Category of building at this position. All 11 records = `1`. Matches the building-type indexing used by `ConstructionManager.as:341` (`gameDataIndex[TBL_BUILDING][buildType]`). |
| `posX` | int | X pixel coordinate of the building on the map (e.g. `2317`). Used to position the `BuildingView` in the scene. |
| `posY` | int | Y pixel coordinate of the building. |
| `posDir` | int | Facing direction of the building sprite at spawn. All 11 records = `0`. Copied to `BuildingView._local_4.posDir` (`BuildingView.as:123`). |
| `layer` | int | Render layer / depth sorting hint. All 11 records = `0`. Copied to `BuildingView._local_4.layer` (`BuildingView.as:126`). |

## Value distributions / sentinels

- `buildType`: all 11 = `1`.
- `mid`: all 11 = `49` (single map in this export; likely guild-city or faction-base map).
- `posDir`: all 11 = `0`.
- `layer`: all 11 = `0`.
- `tid`: all 11 = `1`.

## Client usage

`GamePredef.TBL_EXTEND_POSITION = 71` is defined in `GamePredef.as:562` and registered in `TBL_INDEX_ARRAY`. No direct lookup of `GameData.d[GamePredef.TBL_EXTEND_POSITION]` was found in the exported UI or logic files — the constant exists but no runtime call site using it by name was located. The fields `posDir`, `layer`, and `tid` appear in `BuildingView.as:118–126` and `Core.as:918–929` when building objects are added to the scene, suggesting this table is consumed server-side or via a generic `addNewData` call that populates building instances into the scene without referencing the constant directly.

## Related tables

- `mid` → [[TBL_MAP]] (map where building is placed).
- `tid` → [[TBL_BUILDING]] (building template, `GamePredef.TBL_BUILDING = 70`).
