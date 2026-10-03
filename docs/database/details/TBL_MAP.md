# TBL_MAP

| Property | Value |
|---|---|
| Table ID | 33 |
| Record count | 209 |
| JSON | `docs/database/game_data/TBL_MAP.json` |
| Client constant | `GamePredef.TBL_MAP = 33` |

## Purpose

Defines every static map / scene in the world: dimensions, safe-point, connectivity to other maps, PvP and flight rules, encounter tuning, and visual theming. The Flash client builds a runtime lookup `GameData.d[33][mid]` so all map access is `d[33][posMapId]`. A secondary index `TBL_INDEX_ARRAY[TBL_MAP] = "safeFlag"` (`GameData.as:8349`) lets the client bucket maps by safe/field in one pass.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key (`posMapId` / `mid`). Looked up as `GameData.d[33][id]`. |
| `name` | string | Vietnamese display name (`"Xuất Vân Thôn"`). Used in chat, tooltips, mini-map header (`MiniMapCanvas.as:934`), system broadcasts. |
| `info` | string | Long-form description shown in the map info tooltip (`TipMap.as:315`). |
| `resCode` | int | SWF asset code for the map background; passed to `ResManager.getResUrl(resCode)` in `MapContainer.init(...)`. |
| `lastEditTime` | timestamp | Unix epoch ms from the map-editor tool. Bookkeeping only. |
| `width` | int | Map width (px). Passed to `MapContainer.init(..., width, height, type, ...)`. |
| `height` | int | Map height (px). |
| `safeX` | int | Default respawn / safe-point X. Used by `Move.getSafeRoute(...)` to pull a player to safety. |
| `safeY` | int | Safe-point Y. |
| `sArea` | coord-list | "Sub-area" rectangles `"x1,y1-x2,y2\|..."`. Parsed by `AreaUtil.getRectArea` (`AreaUtil.as:96`) for sub-region triggers. `"0"` = none. |
| `plBattle` | coord-list | Pipe-delimited `"x,y\|x,y\|..."` combat spawn points (wild encounters). |
| `plProduct` | coord-list | Pipe-delimited gathering/production node points. Identical to `plBattle` on 187/209 maps. |
| `cl` | pipe-list | List of map IDs reachable from this map (border/portal exits). Start town (id=1) is empty (`\|`). |
| `mMap` | int | Main map (continent / region group) ID. `mMap < 0` treated as world-level / no parent (`MapPanel.as:556`). |
| `sMap` | int | Sub-map (zone) ID inside `mMap`. |
| `land` | int | World-map sprite layer (1 or 2). `WorldMap.as:1485` toggles `worldMap1/worldMap2` visibility. |
| `safeFlag` | bool(0/1) | `>0` = town/safe zone. Drives tooltip label + teleport-cost visibility (`TipMap.as:317`) and attack permission (`MapCanvas.as:1665`). Also the table's secondary index key. |
| `pk` | int | PK rule: `-1` none (145 maps), `1` light (53), `2` full (11). `Player.as:282` checks `pk > 0`. |
| `dead` | bool(0/1) | Whether players can die here (`1`=yes). |
| `flyable` | bool(0/1) | Mount/flight permission. `GameScene.as:234` blocks takeoff if `flyable != 1`. |
| `airSafe` | bool(0/1) | While flying, `airSafe != 1` force-grounds the player (`Player.as:112/144`). |
| `copyFlag` | int | Instance flag: `0` persistent world (123), `3` instance/dungeon (85), `1` outlier. `Player.as:692` checks `copyFlag == 3`. |
| `basicBattleRate` | int | Base wild-encounter rate (%). `0` on towns, `50` on most field maps. |
| `basicMinNum` | int | Minimum monsters per encounter pull. |
| `basicMaxNum` | int | Maximum monsters per encounter pull. Roster comes from [[TBL_MAP_CREATURE]] joined by `mid`. |
| `expMulti` | float | XP multiplier for kills in this map (`"1.00"` default). |
| `level` | int | Recommended player level (tooltip `TipMap.as:316`). |
| `lv` | int | Hard level gate to enter; `-1` = no gate. Distinct from `level` (recommendation only). |
| `type` | int | Map type/category. Always `2` in this dump (likely vestigial enum); passed to `MapContainer.init(..., type, ...)`. |
| `colorCode` | int | Minimap dot / nameplate hue. |
| `brightCode` | int | Lighting/brightness preset. `0` default; non-zero applies tint/darkness (`MapCanvas.as:60`). |
| `g` | int | Almost always `1`. Likely "grouping allowed" flag. `(inferred from data — no client usage found)` |
| `m` | int | Map-class sub-flag (`0` town, `1` field, `3` PK). Co-varies with `pk`/`safeFlag`. `(inferred from data — no client usage found)` |
| `t` | int | Terrain hint (`1` on all sampled records). Reserved. `(inferred from data — no client usage found)` |

## Value distributions / sentinels

- `type`: all 209 = `2`.
- `safeFlag`: `0`×156 (field), `1`×53 (safe/town).
- `copyFlag`: `0`×123, `3`×85 (instances), `1`×1.
- `pk`: `-1`×145, `1`×53, `2`×11.
- `land`: `1`×194, `2`×15 (second continent).

## Client usage

- `GameScene.as` — flight gate (`flyable`), encounter logic.
- `Player.as:112/144/282/692` — `airSafe` force-land, `pk` flag, `copyFlag` instance handling.
- `MapCanvas.as:60/1665` — `brightCode` filter, `safeFlag` → `mapSafe`.
- `MapContainer.init` — `resCode`, `width`, `height`, `type`.
- `WorldMap.as:1485` / `MiniMapCanvas.as:934` — `land` layer, `name` header.
- `TipMap.as:315–317` — `info`, `level`, `safeFlag` tooltip.
- `AreaUtil.as:96` — `sArea` rectangle parsing.

## Related tables

- `mid` link target for [[TBL_MAP_CREATURE]] (spawn roster), [[TBL_MAP_CELL]] (collision/pathfinding cells), [[TBL_EXTEND_POSITION]], [[TBL_NPC]] (`posMapId`), [[TBL_SCENEITEM_INSTANCE]] (`posMapId`).
- `cl` references other [[TBL_MAP]] ids (adjacency).
- Battlefield/event variants: [[TBL_WAR_MAP]], [[TBL_MEVENT_MAP]], [[TBL_GUILD_MAP]], [[TBL_CHARACTOR_MAP]].
