# TBL_CARVE_AWARD

| Property | Value |
|---|---|
| Table ID | 139 |
| Record count | 150 |
| JSON | `docs/database/game_data/TBL_CARVE_AWARD.json` |
| Client constant | `GamePredef.TBL_CARVE_AWARD = 139` |

## Purpose

Defines the reward offered to players at each Văn Chỉ (KP / carving) dungeon floor milestone. Each record corresponds to one dungeon floor level and specifies the item reward, the Văn Chỉ (KP) award amount, and how many free versus paid exchange attempts are allowed per session.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key, also the floor/level index. Looked up as `GameData.d[139][floorNumber]`. |
| `lev` | int | Floor level number (1–150). One record per floor; `lev` equals `id` in all observed records. |
| `itemId` | int | Item template ID of the reward item granted for clearing this floor. Read at `PetPVESystem.as:2563` as `_local_3.itemId`. References [[TBL_ITEM_TEMPLATE]] / [[TBL_EQUIPT_TEMPLATE]]. |
| `award` | int | Amount of Văn Chỉ (KP) currency awarded for clearing this floor. Displayed in `kpAward` label (`PetPVESystem.as:2569`). All observed records have `award = 10`. |
| `freeExchagne` | int | Number of free exchange attempts available at this floor tier. Displayed as `Language.PET_PVE_PANEL[11]` ("Lượt đổi miễn phí: {num}") at `PetPVESystem.as:3474`. Increases by 5 per floor (5, 10, 15, …). Note: field name contains a typo ("Exchagne" instead of "Exchange") — must match exactly. |
| `payExchangeTime` | int | Number of paid (gold) exchange attempts permitted per day at this floor tier. Displayed as `Language.PET_PVE_PANEL[15]` ("Lượt đổi cao cấp: {num}") at `PetPVESystem.as:3475`. `0` for floors 1–4, `1` for floors 5–7, increases for higher floors. |

## Value distributions / sentinels

- `lev`: 1–150, exactly one record per floor (unique, sequential).
- `award`: always `10` across all 150 records.
- `freeExchagne`: increments by 5 per floor (floor 1 = 5, floor 2 = 10, floor 3 = 15, …, floor 30 = 150, then continues).
- `payExchangeTime`: `0` for floors 1–4; `1` for floors 5+; increases at higher tiers.
- `itemId`: cycles through a small set of item IDs (4724, 6516, 4181, etc.) with no strict pattern across floors.

## Client usage

- `PetPVESystem.as:2558` — looks up `GameData.d[GamePredef.TBL_CARVE_AWARD][floorArg]` when player selects or views a floor.
- `PetPVESystem.as:2563` — reads `_local_3.itemId` to fetch the reward item template for display.
- `PetPVESystem.as:2569` — sets `kpAward.text = _local_3.award` to show KP reward amount.
- `PetPVESystem.as:3474` — sets `exchangeTimesFreeLabel` from player's runtime `_kpData.awardTime`, compared against `freeExchagne` to gate free exchanges.
- `PetPVESystem.as:3475` — sets `exchangeTimesGoldLabel` from `_kpData.gold4awardTimeDaily`, gated by `payExchangeTime`.

## Related tables

- `itemId` → [[TBL_ITEM_TEMPLATE]] or [[TBL_EQUIPT_TEMPLATE]] (reward item definition).
- [[TBL_CARVE]] — the carve node progression table consumed by the same KP system.
- [[TBL_CARVE_MASTER]] — master-level bonus stats for the carve system, also used in `PetPVESystem.as`.
