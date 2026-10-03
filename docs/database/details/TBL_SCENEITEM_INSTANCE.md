# TBL_SCENEITEM_INSTANCE

| Property | Value |
|---|---|
| Table ID | 49 |
| Record count | 1094 |
| JSON | `docs/database/game_data/TBL_SCENEITEM_INSTANCE.json` |
| Client constant | `GamePredef.TBL_SCENEITEM_INSTANCE = 49` |

## Purpose

Every placed scene-object instance in the world: decorative props and teleport portals, each at a specific map position. Rows are pre-loaded from the game dump; the server may push additions via the `createSceneItems` RPC. The client maintains a dual index: primary by `id` and secondary by `posMapId` (`TBL_INDEX_ARRAY[49] = "posMapId"`) and tertiary by `ownerId` (`TBL_INDEX_ARRAY2[49] = "ownerId"`), enabling fast per-map retrieval (`gameDataIndex[49][mapId]`). At scene entry the client fetches all instances for the current map and pairs each with its template row from [[TBL_SCENEITEM_TEMPLATE]].

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key of the instance. Used as the key in `gameData[49][id]`. |
| `tid` | int | Template ID — foreign key into [[TBL_SCENEITEM_TEMPLATE]]. Looked up via `getGameData(50, tid)` (`GameScene.as:268`). |
| `name` | string | Instance-specific display name (e.g. `"Vân Đài"`). May override the template `name` for contextual tooltip. Read via `SceneItem.name` getter from `data.name`. |
| `posMapId` | int | Map ID where this instance lives — foreign key into [[TBL_MAP]]. The secondary index key; all instances are bucketed by this field for O(1) per-map lookup (`gameDataIndex[49][posMapId]`). |
| `posX` | int | World X coordinate (pixels). Assigned to `SceneItemView.x` at scene entry (`SceneItemView.as:53`). |
| `posY` | int | World Y coordinate (pixels). Assigned to `SceneItemView.y`. |
| `posDir` | int | Facing direction. `0` = normal (1086 rows), `1` = mirrored/flipped (`scaleX = -1`, `SceneItemView.as:97–100`). |
| `layer` | int | Rendering layer hint. `0` = fully opaque / foreground (168 rows, `alpha = 1`), `1` = semi-transparent background layer (166 rows), `2` = most common mid-layer (760 rows, `alpha = 0.6` default). Checked in `SceneItemView.as:64–67`. |
| `colorCode` | int | Instance-level visual tint code. `0` on all 1094 records in this dump. Read via `SceneItem.colorCode` getter. (inferred from data — override mechanism exists but unused here) |
| `brightCode` | string | Instance-level brightness override. Empty string `""` on all 1094 records. Read via `SceneItem.brightCode` getter as `int`. |
| `ownerId` | string | ID of the owning entity (player, guild, etc.) for player-placed scene items. Empty on all 1094 static records. The tertiary index key (`TBL_INDEX_ARRAY2[49] = "ownerId"`). When set, `SceneItem.usedFlag` returns `true`. |
| `ownerType` | string | Type category of the owner (e.g. guild, player). Empty on all 1094 static records — only populated for dynamically placed items. (inferred from data — paired with `ownerId`) |
| `maker` | string | Name of the player who placed this item. Empty on all 1094 static records. (inferred from data — `TipEquip.as` and `TipWing.as` show `.maker` as a crafter name field on a different context; here it mirrors that semantics for player-placed props) |
| `deadLine` | string | Expiry datetime for temporary scene items (e.g. player-placed decorations). Empty on all 1094 static records; presumably a timestamp string for timed instances. (inferred from field name + data pattern — no client read confirmed for scene items specifically) |

## Value distributions / sentinels

- `posDir`: `0` × 1086 (normal), `1` × 8 (mirrored).
- `layer`: `2` × 760 (default mid-layer), `0` × 168 (fully opaque foreground), `1` × 166 (background).
- `ownerType`, `ownerId`, `maker`, `deadLine`, `brightCode`: all empty on every static record — these are runtime fields only populated for player-created or server-spawned dynamic instances.
- `colorCode`: `0` on all records.

## Client usage

- `GameScene.as:264–273` (`sceneLogin`) — reads `gameDataIndex[49][mapId]` to get all instances for the current map, pairs each with its template, and calls `sceneCreateItems`.
- `Core.as:370–383` (`createSceneItem`) — receives `{iData, tData}` pair; assigns `iData` (this table's row) to `SceneItem.data` and `tData` (template row) to `SceneItem.templateData`.
- `SceneItem.as` — accessors: `posY`, `posX`, `posDir` (→ `data.posY/posX/posDir`); `brightCode`, `colorCode`, `tid`, `id`, `name`, `usedFlag` (→ `data.*`); `resCode`, `kind`, `type` (→ `templateData.*`).
- `SceneItemView.as:53–70` — positions view at `posX`/`posY`, branches on `layer == 0` for `alpha = 1`, applies `scaleX = -1` when `posDir == 1`, loads asset from `ResManager.getResUrl(templateData.resCode)`.
- `MapCanvas.as:185,227,377` — uses `TBL_SCENEITEM_INSTANCE` type tag on draggable items; `getUI(PANEL_MAP)` renders portal icons using `gameDataIndex[49][mid]`.
- `CallBack.as:6831–6835` (`onCreateSceneItems`) — server-push handler that calls `sceneCreateItems` to add new instances at runtime.
- `LINK_TYPE_ARRAY[49] = "SC"`, `LINK_TYPE_ARRAY[50] = "SCT"` (`GamePredef.as:8552–8553`) — scene item link codes for chat hyperlinks.

## Related tables

- `tid` → [[TBL_SCENEITEM_TEMPLATE]] `id`.
- `posMapId` → [[TBL_MAP]] `id`.
- Server secondary index: `ownerId` groups player-placed items by owner.
