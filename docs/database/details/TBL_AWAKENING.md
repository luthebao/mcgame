# TBL_AWAKENING

| Property | Value |
|---|---|
| Table ID | 113 |
| Record count | 77 |
| JSON | `docs/database/game_data/TBL_AWAKENING.json` |
| Client constant | `GamePredef.TBL_AWAKENING = 113` |

## Purpose

Defines the 77 awakening (thức tỉnh) levels a character can progress through after reaching level 80. Each row describes the cost to advance to that level (gold, consumable item count), the minimum character level required, the success probability, the stat bonuses unlocked at that level (up to two attribute/value pairs), and how many awakening skill-points the player accumulates. The client uses this table to drive `AwakenPanel`, the character-awakening UI.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key and awakening level number (1–77). Looked up as `GameData.d[113][awakenLevel + 1]` in `AwakenPanel.as:637/810/1486`. `GamePredef.AWAKEN_EDGE = 77` is the cap sentinel. |
| `name` | string | Display name for this awakening level, e.g., "Thính Giác (Chưa K.Hoạt 1)". Rendered via `Language.AWAKEN_PANEL[5]` template in `AwakenPanel.as:668`. |
| `reqLevel` | int | Minimum character level required to attempt this awakening. Checked against `_core.player.level`; displayed in red if unmet (`AwakenPanel.as:638/671`). Values: 80 (levels 1–10), 100–140+ for higher tiers. |
| `itemNum` | int | Number of awakening consumable items (item ID `GamePredef.AWAKEN_ITEMID = 4913`) required for the attempt. Checked against bag count (`AwakenPanel.as:670–672`). |
| `money` | int | Gold cost in copper units for the awakening attempt. Checked against `_core.player.money` (`AwakenPanel.as:673`). Example: 280000 for level 1. |
| `rate` | int | Base success probability as a percentage (0–100). Displayed as `rate + "%"` in `AwakenPanel.as:821`. The player's `awakenAdd` bonus is added on top; capped at 100. Decreases at higher levels: 100% at level 1, 30% at many mid-levels. |
| `prop1` | int | Primary stat attribute ID boosted by this awakening level. Indexes into `GamePredef.AWAKEN_PROP_DICT` for display name: `1`=HP, `4`=Công VL, `5`=Công MP, `6`=Phòng VL, `7`=Phòng MP, `8`=C.Xác, `9`=N.Tránh, `11`=Tốc, `13`=B.Kích, `14`=XPN, `31`=Kh.Bạo, `34`=Miễn Tử, `62`=Tăng STVL Cuối (%), `63`=Tăng STMP Cuối (%). Read in `AwakenPanel.as:645/650`. |
| `prop2` | int | Secondary stat attribute ID, or `-1` if unused. Same index as `prop1`. Distribution: `-1`×49 (no secondary stat), `5`×14, `63`×14. |
| `propNum1` | float | Delta for `prop1`. Stored as float string (e.g., `"1959.0000"`, `"0.0048"`). For `prop` indices in `GamePredef.AWAKEN_PERCENT_PROP` (`62`, `63`), the value is multiplied by 100 and formatted as `%.2f%` for display (`AwakenPanel.as:652–653`). For all other props, rendered as fixed-point if fractional. |
| `propNum2` | float | Delta for `prop2`. `"0.0000"` when `prop2 = -1`. |
| `points` | int | Number of awakening skill-points the character earns after successfully completing levels up to and including this row. Accumulated by summing `points` from row 1 through the current level in `AwakenPanel.as:1484–1492`. Distribution: `0`×70 (most levels grant 0), `1`×5, `2`×2 — only a few milestone levels grant points. |

## Value distributions / sentinels

- `reqLevel`: clusters at 80 (10 records), 100–140 (11 per tier), up to 200+ at the highest levels.
- `rate`: 100% (1 record, level 1 only), decreasing through 30% (28 records) down to as low as 30% for mid-high levels.
- `prop2`: `-1`×49 (single-stat levels), `5`×14 (adds MP attack), `63`×14 (adds Tăng STMP Cuối).
- `prop1` distribution: `1`×14 (HP), `4`×14 (Phys atk), `11`×14 (Speed), `62`×14 (% phys final), `13`×7 (Crit), `31`×7 (Crit-resist), `34`×7 (Death-immunity).
- `points`: `0`×70, `1`×5, `2`×2.

## Client usage

- `AwakenPanel.as:637/739/810/1486/1590` — `GameData.d[GamePredef.TBL_AWAKENING][id]` used throughout the awakening panel to show the next level's costs, stat bonuses, success rate, and to compute total accumulated `awakenPoint`.
- `AwakenPanel.as:812/821` — reads `rate` and adds `_core.player.awakenAdd` (server-provided bonus rate) for display.
- `AwakenPanel.as:668` — `name` rendered in `Language.AWAKEN_PANEL[5]` template as the title of the next awakening step.
- `AwakenPanel.as:980` — triggers RPC `"awakening"` when the player clicks the awaken button.
- `AwakenPanel.as:1097` — `onAwakening` callback reads `awakenLevel`, `awakenPoint`, `awakenAdd` from server response.
- `CallBack.as:1508/1512` — `updateAwakening(int)` propagates server-pushed awakening level changes to `AwakenPanel`.

## Related tables

- `GamePredef.AWAKEN_ITEMID = 4913` → [[TBL_ITEM_TEMPLATE]] (the awakening consumable item).
- `prop1/prop2` stat indices → `GamePredef.AWAKEN_PROP_DICT` (display names) and `GamePredef.AWAKEN_PERCENT_PROP` (percent-type flags).
- [[TBL_AWAKENING_SKILL]] — the skill-point allocation system unlocked by awakening; skill-points come from milestone `points` rows in this table.
