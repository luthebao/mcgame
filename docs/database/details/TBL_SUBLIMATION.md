# TBL_SUBLIMATION

| Property | Value |
|---|---|
| Table ID | 108 |
| Record count | 50 |
| JSON | `docs/database/game_data/TBL_SUBLIMATION.json` |
| Client constant | `GamePredef.TBL_SUBLIMATION = 108` |

## Purpose

Defines the Sublimation (Thăng Hoa) upgrade tiers for player equipment (non-pet gear, quality ≥ Trác Việt Orange, level ≥ 50). Each record is one sublimation level, providing four stat bonuses in two pairs (`prop1`/`propNum1` through `prop4`/`propNum4`), an elemental resistance percentage (`elementNum`), a success rate (`rate`), and material cost (`itemNum1`, `itemNum2`). The client selects the correct prop pair based on equipment type (attack vs. defence).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key and sublimation level. Looked up as `GameData.d[108][sublimeId]` in `EquipFunc.as:7943,10533,10568`. |
| `prop1` | int | Stat type for the first bonus (attack-type equipment uses props 1–2). Accessed dynamically as `row["prop" + n]` where `n` starts at `1` or `3` based on `EQUIP_TYPE` (`EquiptFuncPanel.as` — see below). |
| `prop2` | int | Stat type for the second bonus. |
| `prop3` | int | Stat type for the third bonus (defence-type equipment uses props 3–4). |
| `prop4` | int | Stat type for the fourth bonus. |
| `propNum1` | float | Magnitude for `prop1`. Read as `row["propNum" + n]` and displayed in the sublimation tooltip (`EquiptFuncPanel.as:13142,13177`). |
| `propNum2` | float | Magnitude for `prop2`. |
| `propNum3` | float | Magnitude for `prop3`. |
| `propNum4` | float | Magnitude for `prop4`. |
| `elementNum` | float | Elemental resistance ratio (0–1 range). Displayed as `(elementNum * 100).toFixed(2) + "%"` in `EquipFunc.as:7948,10538,10573`. |
| `rate` | int | Base success rate percentage for sublimation at this level. Displayed as `String(rate) + "%"` (`EquiptFuncPanel.as:13207`). May be overridden by `GamePredef.MC_BIRTH_CONFIG[17][id]` for special server configs. |
| `itemNum1` | int | Quantity of the attack-type material required (selected when `EQUIP_TYPE == ATTACK`). Read as `row["itemNum" + equip_class]` (`EquiptFuncPanel.as:13222`). |
| `itemNum2` | int | Quantity of the defence-type material required. |

## Value distributions / sentinels

- 50 records representing 50 sublimation tiers.
- `elementNum`: small float (0.0001–0.0009 range at low levels, growing at higher levels).
- `rate`: percentage value; scales downward at higher levels (harder to succeed).
- `prop1`/`prop2` vs `prop3`/`prop4`: the two pairs serve different equipment categories — attack gear uses the first pair, defence gear uses the second pair.

## Client usage

- `EquipFunc.as:7943–7948` — loads `GameData.d[108][sublimeId]`, reads `elementNum` for the current sublimation state display.
- `EquipFunc.as:10533–10538,10568–10573` — same pattern for preview of current and next level.
- `TipEquip.as:3044` — selects `TBL_SUBLIMATION` vs `TBL_SUBLIMATION_PET` based on equipment `kind != 9`.
- `EquiptFuncPanel.as:13137,13142,13172,13177,13207,13219,13222` — reads `prop[n]`, `propNum[n]` (pair selected by attack vs defence type), `elementNum`, `rate`, and `itemNum[n]` for the sublimation upgrade UI.
- Language strings: `Language.EQUIPTFUNCPANEL_S[161]` and `EQUIPTFUNCPANEL_U[247,251,252,267]` use `{rate}`, `{num}`, `{element}`, `{propName}`, `{propNum}` placeholders populated from this table.

## Related tables

- `prop1–4` stat type integers map to `GamePredef.EQUIPT_PROP_NAME` array (shared stat enum).
- `itemNum1`/`itemNum2` reference item quantities consumed from the player's inventory (item template IDs are client constants, not embedded here).
- [[TBL_SUBLIMATION_PET]] — parallel table for pet equipment sublimation; identical schema, different data.
