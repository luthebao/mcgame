# TBL_POS

| Property | Value |
|---|---|
| Table ID | 72 |
| Record count | 0 (empty export) |
| JSON | `docs/database/game_data/TBL_POS.json` |
| Client constant | `GamePredef.TBL_POS = 72` |

## Purpose

Runtime/instance table representing named map positions (waypoints or NPC locations) that can be embedded as clickable hyperlinks in system chat messages. The table is empty in the static game-data export because positions are dynamically generated at runtime (e.g., NPC locations queried from the server). The client uses `TBL_POS` primarily as a link-type discriminator rather than a data lookup table.

## Classification

Runtime / server-pushed positional data. No static rows exist in the client dump.

## Client usage

- `GamePredef.as:8574` — `LINK_TYPE_ARRAY[TBL_POS] = "POS"`. Registers the type string `"POS"` used to encode clickable position hyperlinks in chat: format `[@POS|<mapId>|<x>,<y>|0|0|0]`.
- `CallBack.as:9675` (function `onNpcPos`) — iterates a server-sent array of position objects. For each object reads `.name`, `.posMapId`, `.posX`, and `.posY`, then builds a blue chat hyperlink using the `POS` link type. The fields recovered from `.as` usage:
  - `name` — display label for the position (likely NPC or waypoint name).
  - `posMapId` — map ID where this position exists (cross-referenced into `GameData.d[TBL_MAP]`).
  - `posX`, `posY` — pixel coordinates (divided by 10 for display as grid coords).
- `LinkEventUtil.as:130–131` — `case ("L_" + _local_7[GamePredef.TBL_POS])` — handles clicks on POS links; sets `_local_8 = GamePredef.TBL_POS` for downstream routing.
- `LinkEventUtil.as:230–250` — when a POS link is clicked: checks if player is already on `mapId`, validates that `x` and `y` are within map bounds (using `TBL_MAP.width`/`height`), then calls `player.closeTo(x * 10, y * 10)` to auto-navigate the player to the position. If on a different map, shows a navigation hint with the map name.
- `TextUtil.as:89` — matches `"POS"` link type to dispatch click events.

## Fields confirmed from .as usage

| Field | Type (inferred) | Semantic |
|---|---|---|
| `name` | string | Display name of the position/NPC (shown in chat link). |
| `posMapId` | int | Map ID → [[TBL_MAP]]. |
| `posX` | int | Pixel X coordinate (divide by 10 for grid display). |
| `posY` | int | Pixel Y coordinate (divide by 10 for grid display). |

## Related tables

- `posMapId` → [[TBL_MAP]] (map the position belongs to).
