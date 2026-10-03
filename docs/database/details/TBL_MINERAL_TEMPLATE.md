# TBL_MINERAL_TEMPLATE

| Property | Value |
|---|---|
| Table ID | 83 |
| Record count | 10 |
| JSON | `docs/database/game_data/TBL_MINERAL_TEMPLATE.json` |
| Client constant | `GamePredef.TBL_MINERAL_TEMPLATE = 83` |

## Purpose

Defines the 10 creature types available for capture and farming in the Fazenda (farming) system ("Nông Trại"). Each mineral entry represents a gatherable creature "seed" sold in the Fazenda shop, specifying its visual resources, the item it produces when harvested, harvest quantity, production cooldown, and purchase cost.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key (`mid` in farm context). Looked up as `GameData.d[83][mid]`. |
| `name` | string | Vietnamese display name (e.g., `"Nhện Tơ Hiếm"`). Set as slot name in `FazendaShop.as:302`. |
| `description` | string | Tooltip description. Appended with a cooldown string via `FazendaShop.as:297` (`Language.FAZENDAPANEL_S[17].replace("{time}", time)`). Contains Chinese text in source (partially localized). |
| `iconCode` | string | Icon asset code for UI rendering. `(inferred from data — no client iconCode read found on this table; FazendaShop uses `slotData` which carries this field through)` |
| `resCode1` | string | Primary SWF resource code; loaded via `ResManager.getResUrl(resCode1)` in `FazendaFarm.as:201` for the creature's idle sprite. |
| `resCode2` | string | Secondary SWF resource code; loaded via `ResManager.getResUrl(resCode2)` in `FazendaFarm.as:212` for an alternate creature state (e.g., captured/producing). |
| `colorCode` | int | Color tint applied to the creature sprite via `ResManager.setColorCode(img, colorCode)` (`FazendaFarm.as:202, 213`). Value `180` for all 10 entries in this dataset. |
| `tid` | int | Foreign key to `TBL_ITEM_TEMPLATE.id` — the harvested item produced by this creature. Read in `FazendaFarm.as:326` to get item name for display; read in `FazendaShop.as:298` for info string. |
| `num` | int | Max harvest quantity per cycle. Shown in UI via `Language.FAZENDAPANEL_S[18].replace("{num}", num)` (`FazendaShop.as:299`). `100` for common types, `50` for rare types. |
| `time` | int | Production cooldown in seconds (always `60` in this dataset). Passed to `FazendaPanel.as:705` as `_local_2.time` and to `setTime()` in `FazendaFarm.as`. |
| `actPnt` | int | Activation point cost to place this creature in a farm slot. Always `100` in this dataset. `(inferred from data — no direct .actPnt read confirmed in UI/logic files)` |
| `money` | int | Silver coin purchase price in the Fazenda shop. Always `10000` in this dataset. Routed through `slotData.money` to `ShopSlot` cost display. |

## Value distributions / sentinels

- `actPnt`: all 10 = `100`.
- `money`: all 10 = `10000`.
- `time`: all 10 = `60`.
- `colorCode`: all 10 = `180`.
- `num`: `100`×5 (common creatures), `50`×5 (rare creatures).
- `tid`: 10 distinct item template IDs (7, 18, 21–28).

## Client usage

- `FazendaShop.as:291–303` — iterates all `TBL_MINERAL_TEMPLATE` entries; sets `type = GamePredef.TBL_MINERAL_TEMPLATE`, `itemId = id`, appends cooldown to `description`, builds `info` from `num` + `tid.name`; assigns to shop slots.
- `FazendaFarm.as:163, 200–213` — `GameData.d[TBL_MINERAL_TEMPLATE][mid]` to load `resCode1`, `resCode2`, `colorCode` for creature sprite rendering.
- `FazendaFarm.as:325–327` — reads `tid` to look up harvest item name for farm tooltip.
- `FazendaPanel.as:703–705` — `GameData.d[TBL_MINERAL_TEMPLATE][mid].num` for max harvest count; `.time` for countdown display.
- `Slot.as:582` — `GamePredef.TBL_MINERAL_TEMPLATE` case in slot type switch.
- `Core.as:2081` — `TBL_MINERAL_TEMPLATE` case in core data dispatch.

## Related tables

- `tid` → [[TBL_ITEM_TEMPLATE]] (the item harvested from this creature).
- Farm instance state: [[TBL_MINERAL_INSTANCE]] (per-player farm slot state, not in this export).
