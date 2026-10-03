# TBL_PRS_CHIP

| Property | Value |
|---|---|
| Table ID | 127 |
| Record count | 10 |
| JSON | `docs/database/game_data/TBL_PRS_CHIP.json` |
| Client constant | `GamePredef.TBL_PRS_CHIP = 127` |

## Purpose

Defines the collectible chip fragments used to unlock PRS "show" spirits (tab=0 path). Each chip corresponds to one PRS show entry; the player collects fragments and exchanges them — at a crystal cost — to activate the spirit. The chip is a draggable inventory-like item handled by the Slot system.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up as `GameData.d[127][id]` or `DataManager.gameData[127][id]`. Matches `TBL_PRS_SHOW.needChipId`. |
| `name` | string | Vietnamese display name of the chip fragment (e.g., `"Mảnh Nữ Thần Âm Nhạc"`). |
| `iconCode` | int | Asset code for the chip's icon image; passed to `ResManager.getIconUrl()`. Used by `Slot.as` when `_type == GamePredef.TBL_PRS_CHIP`. |
| `costCrystal` | int | Crystal (premium currency) cost to exchange this chip into its corresponding show. Displayed in the cost label at `PRSSlotItem.as:260`: `Language.PRS_PANEL[20].replace("{num}", costCrystal)`. |
| `position` | int | Display order in the chip bag (1–10, one chip per position). |
| `showId` | int | Foreign key to `TBL_PRS_SHOW.id`; identifies which show this chip unlocks. In this dataset `showId == id` for all records (1:1 mapping). |

## Value distributions / sentinels

- All 10 records have unique `position` values 1–10.
- `costCrystal` varies per chip (200–2000); no two chips share the same cost, reflecting tiered premium pricing.
- `showId` equals `id` for all 10 records in this dump.

## Client usage

- `PRSExcCvs.as:277` — loads `(GameData.d[127] as Array).slice(1)` to populate the exchange bag UI.
- `PRSChipBag.as:457–458` — reads `GameData.d[127][chipId]`, sets `slot.type = GamePredef.TBL_PRS_CHIP` for drag-and-drop handling.
- `PRSSlotItem.as:258–263` — reads `DataManager.gameData[127][chipId]`; displays `costCrystal` in the cost label; sets `prsSlot.type = GamePredef.TBL_PRS_CHIP`.
- `Slot.as:589,1533` — `TBL_PRS_CHIP` case in the tooltip-type and drag-type dispatchers; routes to `TOOLTIP_PRS_CHIP`.
- `Core.as:2088` — included in the template-type dispatch switch.

## Related tables

- `showId` → [[TBL_PRS_SHOW]] `id` (the spirit this chip unlocks).
- [[TBL_PRS_TREE]] — sibling progression table in the PRS system.
