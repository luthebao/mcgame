# TBL_WAR_MAP

| Property | Value |
|---|---|
| Table ID | 89 |
| Record count | 12 |
| JSON | `docs/database/game_data/TBL_WAR_MAP.json` |
| Client constant | `GamePredef.TBL_WAR_MAP = 89` |

## Purpose

Defines the 12 zodiac-themed Star Instance war-map zones used in the Tinh Cung (Star Palace) system. Each record corresponds to one zodiac constellation palace (e.g., "Cung Bạch Dương" = Aries Palace) that players can enter and contest. The table is indexed by `type` (`TBL_INDEX_ARRAY[TBL_WAR_MAP] = "type"`, `GamePredef.as:8389`), meaning the client looks up a war-map by its `type` value rather than by `id` directly.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key (1–12, one per zodiac sign). |
| `name` | string | Vietnamese display name of the zodiac palace (e.g., `"Cung Bạch Dương"` = Aries, `"Cung Kim Ngưu"` = Taurus, …, `"Cung Song Ngư"` = Pisces). Read by `StarInstanceMap.as:877` for the confirmation alert and by `StarInstanceMap.as:1182` to set the star-instance canvas name label. |
| `pid` | string | Player-ID-slot reference in the format `"<zoneGroup>-<slotIndex>"` (e.g., `"10-1"` through `"10-12"`). The leading `10` appears to be a fixed zone/group identifier; the suffix is the slot number within that group. `(inferred from data — no client field-level usage found for `pid` on this table)` |
| `rc` | string | Resource code for the war-map's visual asset. Empty (`""`) for all 12 records in this dump — asset may be determined dynamically or by another means at runtime. `(inferred from data — no client usage found)` |
| `type` | int | Secondary index key, always `1` across all 12 records. Used by the client to locate records via `TBL_INDEX_ARRAY[TBL_WAR_MAP] = "type"`. Because all rows share `type = 1`, the index buckets all 12 war-maps together; individual maps are then accessed by their `id` within that bucket. `StarInstanceMap.as:574,591` checks `.type` to filter records. |

## Value distributions / sentinels

- `type`: all 12 records = `1` (uniform; functions as a category tag rather than a discriminator).
- `rc`: all 12 records = `""` (empty; asset lookup happens elsewhere).
- `pid`: all 12 are unique `"10-N"` pairs (N = 1–12), one per zodiac sign.

## Client usage

- `StarInstanceMap.as:875–877` — `warMapClick(id)` checks `_core.data.gameData[GamePredef.TBL_WAR_MAP][id]` and reads `.name` to populate the confirmation dialog: `"Bạn có muốn vào [name]?"`.
- `StarInstanceMap.as:1182` — sets `starIns{N}.starName = GameData.d[GamePredef.TBL_WAR_MAP][N].name` to label each star-instance slot on the map UI.
- `StarInstanceMap.as:574,591` — iterates war-map records checking `.type` to find applicable maps.
- The `_warMapMax` and `_warMapNum` counters track how many war-map instances the player has entered (`StarInstanceMap.as:950–951`).

## Related tables

- Part of the Tinh Cung (Star Instance) system alongside [[TBL_WAR_SPRITE]] (spirit/sprite upgrade trees for each war map).
- Conceptually linked to [[TBL_MAP]] (the physical maps players navigate inside each palace), but no explicit FK field is present in this table.
