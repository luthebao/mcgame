# TBL_MAP_CREATURE

| Property | Value |
|---|---|
| Table ID | 34 |
| Record count | 1192 |
| JSON | `docs/database/game_data/TBL_MAP_CREATURE.json` |
| Client constant | `GamePredef.TBL_MAP_CREATURE = 34` |

## Purpose

Defines the creature-encounter roster for open-world map tiles. Each row binds a creature template (`cid`) to a map (`mid`) with level, XP tuning, probability range, boss tier, battle mode, and weather/cloud flags. The primary index key is `mid` (`TBL_INDEX_ARRAY[TBL_MAP_CREATURE] = "mid"`, `GamePredef.as:8350`). The Flash client reads this table to display the map tooltip creature list and to cross-reference which maps a creature appears on.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key of this creature-spawn row. |
| `mid` | int | Foreign key → [[TBL_MAP]].`id`. The map where this creature spawns. Primary index key. |
| `cid` | int | Foreign key → TBL_CREATURE.`id`. The creature template. Read by `TipMap.as:329/338` and `TipCre.as:2304`. |
| `level` | int | Forced level override for this creature on this map. |
| `qLevel` | int | Quality/difficulty tier used for encounter label. Values `1`–`5` observed (vs. only 0/3 in TBL_NPC_CREATURE). Maps to `GamePredef.CREATURE_QLEVEL`; indices 1–3 have labels "Sơ cấp", "Trung cấp", "Cao cấp". |
| `bossFlag` | int | Spawn tier. `0` = normal field creature (1137), `1` = rare elite (2), `2` = field/world boss (53). `TipMap.as:323` filters `bossFlag == 0` when building the tooltip monster list. |
| `uniqueFlag` | int | `1` = singleton spawn (28 records); `0` = multiple instances allowed (1164 records). (inferred from data — no direct client read found) |
| `battleMode` | int | Combat initiation mode. `1` = standard random encounter on tile entry (1125 records); `2` = special/scripted battle mode (67 records, appears alongside `bossFlag >= 1` for boss zones). |
| `withCloud` | int | Cloud/weather condition gate. `−1` = no condition (1150 records); `1` = only spawns during cloud/storm weather events (42 records). (inferred from data — no direct client read found) |
| `exp` | int | XP override. `−1` = use formula (most records); positive integers = absolute XP for killing this creature on this map. |
| `expMulti` | float | XP multiplier applied to base XP before any `exp` override. `"1.00"` default. |
| `expSet` | int | XP calculation mode. `0` = standard (1159), `1` = use absolute `exp` value (21), `2` = alternate formula (12). |
| `startRate` | float | Lower bound (inclusive) of the probability range (0.00–100.00). Floating-point percentage. |
| `endRate` | float | Upper bound (exclusive) of the probability range. Multiple rows per `mid` partition the 0–100 range to create weighted encounter tables. Example: startRate=0.00/endRate=50.00 and startRate=50.00/endRate=100.00 gives a 50/50 split. |

## Value distributions / sentinels

- `bossFlag`: 0×1137, 1×2, 2×53.
- `battleMode`: 1×1125, 2×67.
- `withCloud`: −1×1150, 1×42.
- `uniqueFlag`: 0×1164, 1×28.
- `expSet`: 0×1159, 1×21, 2×12.
- `qLevel`: 1×220, 2×219, 3×357, 4×219, 5×177 (full 1–5 range, unlike TBL_NPC_CREATURE which only uses 0 and 3).

## Client usage

- `TipMap.as:321–338` — iterates `GameData.d[34]`, filters entries where `.mid == mapId` and `.bossFlag == 0`, deduplicates by `cid`, builds the tooltip creature list for the map info panel. The `bossFlag == 0` check confirms the client only shows normal field monsters in the tooltip, not bosses.
- `TipCre.as:2302–2308` — iterates all `TBL_MAP_CREATURE` entries, collects `.mid` values where `.cid == creature.id`, builds a pipe-delimited map-location string for the creature info tooltip ("Found in: MapA | MapB").
- `TBL_INDEX_ARRAY[TBL_MAP_CREATURE] = "mid"` (`GamePredef.as:8350`) — the client buckets all rows by `mid` for fast map-based lookups.

## Related tables

- `mid` → [[TBL_MAP]].`id` (the map this entry belongs to)
- `cid` → TBL_CREATURE.`id` (creature template)
- Parallel structure to [[TBL_NPC_CREATURE]] (which is NPC-scoped rather than map-scoped)
