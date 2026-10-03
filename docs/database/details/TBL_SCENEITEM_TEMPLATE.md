# TBL_SCENEITEM_TEMPLATE

| Property | Value |
|---|---|
| Table ID | 50 |
| Record count | 399 |
| JSON | `docs/database/game_data/TBL_SCENEITEM_TEMPLATE.json` |
| Client constant | `GamePredef.TBL_SCENEITEM_TEMPLATE = 50` |

## Purpose

Defines the static template for every scene-item object that can be placed on a map: decorations (type `2001`) and teleport portals (type `3`). Each row specifies the visual asset, display name, kind, and economy metadata for a class of scene object. At runtime, instances of these templates are stored in [[TBL_SCENEITEM_INSTANCE]] and placed in the world by the server. The client looks up template data via `_core.data.getGameData(GamePredef.TBL_SCENEITEM_TEMPLATE, inst.tid)` during scene construction (`GameScene.as:268`). The secondary index is not set (`TBL_INDEX_ARRAY[50] = null`), so lookup is always by `id`.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Referenced as `tid` in [[TBL_SCENEITEM_INSTANCE]]. Looked up via `getGameData(50, tid)`. |
| `name` | string | Display name of the scene object (Chinese retained in dump, e.g. `"传送点"` = teleport, `"大草"` = tall grass). Shown in tooltip when `type == TYPE_TRANSPORT` (3). |
| `description` | string | Tooltip description. Empty (`""`) on all 399 records in this dump. |
| `type` | int | Object category. `3` = `SceneItemView.TYPE_TRANSPORT` — interactive teleport portal (5 rows, mouse-enabled, fires player route); `2001` = decorative scene prop (394 rows, non-interactive). Checked in `SceneItemView.as:27,55,74,170`. |
| `kind` | int | Object super-kind. `20` on all 399 records. (inferred from data — no client branch on this value found; likely a fixed enum for scene objects vs. map-cell entities) |
| `resCode` | string | Asset URL code (13-digit string, e.g. `"2020040000001"`) passed to `ResManager.getResUrl(resCode)` to load the SWF sprite displayed on the map (`SceneItemView.as:69`). |
| `iconCode` | string | Icon asset code. Empty (`""`) on all 399 records — scene items have no bag icon. |
| `keepTime` | int | Duration this scene item persists on the map (minutes). `0` on all 399 records, meaning infinite / server-controlled lifetime. (inferred from field name + data — no client read confirmed) |
| `gold` | int | Gold cost to interact/place. `0` on all 399 records. (inferred from data — no client usage found) |
| `honor` | int | Honor cost. `0` on all 399 records. (inferred from data — no client usage found) |
| `price` | int | NPC sell price. `0` on all 399 records. (inferred from data — no client usage found for scene items) |
| `colorCode` | int | Visual tint/color overlay code. `0` on all 399 records. (inferred from data — the `SceneItem.colorCode` getter reads `data.colorCode` from the instance, not the template) |
| `brightCode` | int | Brightness/lighting preset. `0` on all 399 records. (inferred from data — `SceneItem.brightCode` getter reads instance field; template field appears unused) |

## Value distributions / sentinels

- `type`: `2001` × 394 (decorative props), `3` × 5 (transport/teleport portals).
- `kind`: `20` × 399 — uniform; no branching logic found on this value.
- `keepTime`, `gold`, `honor`, `price`, `colorCode`, `brightCode`, `iconCode`: all zero/empty across the entire dump.
- `description`: empty on all records.

## Client usage

- `GameScene.as:268–273` — during `sceneLogin`, iterates `gameDataIndex[TBL_SCENEITEM_INSTANCE][mapId]`, looks up template via `getGameData(TBL_SCENEITEM_TEMPLATE, inst.tid)`, and pushes `{iData, tData}` pairs to `sceneCreateItems`.
- `Core.as:370–383` — `createSceneItem` assigns `templateData` (from this table) and `data` (from instance) to a `SceneItem` object, then calls `data.addNewData(TBL_SCENEITEM_TEMPLATE, tData)` to cache the template.
- `SceneItem.as` — `kind`, `resCode`, and `type` are read exclusively from `templateData` (this table); `posX`, `posY`, `posDir`, `colorCode`, `brightCode`, `tid`, `id`, `name` are read from `data` (instance).
- `SceneItemView.as:55,74,170` — branches on `type == 3` (TYPE_TRANSPORT) to enable mouse interaction (teleport click). Decorative items (`2001`) are non-interactive.
- `MapCanvas.as:185,227,377,385` — adds/queries scene items by type and `posMapId` index for minimap rendering.
- `RPCConfig.as:33` — `createSceneItems` has a 1100 ms RPC throttle, indicating a server push.
- Template is not indexed separately; looked up on-demand by `tid` from the instance table.

## Related tables

- `tid` (in [[TBL_SCENEITEM_INSTANCE]]) → this table's `id`.
- `posMapId` (in [[TBL_SCENEITEM_INSTANCE]]) → [[TBL_MAP]] `id`.
