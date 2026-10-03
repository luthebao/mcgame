# TBL_PRS_TREE

| Property | Value |
|---|---|
| Table ID | 125 |
| Record count | 50 |
| JSON | `docs/database/game_data/TBL_PRS_TREE.json` |
| Client constant | `GamePredef.TBL_PRS_TREE = 125` |

## Purpose

Defines the talent/skill tree progression levels for the PRS (Presence/Spirit) system. Each record represents one step in a linear chain of 50 levels. Each node grants up to 8 stat bonuses; the client accumulates all bonuses up to and including the player's current tree level.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Tree levels run 1–50; looked up as `GameData.d[125][id]`. |
| `level` | int | Ordinal position in the tree (1–50, one-per-record). Used in `PRSPanel.as:2164` to filter which nodes to include in cumulative stat totals. |
| `nextId` | int | ID of the next node in the chain (id+1 for most; `0` on the terminal level 50 node). |
| `costStone` | int | Number of spirit-stones required to unlock this tree level. Read in `PRSPanel.as:2262` and displayed on the upgrade button. |
| `pT1`–`pT8` | int | Stat-type enum for bonus slots 1–8. Matches `AWAKEN_PROP_DICT` keys (e.g., 1=HP, 4=Physical ATK, 11=Speed). `0` = slot unused. |
| `pN1`–`pN8` | int | Bonus magnitude paired with the corresponding `pT` slot. Displayed differently per type: raw value for types 1,4,5,6,7,11; divided by 100 for percentage types 59,60,62,63; divided by 100 with `%` suffix for types 34 etc. Logic at `PRSTreeButton.as:49–63` and `PRSPanel.as:2170–2173`. |

## Value distributions / sentinels

- `level`: exactly 50 unique values (1–50), one per record.
- `nextId`: 49 records chain to the next level; the level-50 record has `nextId=0`.
- `pT*` / `pN*`: 8 bonus slots. In the sample record (level 2), active types are 1, 4, 5, 6, 7, 11, 13, 31 — a full set of 8 non-zero types.

## Client usage

- `PRSTreeButton.as:35–63` — renders a single tree-node button; reads `pT`/`pN` pairs to build the tooltip text.
- `PRSPanel.as:2160–2177` — iterates all tree records with `level <= currentLevel` and sums each `pN` by `pT` into `PRS_TREE_TYPE_PROP` for the cumulative stat display.
- `PRSPanel.as:2261–2265` — reads `costStone` and `level` for the upgrade cost/UI tier (sets image via `Math.ceil((level+1)/10)` block index).
- `Core.as:2090` — `TBL_PRS_TREE` is in the template-type dispatch switch (tooltip lookup uses the live VO rather than fetching a separate template).

## Related tables

- `nextId` chains within [[TBL_PRS_TREE]] itself (singly-linked level list).
- Stat types (`pT*`) correspond to `AWAKEN_PROP_DICT` keys defined in `GamePredef.as:7019`.
- `TBL_PRS_SHOW` (id=126) — the show-panel bonuses are complementary; both are summed for the total PRS character buff.
