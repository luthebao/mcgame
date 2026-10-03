# TBL_CHARACTOR_BUFF

| Property | Value |
|---|---|
| Table ID | 3 |
| Record count | 0 (empty — runtime/instance table) |
| JSON | `docs/database/game_data/TBL_CHARACTOR_BUFF.json` |
| Client constant | `GamePredef.TBL_CHARACTOR_BUFF = 3` |

## Purpose

A character-scoped runtime table that tracks which buff instances are currently active on a character. No static rows exist in the client data export — all population happens at runtime from server state. The table is indexed by `cid` (character ID) in the client's `TBL_INDEX_ARRAY`, meaning the client builds a lookup `GameData.d[3][cid]` mapping each character's active buffs.

## Classification

Runtime / instance table (character-scoped). The JSON export is empty because rows are populated dynamically during gameplay from server callbacks, not from static game-data definitions. Buff templates come from [[TBL_BUFF]] (table ID 66); this table stores only the live per-character application state.

## Client constant

`GamePredef.as:496` — `public static const TBL_CHARACTOR_BUFF:uint = 3;`

Index configuration (`GamePredef.as:8319`):
- `TBL_INDEX_ARRAY[TBL_CHARACTOR_BUFF] = "cid"` — primary index key is character ID.
- `TBL_INDEX_ARRAY2[TBL_CHARACTOR_BUFF] = null` — no secondary index.
- `TBL_INDEX_ARRAY3[TBL_CHARACTOR_BUFF] = null` — no tertiary index.

## Fields confirmed from .as usage

The runtime instances surfaced via `LongBuffCanvas.as` and `TipSkill.as` carry the following fields on each active-buff object (accessed as `vo.*` or `_arg_1.*`):

| Field | Type | Source | Function |
|---|---|---|---|
| `bid` | int | `LongBuffCanvas.as:281/392/508` | Foreign key into [[TBL_BUFF]].id. Used to load the buff template for icon and text. |
| `type` | int | `LongBuffCanvas.as:279/399/521` | Runtime display type: `1` = battle-only (shows time-in-rounds); `2` = show as removable; `3`/`10` = leveled status (shows buff level in tooltip). Distinct from [[TBL_BUFF]].`type`. |
| `id` | int | `LongBuffCanvas.as:669/689` | Instance identifier for this active buff on the character's buff bar. |
| `buff` | int (0/1) | `LongBuffCanvas.as:403/516/689` | Mirrors [[TBL_BUFF]].`buff`; `0` = debuff, `1` = buff. Cached on the instance for quick filtering. |
| `desc` | string | `LongBuffCanvas.as:406` | Optional custom description string (overrides [[TBL_BUFF]].`description` when present). |

The `bid` field is the runtime link back to [[TBL_BUFF]]; the instance object itself stores only the minimal display/UI state. Full buff semantics (prop deltas, codeName, iconCode, etc.) are read from the template table via `_core.data.getGameData(GamePredef.TBL_BUFF, vo.bid)`.

## Client usage

Empty export; no static rows. Client constant `GamePredef.TBL_CHARACTOR_BUFF = 3` is defined and the index is registered (`TBL_INDEX_ARRAY[3] = "cid"`), confirming the table slot is reserved for runtime data pushed from the server.

Field-level usage recovered from `LongBuffCanvas.as` (the primary consumer of character buff instance data): reads `bid`, `type`, `id`, `buff`, and optionally `desc` on buff instance objects delivered via server callbacks.

## Related tables

- `bid` → [[TBL_BUFF]] (the static buff template, table ID 66).
- `cid` index key → character ID, aligns with character tables such as [[TBL_CHARACTOR]].
