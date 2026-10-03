# TBL_SUBLIMATION_PET

| Property | Value |
|---|---|
| Table ID | 112 |
| Record count | 50 |
| JSON | `docs/database/game_data/TBL_SUBLIMATION_PET.json` |
| Client constant | `GamePredef.TBL_SUBLIMATION_PET = 112` |

## Purpose

Defines the Sublimation (Thăng Hoa) upgrade tiers for pet equipment (quality Purple and above). This is the pet-gear counterpart to [[TBL_SUBLIMATION]], sharing an identical schema. Each record is one sublimation level for pet gear, providing paired stat bonuses, elemental resistance, success rate, and material costs. The attack/defence split applies the same way: attack pet gear uses props 1–2 (`n` starts at `1`), defence pet gear uses props 3–4 (`n` starts at `3`).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key and sublimation level. Looked up as `GameData.d[112][sublimeId]` in `EquiptFuncPanel.as:10191,13137,13172`. |
| `prop1` | int | Stat type for the first bonus (attack-type pet equipment). Accessed dynamically as `row["prop" + n]`. |
| `prop2` | int | Stat type for the second bonus. |
| `prop3` | int | Stat type for the third bonus (defence-type pet equipment). |
| `prop4` | int | Stat type for the fourth bonus. |
| `propNum1` | float | Magnitude for `prop1`. Read as `row["propNum" + n]` for tooltip and preview. |
| `propNum2` | float | Magnitude for `prop2`. |
| `propNum3` | float | Magnitude for `prop3`. |
| `propNum4` | float | Magnitude for `prop4`. |
| `elementNum` | float | Elemental resistance ratio (0–1). Displayed as `(elementNum * 100).toFixed(2) + "%"` in `EquiptFuncPanel.as:10196,13142,13177`. |
| `rate` | int | Base success rate percentage. Displayed as `String(rate) + "%"` (`EquiptFuncPanel.as:13207,13219`). May be overridden by `MC_BIRTH_CONFIG[17][id]`. |
| `itemNum1` | int | Quantity of attack-type material required. Selected via `row["itemNum" + equip_class]` where `equip_class = 1` for attack. |
| `itemNum2` | int | Quantity of defence-type material required. |

## Value distributions / sentinels

- 50 records (pet gear has the same number of sublimation tiers as player gear).
- `elementNum`: slightly higher base values than [[TBL_SUBLIMATION]] for equivalent levels (e.g. `0.0005` vs `0.0004` at level 1), reflecting the offset stat values in the data.
- `propNum1`/`propNum3` at level 1: `14` and `55` respectively — higher absolute values than player-gear sublimation, scaled for pet stat ranges.
- `rate`: same distribution pattern as [[TBL_SUBLIMATION]]; `100` at level 1 (guaranteed), decreasing at higher tiers.

## Client usage

- `EquiptFuncPanel.as:10191` — loads `GameData.d[112][sublimeId]` for current-state display.
- `EquiptFuncPanel.as:13137,13142` — loads current-level record, reads `elementNum` for elemental display.
- `EquiptFuncPanel.as:13172,13177` — loads next-level record, reads `prop[n]` and `propNum[n]` pairs for preview.
- `EquiptFuncPanel.as:13207,13219,13222` — reads `rate` and `itemNum[n]` for upgrade confirmation UI.
- `TipEquip.as:3044` — routes to `GamePredef.TBL_SUBLIMATION_PET` when equipment `kind == 9` (pet equipment category).
- Language strings `EQUIPTFUNCPANEL_U[251,252,267]` and `EQUIPTFUNCPANEL_S[175,176,178,179]` are shared with the player-gear sublimation flow.

## Related tables

- [[TBL_SUBLIMATION]] — identical schema, used for player (non-pet) equipment.
- `prop1–4` stat type integers map to `GamePredef.EQUIPT_PROP_NAME`.
- `itemNum1`/`itemNum2` reference item quantities from the player inventory (item template IDs are client constants).
