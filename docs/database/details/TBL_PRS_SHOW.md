# TBL_PRS_SHOW

| Property | Value |
|---|---|
| Table ID | 126 |
| Record count | 22 |
| JSON | `docs/database/game_data/TBL_PRS_SHOW.json` |
| Client constant | `GamePredef.TBL_PRS_SHOW = 126` |

## Purpose

Defines unlockable "show" skins/spirits in the PRS system. Each record is a displayable creature/spirit entity that the player can activate by spending a chip item. Activated shows grant their own set of up to 8 stat bonuses, displayed alongside the tree bonuses in the PRS panel. The table splits into two tabs: chip-based (tab=0) and item-based (tab=1) acquisition paths.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up as `GameData.d[126][id]`. |
| `name` | string | Vietnamese display name of the spirit (e.g., `"Nữ Thần Âm Nhạc Rust"`). Displayed in the show canvas label (`PRSShowCvs.as:687`). |
| `resCode` | int | Asset code for the spirit's animated display sprite. Set on `_creObjArr[slot].resCode` at `PRSShowCvs.as:665,670`. |
| `position` | int | Sort order within the tab (1–11). Used in `PRSShowCvs.as:429`: `_showArr.sortOn("position", Array.NUMERIC)`. |
| `tab` | int | Panel tab group: `0` = chip-exchange shows (10 records), `1` = item-based shows (12 records). Filters which shows appear on each tab at `PRSShowCvs.as:424`. |
| `needChipId` | int | ID of the required chip item. For `tab=0`, refers to `TBL_PRS_CHIP.id`; for `tab=1`, refers to `TBL_ITEM_TEMPLATE.id` (looked up by name at `PRSShowCvs.as:728`). |
| `needNum` | int | Quantity of the chip/item required to unlock this show. Displayed in the cost label at `PRSShowCvs.as:711,725`. |
| `limitType` | int | Purchase/unlock limit scope. `0` = unlimited. Non-zero values mirror NPC-shop limit semantics (inferred from data — no direct PRS client usage found; pattern matches `NpcShopItemDisplay.as` `limitType` logic). |
| `limitTime` | int | Time period in seconds for the limit window. `0` = no limit. `21600` (6 hours) seen on tab=1 records with `limitType=1`. (inferred from data — no direct PRS client read found). |
| `pT1`–`pT8` | int | Stat-type enum for bonus slots 1–8, same encoding as `TBL_PRS_TREE`. `0` = unused slot. Read at `PRSShowCvs.as:748` and `PRSPanel.as:2188`. |
| `pN1`–`pN8` | int | Bonus magnitude paired with the corresponding `pT` slot. Rendering logic identical to `TBL_PRS_TREE`: raw / ÷100 / ÷100% depending on type. Read at `PRSShowCvs.as:752,758,762`. |

## Value distributions / sentinels

- `tab`: `0`×10 (chip-show path), `1`×12 (item path).
- `limitType`: `0`×10 (tab=0, all unlimited), `1`×12 (tab=1, time-limited).
- `limitTime`: `0` for all tab=0 records; `21600` for all tab=1 records.
- `position`: values 1–11 (with 10 appearing 3× on tab=1 showing overlapping slots).
- Bonus type sets: tab=0 shows use types 1,4,5,6,7,11,13,31 (flat stats); tab=1 shows use types 34,59,60,62,63,14,61 (percentage/reduction types).

## Client usage

- `PRSShowCvs.as:421–429` — loads all shows, filters by `tab`, sorts by `position`, renders up to 6 show slots.
- `PRSShowCvs.as:651,665,670,687,711,716,725–729,748–762` — per-slot: sets `resCode` on display object, reads `name`, `needNum`, `needChipId`, reads `pT`/`pN` pairs for tooltip.
- `PRSPanel.as:2184–2193` — sums all active show bonuses into `PRS_SHOW_TYPE_PROP` for the cumulative stat display.
- `PRSPanel.as:1475` — `setPrsShowContainer(0)` defaults to tab 0 on panel open.
- `Core.as:2089` — template-type dispatch recognizes `TBL_PRS_SHOW` for tooltip VO pass-through.

## Related tables

- `needChipId` (tab=0) → [[TBL_PRS_CHIP]] `id`.
- `needChipId` (tab=1) → [[TBL_ITEM_TEMPLATE]] `id`.
- Stat types (`pT*`) correspond to `AWAKEN_PROP_DICT` keys in `GamePredef.as:7019`.
- [[TBL_PRS_TREE]] — tree and show bonuses are summed together in the PRS panel.
