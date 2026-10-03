# TBL_SOUL

| Property | Value |
|---|---|
| Table ID | 116 |
| Record count | 100 |
| JSON | `docs/database/game_data/TBL_SOUL.json` |
| Client constant | `GamePredef.TBL_SOUL = 116` |

## Purpose

Defines the 100-level Soul Awakening (Linh Hồn Thức Tỉnh) progression table used in pet soul cultivation. Each record maps a soul level to its `requireNum` (accumulated soul points needed to reach that level) and a fixed set of 10 stat bonuses (`prop1`–`prop10` type codes with `propNum1`–`propNum10` values). The client uses this table to display current and next-level stat previews in `TrainSoulPanel`.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key = soul level (1–100). Looked up as `GameData.d[116][level]`. `MAX_SOUL_LVL = 100` in `TrainSoulPanel.as:68`. |
| `requireNum` | int | Cumulative soul points required to reach this level. Read at `TrainSoulPanel.as:476,483`. The values scale from 1,550,000 at level 1 to higher values at level 100. |
| `prop1`–`prop10` | int | Stat type codes for bonus slots 1–10. Maps to `AWAKEN_PROP_DICT` keys (e.g., 1=HP, 11=Speed, 31=Critical, etc.). Read at `TrainSoulPanel.as:564,593`. |
| `propNum1`–`propNum10` | int or float | Bonus magnitudes paired with `prop1`–`prop10`. Integer stats (e.g., HP, ATK) are whole numbers; percentage/rate stats (e.g., types 8,9,13,14,31) appear as floating-point (e.g., `0.05`, `0.09`). Read at `TrainSoulPanel.as:565,594`. Displayed with `AWAKEN_PROP_DICT` label at `TrainSoulPanel.as:568,572`. |

## Value distributions / sentinels

- `id`: 1–100, one per level (no gaps).
- `requireNum`: monotonically increases from 1,550,000 (level 1) in steps of 50,000 per level.
- `prop1`–`prop10`: identical type codes across all 100 records (1, 11, 4, 5, 6, 7, 8, 9, 13, 31). The stat types are fixed; only `propNum*` values scale.
- `propNum*` values: scale linearly with level. Float types (propNum7–propNum10 in sample) have fractional values; integer types (propNum1–propNum6) are whole numbers.

## Client usage

- `TrainSoulPanel.as:68` — `MAX_SOUL_LVL = 100` caps the table lookup.
- `TrainSoulPanel.as:473–483` — checks if player is at max level; reads `requireNum` of current and next level.
- `TrainSoulPanel.as:560–576` — "left panel" (current level): reads `prop1`–`prop10` and `propNum1`–`propNum10` to build two-column stat display; odd-indexed props go left, even go right.
- `TrainSoulPanel.as:589–604` — "right panel" (next level): same read pattern on `level+1` record.
- `TrainSoulPanel.as:667` — checks `trainSoulLvl >= MAX_SOUL_LVL` to disable the train button.

## Related tables

- Stat types (`prop*`) correspond to `AWAKEN_PROP_DICT` keys defined in `GamePredef.as:7019`.
- Player soul bag data is a runtime instance (not from this table): `player.soulBagData["data"]` keyed by slot index.
- `player.soulTempBag` and `soulInfo` are populated via `CallBack.as:372,769–782`.
