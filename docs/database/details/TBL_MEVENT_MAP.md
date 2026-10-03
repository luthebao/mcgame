# TBL_MEVENT_MAP

| Property | Value |
|---|---|
| Table ID | 128 |
| Record count | 103 |
| JSON | `docs/database/game_data/TBL_MEVENT_MAP.json` |
| Client constant | `GamePredef.TBL_MEVENT_MAP = 128` |

## Purpose

Defines the ordered sequence of cell positions on the Bí Cảnh (Secret Treasure Hunt / Monopoly-style event map) board. Each row represents one cell on the board path, recording where it is placed in screen space and what event type it carries. The client iterates these records sequentially (by `id`) to build the board layout, place NPC sprites on event cells, and animate player movement along the path.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key and sequential cell index on the board (1–103). The client uses `id` as a direct positional index when moving the player token step-by-step. |
| `meventId` | int | Foreign key → [[TBL_MEVENT_TYPE]] `id`. Identifies what event type occupies this cell. Read by `SecretTreasureHuntPanel.as:1848–1855` to look up the event type record and determine whether to show an NPC tooltip. |
| `pos` | csv | Screen position and facing direction of this cell: `"x,y,dir"`. Split on `","` by `SecretTreasureHuntPlayerView.as:123,160,201`. `x` and `y` are pixel coordinates for rendering the cell on the board canvas; `dir` is the direction the player token faces when standing on this cell (values: `1`, `3`, `5`, `7` — cardinal/diagonal directions in the game's 8-way system). |

## Value distributions / sentinels

- `meventId`: 15 distinct values used (not all 19 MEVENT_TYPE ids appear). `3` (mid-point cell) dominates with 67 of 103 records. Other frequent types: `10`×4, `8`×4, `9`×4, `15`×4, `4`×6.
- `pos` third component (`dir`): `1`×34, `3`×25, `5`×23, `7`×21 — only the 4 odd-numbered directions (NE, SE, SW, NW diagonals in the game's convention), no `0`, `2`, `4`, `6`.
- `pos` x/y: coordinates follow a diagonal path pattern (e.g., `74,80` → `118,102` → `162,124`…), incrementing by 44px in x and 22px in y per straight step.

## Client usage

- `SecretTreasureHuntPlayerView.as:122–201` — reads `GameData.d[GamePredef.TBL_MEVENT_MAP][_index].pos`, splits on `","`, uses components `[0]`/`[1]` for x/y canvas position and `[2]` for the player token's facing direction (`dir`). Called at each movement step during board traversal.
- `SecretTreasureHuntPanel.as:1846–1864` — reads `.pos` and `.meventId` for each cell; cross-references `GameData.d[GamePredef.TBL_MEVENT_TYPE][meventId]` to get the event type's `npcId` and `tip` for cell tooltip display.

## Related tables

- `meventId` → [[TBL_MEVENT_TYPE]] (event type definition: NPC, tooltip text, cell category).
