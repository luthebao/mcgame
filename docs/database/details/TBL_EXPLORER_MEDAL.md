# TBL_EXPLORER_MEDAL

| Property | Value |
|---|---|
| Table ID | 137 |
| Record count | 100 |
| JSON | `docs/database/game_data/TBL_EXPLORER_MEDAL.json` |
| Client constant | `GamePredef.TBL_EXPLORER_MEDAL = 137` |

## Purpose

Defines the 100 level tiers of the Explorer Medal system ("Huy Chương Khám Phá / Huy Chương Nhà Thám Hiểm"). Each row represents one medal level, specifying the upgrade costs (silver coin and gold coin variants), the display name for that level, and up to 8 stat bonuses expressed as `(propType, propNum)` pairs. The `ExplorerMedalPanel` displays current and next-level stats side-by-side and allows upgrade via silver or gold.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key (1–100). Corresponds to the medal level. Accessed via `GameData.d[137][id]` (`ExplorerMedalPanel.as:2246`). |
| `name` | string | Vietnamese level name (e.g., `"Người Mới Học Lv.1"`). Displayed in `ExplorerMedalPanel.as:2126` via `currentLevelTitle.text = Language.EXPLORER_MEDAL_PANEL[7].replace("{medal}", name)` and in `nextLevelTitle`. |
| `cost` | int | Silver coin upgrade cost. Shown in `ExplorerMedalPanel.as:2131` via `nextLevelCost.text = Language.EXPLORER_MEDAL_PANEL[6].replace("{num}", currentScore + "/" + cost)`. `_nextLevelCost` is stored as the trigger for silver upgrade. |
| `costGold` | int | Gold coin upgrade cost (alternative to silver). All 100 records in this dataset have `costGold == cost` (e.g., `975` for level 1). `(inferred from data — costGold appears to mirror cost in this export)` |
| `propType1` | int | Stat type ID for bonus slot 1. Looked up in `Language.EXPLORER_MEDAL_PROP[propType]` for display (`ExplorerMedalPanel.as:2140`). `0` = slot unused. |
| `propNum1` | float | Stat value for bonus slot 1. Displayed as `Language.EXPLORER_MEDAL_PROP[propType1] + propNum1`. |
| `propType2` | int | Stat type ID for bonus slot 2. |
| `propNum2` | float | Stat value for bonus slot 2. |
| `propType3` | int | Stat type ID for bonus slot 3. |
| `propNum3` | float | Stat value for bonus slot 3. |
| `propType4` | int | Stat type ID for bonus slot 4. |
| `propNum4` | float | Stat value for bonus slot 4. |
| `propType5` | int | Stat type ID for bonus slot 5. |
| `propNum5` | float | Stat value for bonus slot 5. |
| `propType6` | int | Stat type ID for bonus slot 6. |
| `propNum6` | float | Stat value for bonus slot 6. |
| `propType7` | int | Stat type ID for bonus slot 7. `0` for many levels (unused slot). |
| `propNum7` | float | Stat value for bonus slot 7. `0.000` when slot unused. |
| `propType8` | int | Stat type ID for bonus slot 8. `0` for many levels. |
| `propNum8` | float | Stat value for bonus slot 8. `0.000` when slot unused. |

## Value distributions / sentinels

- `id`: 1–100 (all 100 levels present).
- `cost` / `costGold`: identical values per row; observed range from 975 (lv 1) escalating with level.
- `propType1`–`propType8`: integer stat type IDs; `0` = slot unused. Up to 6 active slots for most levels (propType7 and propType8 are 0 for level 1: 1200 HP, 750 PHY/MAG ATK, 0.135/0.090/0.090 ratios).
- `propNum1`–`propNum8`: float values. Small values (< 1.0) indicate percentage-based stats; large values (≥ 1.0) indicate flat additive stats.

## Client usage

- `ExplorerMedalPanel.as:2246` — `GameData.d[GamePredef.TBL_EXPLORER_MEDAL][levelId]` to retrieve current medal level data.
- `ExplorerMedalPanel.as:2254, 2263–2264` — loads current and next level medal records for side-by-side comparison.
- `ExplorerMedalPanel.as:2120–2143` (`setPropColumns`) — reads `name`, `cost`; iterates `propType1..8` and `propNum1..8` via `_arg_1[("propType" + i)]` / `_arg_1[("propNum" + i)]` to populate `EMPropLbl1_1..8` and `EMPropLbl2_1..8` label elements.
- `ExplorerMedalPanel.as:2126, 2130–2131` — `name` shown in level title; `cost` shown in upgrade cost label.
- `ExplorerMedalPanel.as:1049` — `levelUpEMedal()` fires silver upgrade RPC (button 1).
- `ExplorerMedalPanel.as:2156–2159` — `levelUpEMedalByGold(0/1)` fires gold upgrade RPC (buttons 2/3).
- `ExplorerMedalPanel.as:1515–1516` — `costGold` shown in gold-upgrade confirmation prompt string.
- Panel opened from `ActivityCanvas.as:876` as `ViewManager.PANEL_EXPLORER_MEDAL`.

## Related tables

- `propType1..8` values → `GamePredef.EQUIPT_PROP_NAME` / `Language.EXPLORER_MEDAL_PROP` stat name lookup.
- Explorer medal instance progress is runtime/server-side (not in this static export).
