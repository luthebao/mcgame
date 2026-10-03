# TBL_GUILD_MAP

| Property | Value |
|---|---|
| Table ID | 24 |
| Record count | 0 (empty export) |
| JSON | `docs/database/game_data/TBL_GUILD_MAP.json` |
| Client constant | `GamePredef.TBL_GUILD_MAP = 24` |

## Purpose

Runtime/instance table mapping guild IDs to map state — likely tracks which map instances a guild controls, has accessed, or is currently occupying (e.g., guild territory, guild dungeon instances). Empty in the static export because data is live/server-populated. No static rows exist in the game-data dump.

## Classification

Runtime / guild-scoped instance data. Populated server-side per active guild.

## Client usage

- `GamePredef.as:8340` — `TBL_INDEX_ARRAY[TBL_GUILD_MAP] = "gid"`. Registers `gid` (guild ID) as the secondary index key; client would access entries as `gameDataIndex[24][gid]`.
- `GamePredef.as:8428` — `TBL_INDEX_ARRAY2[TBL_GUILD_MAP] = null` (no tertiary index configured).
- `GamePredef.as:8503` — `TBL_INDEX_ARRAY3[TBL_GUILD_MAP] = null`.
- No field-level reads of `GameData.d[24]` were found in UI or logic `.as` files beyond the index configuration. The table is consumed server-side.

## Fields confirmed from .as usage

| Field | Type (inferred) | Semantic |
|---|---|---|
| `gid` | int | Guild ID — used as the secondary index key. |

No additional field names were recoverable from static analysis. The table schema is entirely server-controlled.

## Related tables

- `gid` → guild table (guild entity).
- Conceptually links guilds to [[TBL_MAP]] entries (territory or instance maps controlled by each guild), but no explicit FK field was confirmed from `.as`.
