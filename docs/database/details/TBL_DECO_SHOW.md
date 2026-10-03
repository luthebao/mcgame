# TBL_DECO_SHOW

| Property | Value |
|---|---|
| Table ID | 120 |
| Record count | 20 |
| JSON | `docs/database/game_data/TBL_DECO_SHOW.json` |
| Client constant | `GamePredef.TBL_DECO_SHOW = 120` |

## Purpose

Defines each Hồn Khí decorative equipment piece (cosmetic outer-layer armor) in the Decorate system. Each record is a distinct named cosmetic item occupying one of 4 positions (head, light/body, foot, and formation/bottom). The piece grants up to 4 stat bonuses, belongs to a suit group, and carries visual resource codes for the character model. Duration is encoded in the `t` field (minutes, or 1 for permanent).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up as `GameData.d[120][decoId]` (`DecoratePanel.as:4889`). |
| `name` | string | Vietnamese display name (e.g., `"Mũ Solomon"`). Displayed in `TipDecoShow.as:240` via `decoName.text`. |
| `description` | string | Flavor text (e.g., `"Chỉ có Hiền Vương mới điều khiển được"`). Displayed in `TipDecoShow.as:241`. |
| `iconCode` | int | Icon asset code (13-digit). Passed to `ResManager.getIconUrl(iconCode)` at `TipDecoShow.as:239`. |
| `position` | int | Equipment slot: `1`=Head (Hoàng Quan), `2`=Body/Light (Thánh Quang), `3`=Accessory (Ấn Tích), `4`=Formation (Pháp Trận). Used at `DecoratePanel.as:4257,4891,5032,10462`; position label from `Language.TIPDECO_S[2][position-1]`. |
| `t` | int | Duration in minutes. `1` = permanent ("Vĩnh viễn" at `TipDecoShow.as:264`). If `t > 1`, displays as `round(t / (24*60))` days. All current records have `t=1` (permanent). |
| `activeGold` | int | Gold cost to activate/equip this piece. `(inferred from data — no direct display call found for this field)` |
| `suitId` | int | Suit group this piece belongs to (1–5). Used at `DecoratePanel.as:4907` to look up suit bonus data. |
| `linkId` | int | Links to another [[TBL_DECO_SHOW]] entry as a variant or upgrade path. All current records have `linkId=1`. `(inferred from data — no conditional branch on linkId found)` |
| `linkSuitId` | int | References a linked suit group. Used at `DecoratePanel.as:4908` alongside `suitId` for suit bonus calculation. All current records have `linkSuitId=1`. |
| `propType1` | int | Property type for stat bonus slot 1. Same enum as across the deco system. `0` = no bonus. |
| `propType2` | int | Property type for stat bonus slot 2. `0` = no bonus. |
| `propType3` | int | Property type for stat bonus slot 3. `0` = no bonus. |
| `propType4` | int | Property type for stat bonus slot 4. `0` = no bonus. |
| `propNum1` | int | Stat bonus value for `propType1`. Displayed at `TipDecoShow.as:254,258` via dynamic key lookup; also at `DecoratePanel.as:10465`. |
| `propNum2` | int | Stat bonus value for `propType2`. |
| `propNum3` | int | Stat bonus value for `propType3`. |
| `propNum4` | int | Stat bonus value for `propType4`. |
| `per` | int | Percentage display flag for bonuses. Always `0` across all 20 records. `TipDecoShow.as:244` reads `_arg_1.temp["per"]` and uses it to branch between flat and `/10000%` display for the propNum values. |
| `resCode1` | int | Visual SWF resource code for character body layer 1. Passed to display methods via `DecoratePanel.as:4895` pattern `resCode + (2*slotIndex-1)`. |
| `resCode2` | int | Visual resource code for layer 2. `0` if unused. |
| `resCode3` | int | Visual resource code for layer 3. |
| `resCode4` | int | Visual resource code for layer 4. `0` if unused. |
| `resCode5` | int | Visual resource code for layer 5. |
| `resCode6` | int | Visual resource code for layer 6. `0` if unused. |
| `targetType` | int | Always `3` across all 20 records (player character target). `(inferred from data — always 3)` |

## Value distributions / sentinels

- `position`: 1–4, exactly 5 records each (5 suits × 4 positions = 20).
- `suitId`: 1–5, exactly 4 records each.
- `targetType`: always `3` (all 20 records).
- `t`: always `1` (permanent) across all 20 records.
- `per`: always `0` (all 20 records).
- `linkId` and `linkSuitId`: always `1` in current data — may be used for future suit variants.
- `resCode2`, `resCode4`, `resCode6`: often `0` (unused layers), non-zero for position 2 and 4 pieces that have mask/overlay layers.

## Client usage

- `DecoratePanel.as:4889` — loads `GameData.d[GamePredef.TBL_DECO_SHOW][decoId]` when a deco piece is selected.
- `DecoratePanel.as:4891–4910` — reads `position` to route to correct slot, reads `resCode*` to call `setDecoHeadRes/setDecoLightRes/setDecoLightMaskRes/setDecoBottomRes` (pattern: odd `resCode` = main, even = mask layer).
- `DecoratePanel.as:4907–4909` — reads `suitId` and `linkSuitId` and `linkId` for suit bonus calculation.
- `DecoratePanel.as:5031` — loops over deco show items using `position` field.
- `DecoratePanel.as:10461–10465` — reads `position`, `propType1`, `propNum1` to render suit property labels via `DECO_SUIT_PROP_NAME[propType1]`.
- `TipDecoShow.as:239–264` — tooltip: renders `iconCode`, `name`, `description`, `position` (via `TIPDECO_S[2][position-1]`), all `propType*/propNum*` pairs, `t` (duration), and `per` flag.
- `DecoratePanel.as:4262–4283` — assigns slot type `GamePredef.TBL_DECO_SHOW` to `headSlot/lightSlot/footSlot/bottomSlot` components.

## Related tables

- Holes for each piece defined in [[TBL_DECO_HOLE]] (linked by runtime `hid` on player instance, not by a static FK here).
- Runes socketed in those holes defined in [[TBL_DECO_RUNE]].
- `suitId` / `linkSuitId` reference suit bonus data (likely [[TBL_DECORATE]] id=121).
