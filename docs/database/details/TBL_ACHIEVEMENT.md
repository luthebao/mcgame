# TBL_ACHIEVEMENT

| Property | Value |
|---|---|
| Table ID | 74 |
| Record count | 604 |
| JSON | `docs/database/game_data/TBL_ACHIEVEMENT.json` |
| Client constant | `GamePredef.TBL_ACHIEVEMENT = 74` |

## Purpose

Defines every achievement (danh hiệu / thành tích) available in the game: its category, display attributes, award value, and enabled state. The client builds two secondary indexes: `TBL_INDEX_ARRAY[74] = "kind"` (bucket by category) and `TBL_INDEX_ARRAY2[74] = "type"` (bucket by sub-type), enabling the Achievement Panel to render tabbed lists and sort achievements into groups. Achievements are also exposed as link-able objects via `LinkEncode.encode(GamePredef.TBL_ACHIEVEMENT, id, ...)`.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up as `GameData.d[74][id]`. Also used in `LinkEncode` for chat links. |
| `name` | string | Vietnamese display name shown in the achievement panel title and tooltip (`AchievementPanel.as:1025`, `TipAchieve.as:237`). |
| `description` | string | Achievement description text. Shown in tooltip (`TipAchieve.as:195`, `AchievementPanel.as:1028`) and recent-detail panel. |
| `detail` | string | Extended detail text (longer than `description`). Shown in `AchievementDetail.as:956` as `txtareaAchieveDetail.text`. |
| `desc` | string | Short tooltip appended to the award button hover (`AchievementDetail.as:969`, `AchievementDetail.as:1189`). |
| `award` | string | Achievement point/reward value shown as label on the award button (`AchievementPanel.as:1029`, `TipAchieve.as:212/239`). |
| `color` | int | Color tier for the achievement name display. Passed to `GamePredef.MSG_ITEM_COLOR[color]` to produce an HTML color string (`AchievementPanel.as:1025`, `TipAchieve.as:237`). Values 0–4. |
| `kind` | int | Category group (1–6). Used as the primary index key (`TBL_INDEX_ARRAY[74]`). `AchievementPanel.as:658/734/915` counts achievements per kind to display per-tab totals. |
| `type` | int | Sub-type code (e.g. `101`–`607`). High byte encodes the `kind` group; low byte encodes the sub-category. Used as secondary index (`TBL_INDEX_ARRAY2[74]`). `AchievementPanel.as:927/1576` queries by type when `kind <= 0`. |
| `enable` | bool(0/1) | `1` = achievement is active and counts toward totals (`AchievementPanel.as:731`, `1152`, `1164`). `-1` = disabled/hidden (38 records). |
| `isAward` | int | Award-button state: `0` = not yet awarded, `1` = can claim, `>0` = already claimed. Drives button visibility in `AchievementDetail.as:966/970/1186/1190/1264`. |
| `check` | int | Server-side prerequisite check ID. `-1` = none. `(inferred from data — no client usage found)` |
| `position` | int | Display sort position within its category group. `(inferred from data — no client usage found; values range 1000–9000 in data)` |
| `repeatType` | int | Always `0` in this export. Likely whether the achievement can repeat. `(inferred from data — no client usage found)` |

## Value distributions / sentinels

- `enable`: `1`×566 (active), `-1`×38 (disabled).
- `color`: `0`×80, `1`×109, `2`×146, `3`×158, `4`×111.
- `kind`: `1`×175, `2`×78, `3`×60, `4`×52, `5`×205, `6`×34.
- `type`: 37 distinct sub-type codes; `105` is the most common (91 records), then `503` (55), `505` (41).
- `repeatType`: all 604 = `0`.

## Client usage

- `AchievementPanel.as:658/731/734/915/923/927/1025/1028/1029/1149/1152/1161/1164/1385/1570/1576` — primary rendering panel: reads `kind`, `enable`, `color`, `name`, `description`, `award`. Uses `gameDataIndex` (by `kind`) and `gameDataIndex2` (by `type`).
- `AchievementComparePanel.as:1321/1332/1876` — achievement comparison panel; same field access pattern.
- `AchievementDetail.as:953/956/966/969/970/1186/1189/1190/1264` — detail view; reads `detail`, `desc`, `isAward`.
- `TipAchieve.as:195/212/237/238/239/308/310` — hover tooltip; reads `description`, `award`, `color`, `name`.
- `LinkEventUtil.as:142/143` — hyperlink decode: maps `L_ACH` prefix to `TBL_ACHIEVEMENT`.
- `ToolTipUtil.as:93/275` — tooltip dispatch switch case for `TBL_ACHIEVEMENT`.
- `TextUtil.as:107` — chat text link rendering for achievement links.

## Related tables

- `aid` → [[TBL_ACHIEVEMENT_REQUIRE]] (each achievement has one or more completion requirements).
