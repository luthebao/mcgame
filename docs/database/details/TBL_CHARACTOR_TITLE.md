# TBL_CHARACTOR_TITLE

| Property | Value |
|---|---|
| Table ID | 10 |
| Record count | 0 (runtime/instance table) |
| JSON | `docs/database/game_data/TBL_CHARACTOR_TITLE.json` |
| Client constant | `GamePredef.TBL_CHARACTOR_TITLE = 10` |

## Purpose

Tracks which title records from [[TBL_TITLE]] a specific character has earned or unlocked. This is a runtime ownership table — one row per (character, title) pair. No static rows exist in the JSON export. Indexed by `cid` (`TBL_INDEX_ARRAY[TBL_CHARACTOR_TITLE] = "cid"` — `GamePredef.as:8326`).

Classification: **runtime / character-scoped title ownership table**.

## Key reference

Empty export; no static rows. Client constant present.

No field-level reads of `GameData.d[GamePredef.TBL_CHARACTOR_TITLE]` or direct `.as` code referencing this constant by name outside `GamePredef.as` were found in the exported files. Based on the `cid`-keyed index pattern shared with all other `TBL_CHARACTOR_*` tables, the expected shape is:

| Key | Type | Function |
|---|---|---|
| `id` | int | Record primary key. |
| `cid` | int | Character ID (index key). → [[TBL_CHARACTOR]]. |
| `tid` | int | Title template ID → [[TBL_TITLE]]. (inferred from naming convention — no client read confirmed.) |

The character's currently equipped title is stored directly on the player object as `player.t` (title ID from [[TBL_TITLE]]), not in this table. This table likely stores the full set of unlocked titles delivered on login and managed through `TitleSelectPanel.as`.

## Client usage

- `GamePredef.as:503` — `TBL_CHARACTOR_TITLE = 10`.
- `GamePredef.as:8326` — `TBL_INDEX_ARRAY[TBL_CHARACTOR_TITLE] = "cid"`.

No direct `GameData.d[TBL_CHARACTOR_TITLE]` reads found in UI or logic files. Title ownership list is consumed through `TitleSelectPanel.as` and `Core.as` using the TBL_TITLE data, with the active title tracked as `player.t`.

## Related tables

- `cid` → [[TBL_CHARACTOR]].
- `tid` → [[TBL_TITLE]].
