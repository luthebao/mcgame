# TBL_CHARACTOR_MAP

| Property | Value |
|---|---|
| Table ID | 5 |
| Record count | 0 (empty export) |
| JSON | `docs/database/game_data/TBL_CHARACTOR_MAP.json` |
| Client constant | `GamePredef.TBL_CHARACTOR_MAP = 5` |

## Purpose

Runtime/instance table mapping character IDs to map state — likely tracks which map instance each character currently occupies or has access to. The table is empty in the static export because it is populated at runtime by the server as characters enter/exit maps. No static rows exist in the game-data dump.

## Classification

Runtime / character-scoped instance data. Populated server-side per active character session.

## Client usage

- `GamePredef.as:8321` — `TBL_INDEX_ARRAY[TBL_CHARACTOR_MAP] = "cid"`. Registers `cid` (character ID) as the secondary index key, meaning the client would look up entries as `gameDataIndex[5][cid]` to find the map record for a given character.
- `GamePredef.as:8409` — `TBL_INDEX_ARRAY2[TBL_CHARACTOR_MAP] = null` (no tertiary index configured).
- `GamePredef.as:8484` — `TBL_INDEX_ARRAY3[TBL_CHARACTOR_MAP] = null`.
- No field-level reads of `GameData.d[5]` were found in UI or logic `.as` files beyond the index configuration. The table appears to be consulted server-side rather than directly queried by client UI.

## Fields confirmed from .as usage

| Field | Type (inferred) | Semantic |
|---|---|---|
| `cid` | int | Character ID — used as the secondary index key (→ [[TBL_CHARACTOR]] implied). |

No additional field names were recoverable from static analysis. The table schema is entirely server-controlled.

## Related tables

- `cid` → character table (TBL_CHARACTOR, the player/character instance).
- Conceptually links characters to [[TBL_MAP]] entries (which map they are in), but no explicit FK field was confirmed from `.as`.
