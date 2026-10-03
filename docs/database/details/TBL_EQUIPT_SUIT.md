# TBL_EQUIPT_SUIT

| Property | Value |
|---|---|
| Table ID | 73 |
| Record count | 250 |
| JSON | `docs/database/game_data/TBL_EQUIPT_SUIT.json` |
| Client constant | `GamePredef.TBL_EQUIPT_SUIT = 73` |

## Purpose

Defines equipment set bonuses ("suits"). When a player equips multiple pieces that share the same `suitId`, the client looks up the matching `TBL_EQUIPT_SUIT` record to determine how many pieces activate each bonus tier, what stats are granted, and whether a skill effect description is shown. Used exclusively for player-character equipment sets (not pet equipment).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Referenced from [[TBL_EQUIPT_TEMPLATE]] via `suitId`. Loaded by `_core.getTemplateData(GamePredef.TBL_EQUIPT_SUIT, suitId)` in `TipEquip.as:3421`. |
| `name` | string | Vietnamese set name (e.g. `"Bộ Trang Bị Thùy Vân"`). Displayed as the set header in the equipment tooltip. |
| `siCodeName` | string | (inferred from data — no client usage found) Set icon code name or skin identifier. All 250 records have empty string `""`. Likely a reserved field for future fashion set art. |
| `skillDescription` | string | Vietnamese description of the set skill effect. Displayed in the tooltip as `"<font color='{color}'>{skillDescription}</font>"` (`TipEquip.as:3469`). Empty string when no skill effect exists. |
| `suitProp1` | int | Stat type for the first set bonus tier. Index into `GamePredef.EQUIPT_PROP_NAME` (same enum as `TBL_EQUIPT_TEMPLATE.mainProp1`). Read via `_local_70[("suitProp" + i)]` (`TipEquip.as:3459`). |
| `suitPropNum1` | int | Bonus value granted when the first set bonus threshold is met. |
| `suitProp2` | int | Stat type for the second set bonus tier. |
| `suitPropNum2` | int | Bonus value for the second tier. |
| `suitProp3` | int | Stat type for the third set bonus tier. |
| `suitPropNum3` | int | Bonus value for the third tier. |
| `suitProp4` | int | Stat type for the fourth set bonus tier. |
| `suitPropNum4` | int | Bonus value for the fourth tier. |
| `suitProp5` | int | Stat type for the fifth set bonus tier. |
| `suitPropNum5` | int | Bonus value for the fifth tier. |

## Value distributions / sentinels

**`suitProp1`** (most common first bonus stat):
- `2` (MP) ×214, `10` (COUNTER) ×30, `19` (unrecognized/custom) ×6.

**Set tier activation**: The number of pieces required per tier is not stored in this table — it is hardcoded in the client-side rendering logic in `TipEquip.as` (iterates `suitProp1` through `suitProp5` and checks how many matching template IDs the player has equipped). The five tiers correspond to equipping 2, 3, 4, 5, and 6 pieces respectively (or the set's own design — exact threshold is client-hardcoded).

**`skillDescription`**: All 250 records have empty string in this dataset. The field is supported structurally and rendered by `TipEquip.as:3469` but may be activated only for specific event sets.

**`siCodeName`**: All 250 records empty string — reserved field, never populated in this data export.

## Client usage

- **`TipEquip.as:3419–3508`** — primary consumer. When `_arg_1.temp.suitId` is non-zero: fetches this record with `_core.getTemplateData(GamePredef.TBL_EQUIPT_SUIT, suitId)`, then iterates `suitProp1`–`suitProp5` and `suitPropNum1`–`suitPropNum5` in a loop to build the set-bonus display. Also reads `skillDescription` for the set skill flavor text.
- **`PetManagerPanel.as:7758/10217`** and **`PetPanel.as:3950/4487`** — filter or list pet equipment by `suitId` to show matching set pieces in the pet equipment UI.
- **`DecoratePanel.as:4907`** — reads `suitId` from an equipment template in the fashion decoration panel context.

## Related tables

- `suitId` on [[TBL_EQUIPT_TEMPLATE]] is the foreign key that points here.
- `suitProp*` stat IDs → `GamePredef.EQUIPT_PROP_NAME` enum (same IDs as `TBL_EQUIPT_TEMPLATE.mainProp1`).
