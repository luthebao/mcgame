# TBL_PET_CONTRACT

| Property | Value |
|---|---|
| Table ID | 117 |
| Record count | 50 |
| JSON | `docs/database/game_data/TBL_PET_CONTRACT.json` |
| Client constant | `GamePredef.TBL_PET_CONTRACT = 117` |

## Purpose

Defines the Pet Contract (Khế Ước Thú) upgrade ladder. Each record is one contract level and carries four stat-bonus entries (`prop1–4`, `propNum1–4`, `extraNum1–4`), an XP cost (`reqExp`) to reach this level, and a currency item requirement count (`reqNum`). The client uses `GameData.d[117][level]` to look up the current and next contract tier for display and upgrade validation.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key and contract level index. Looked up directly as `GameData.d[117][level]` in `BigContractCircle.as:84,96` and `PetEvolutionPanel.as:2221,4682,4700`. |
| `reqExp` | int | XP required to advance to this contract level. Read as `contractMeta.reqExp` in `BigContractCircle.as:87,97` to build the progress bar denominator. |
| `reqNum` | int | Number of currency items required to unlock. Displayed as `Language.PET_EVOLUTION_PANEL_U[53] + _local_9.reqNum` (`PetEvolutionPanel.as:4702`). Values: `1`–`5` in increments of 10 records each. |
| `prop1` | int | Stat type index for the first bonus slot. Always `1` (HP) across all 50 records. Accessed dynamically as `row["prop" + i]` in `PetEvolutionPanel.as:2236`. |
| `prop2` | int | Stat type index for the second bonus slot. Always `11` across all 50 records. |
| `prop3` | int | Stat type index for the third bonus slot. Always `4` across all 50 records. |
| `prop4` | int | Stat type index for the fourth bonus slot. Always `5` across all 50 records. |
| `propNum1` | float | Base percentage multiplier for the `prop1` stat at this level. Accessed as `row["propNum" + i]` (`PetEvolutionPanel.as:2237`). Applied to player stats as a percentage bonus. |
| `propNum2` | float | Base percentage multiplier for the `prop2` stat. |
| `propNum3` | float | Base percentage multiplier for the `prop3` stat. |
| `propNum4` | float | Base percentage multiplier for the `prop4` stat. |
| `extraNum1` | float | Extra multiplier for `prop1` applied when player `classId == 5` (special class). Added on top of `propNum1`: `total = propNum + extraNum` (`PetEvolutionPanel.as:2241`). |
| `extraNum2` | float | Extra multiplier for `prop2` for class 5 players. |
| `extraNum3` | float | Extra multiplier for `prop3` for class 5 players. |
| `extraNum4` | float | Extra multiplier for `prop4` for class 5 players. |

## Value distributions / sentinels

- `prop1` / `prop2` / `prop3` / `prop4`: uniform across all 50 records — `1`, `11`, `4`, `5` respectively.
- `reqNum`: `1` × 10, `2` × 10, `3` × 10, `4` × 10, `5` × 10 — five tiers of 10 levels each.
- `propNum1` range: `0.27` (level 1) scaling linearly upward to ~`13.5+` at level 50 (inferred from data progression).
- `extraNum1` always ≈ `propNum1 / 2` — the class-5 bonus is roughly half the base.
- `GamePredef.MAX_CONTRACT_LEVEL` caps the maximum level the client will look up.

## Client usage

- `BigContractCircle.as:84,87,96–97` — reads `reqExp` to render the circular XP progress arc. Falls back to `MAX_CONTRACT_LEVEL` entry when `nextLvl` has no record.
- `PetEvolutionPanel.as:2221,2236–2241` — iterates `CONTRACT_DICT` (4 props), reads `prop[i]`, `propNum[i]`, `extraNum[i]`; applies class-5 bonus and formats stat display.
- `PetEvolutionPanel.as:4682,4687,4700,4702,4707` — reads `extraNum[selectType]` and `reqNum` for upgrade confirmation UI.
- `GamePredef.CONTRACT_DICT` maps a selection index to a property-string name used to key into `player.contractPet` runtime data.

## Related tables

- Contract stat types `prop1–4` (values `1`, `11`, `4`, `5`) map to the shared stat enum used across [[TBL_BUFF]], [[TBL_PET_SOUL]], and equipment sublimation tables.
- `reqNum` references a currency item from [[TBL_ITEM_TEMPLATE]] (exact item ID is a client constant, not embedded in this table).
