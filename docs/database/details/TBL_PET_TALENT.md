# TBL_PET_TALENT

| Property | Value |
|---|---|
| Table ID | 101 |
| Record count | 1024 |
| JSON | `docs/database/game_data/TBL_PET_TALENT.json` |
| Client constant | `GamePredef.TBL_PET_TALENT = 101` |

## Purpose

Defines the Pet Talent tree: every talent node at every upgrade level (Lv 0–5). Records are grouped by a base-talent `basicTid` (the tree branch) and a `sid` composite key (`pi * 10000 + slotIndex`) that addresses a specific slot in the panel grid. The client reads this table to render the `PetTalentPanel` and `PetTalentFuncPanel` UI, check upgrade prerequisites (`rlv`, `upExp`), and compute total talent power (`p`).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Accessed as `gameData[GamePredef.TBL_PET_TALENT][id]` (`TalentSlot.as:111–112`, `PetTalentFuncPanel.as:1440,2106`). |
| `basicTid` | int | Groups all level-variants of one talent branch. Used as the primary index key (`TBL_INDEX_ARRAY[101] = "basicTid"`, `GamePredef.as:8395`). Iterated in `TipTalent.as:639` to find the next-level record. |
| `sid` | int | Composite slot address: `pi * 10000 + slotIndex` (where `pi` = talent-page index). Used as the secondary index (`TBL_INDEX_ARRAY2[101] = "sid"`, `GamePredef.as:8478`). Panel assigns `this["i" + n].sid = pi*10000 + n` then looks up `gameData[101][talData[sid]]` (`PetTalentFuncPanel.as:1165,1440,2106`). |
| `name` | string | Vietnamese talent display name (e.g. `"Sinh Mệnh Chúc PhúcⅠ"`). Rendered in `TipTalent.as:610` with colour from `sid/10000` (page index maps to colour). |
| `desc` | string | Effect description string. Shown in `TipTalent.as:627,643`. |
| `iconCode` | int | 13-digit icon asset code; loaded in `TipTalent.as:622` as `ResManager.getIconUrl(iconCode)`. |
| `lv` | int | Talent level (0–5). `lv == 5` means fully maxed (`TipTalent.as:632`). Used to locate the next-level record: `next.lv == current.lv + 1` (`TipTalent.as:641`). Also drives icon sprite: `ResManager.getIconUrl(4130220000338 + lv)` (`PetTalentFuncPanel.as:1456`). |
| `rlv` | int | Required player level to activate this talent level. Shown in `TipTalent.as:644`; colour-coded red if `rlv > player.level` (`TipTalent.as:645`). |
| `upExp` | int | PvE-point cost to upgrade to this level. Shown as required cost in `TipTalent.as:650` and `PetTalentFuncPanel.as:858,870,929`. Gold equivalent computed as `ceil(upExp * goldPoint)`. |
| `exp` | int | Bonus XP granted by this talent node (can be `0`; conditional display `TipTalent.as:613`). |
| `propType` | int | Stat type modified by this talent. Read in `PetTalentFuncPanel.as:2417` to aggregate total power for a given stat type. |
| `propVal` | int | Stat magnitude. Aggregated in `PetTalentFuncPanel.as:2419`: `totalVal += talent.propVal`. |
| `p` | int | Power contribution of this talent slot. Summed across all active talent slots to compute `_totalPowerL` (`PetTalentFuncPanel.as:1034`). |
| `preflag` | bool(0/1) | When `1`, marks this talent as a "prefix" talent that counts toward a special bonus (`PetTalentFuncPanel.as:2420`). `0` × 864, `1` × 160. |

## Value distributions / sentinels

- `lv`: `0` × 44 (base/unlearned entries), `1–5` × 196 each (upgrade levels across all branches).
- `preflag`: `0` × 864, `1` × 160.
- `p`: `0` × 264 (most base-level or utility talents); non-zero values vary widely (`1`, `10`, `12`, `120`, etc.).

## Client usage

- `TipTalent.as:610–657` — renders name, desc, lv, rlv, upExp, iconCode, and chains to next-level record via `basicTid` index.
- `PetTalentFuncPanel.as:858,865,870,904,929,948,953,1034` — reads `upExp`, `lv`, `p` for upgrade cost display and power summation.
- `PetTalentFuncPanel.as:1440,1456–1457,2106,2115,2117,2238,2241,2417,2419–2420` — slot-level game logic: reads `lv`, `propType`, `propVal`, `preflag`.
- `TalentSlot.as:111–112` — resolves talent record by `this.giid` for tooltip/display.
- `TBL_INDEX_ARRAY[101] = "basicTid"`, `TBL_INDEX_ARRAY2[101] = "sid"` (`GamePredef.as:8395,8478`) — dual-index enables both branch-level and slot-level look-up.
- `LinkEventUtil.as:163–164` — hyperlink dispatch routing for `TBL_PET_TALENT` chat links.

## Related tables

- `sid / 10000` gives the talent page index (pi), which maps to a colour via `GamePredef.MSG_ITEM_COLOR[pi]`.
- `basicTid` groups the level chain; next-level record found by iterating `gameDataIndex[101][basicTid]` for `record.lv == currentLv + 1`.
- Upgrade items resolved via `TBL_ITEM_TEMPLATE` using `TAL_UP_PLAN_ITEM[lv]` constant array (`PetTalentFuncPanel.as:2653`).
