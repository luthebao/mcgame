# TBL_MOUNT_DRESS

| Property | Value |
|---|---|
| Table ID | 97 |
| Record count | 18 |
| JSON | `docs/database/game_data/TBL_MOUNT_DRESS.json` |
| Client constant | `GamePredef.TBL_MOUNT_DRESS = 97` |

## Purpose

Defines the catalog of mount costume (skin) entries. Each row is a named mount appearance that can be purchased with premium currency (`gold`) or earned. It carries the visual asset codes for the mount sprite and inventory icon, an optional duration for time-limited skins (`effectiveTime`), and a set of combat bonus stats that the skin grants while equipped. The `MountPanel` reads this table to populate the costume-selection list and to compute which skin the player's mount currently displays.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up as `GameData.d[GamePredef.TBL_MOUNT_DRESS][id]` (`MountPanel.as:2245`, `LongBuffCanvas.as:576`). |
| `name` | string | Vietnamese display name of the mount costume (e.g., `"Bạch Hổ"`). Shown in costume list and purchase alert at `MountPanel.as:2252`, `MountPanel.as:3420`. |
| `type` | int | Mount category. All 18 records = `1`. Likely reserved for a mount-class distinction (e.g., land vs. air). `TBL_INDEX_ARRAY[TBL_MOUNT_DRESS] = "type"` (`GameData.as:8392`). |
| `resCode` | int (13-digit) | Asset code for the mount sprite SWF, passed to `ResManager.getResUrl(resCode)` to load the animated mount asset. |
| `iconCode` | int (13-digit) | Asset code for the inventory/UI icon, passed to `ResManager.getIconUrlNoHash(iconCode)` at `MountPanel.as:2306`, `MountPanel.as:3230`. |
| `gold` | int | Purchase price in premium currency (gold). `0` means the skin is non-purchasable (earned/default). Displayed in purchase confirmation alert at `MountPanel.as:3418–3420`. |
| `effectiveTime` | int | Duration of a temporary skin in minutes. `0` = permanent; `720` = 12 hours (`720`×7 records). Time-limited skins show a countdown via `LongBuffCanvas.refreshMountDress`. |
| `description` | string | Flavour/tooltip description text. Empty string in all current records (reserved). |
| `lifeBasic` | int | Flat HP bonus while this skin is equipped. `0` in all current records. |
| `lifePer` | int | Percentage HP bonus (%). Non-zero on some premium skins (e.g., `8`). |
| `phyAttackBasic` | int | Flat physical attack bonus. `0` in all current records. |
| `phyAttackPer` | int | Percentage physical attack bonus. Non-zero on some premium skins (e.g., `8`). |
| `magAttackBasic` | int | Flat magical attack bonus. `0` in all current records. |
| `magAttackPer` | int | Percentage magical attack bonus. `0` in all current records. |
| `phyDefenseBasic` | int | Flat physical defense bonus. `0` in all current records. |
| `phyDefensePer` | int | Percentage physical defense bonus. `0` in all current records. |
| `magDefenseBasic` | int | Flat magical defense bonus. `0` in all current records. |
| `magDefensePer` | int | Percentage magical defense bonus. `0` in all current records. |
| `debuffBasic` | float | Flat debuff-resistance bonus. `0.00` in all current records. |
| `debuffPer` | int | Percentage debuff-resistance bonus. Non-zero on some premium skins (e.g., `8`). |

## Value distributions / sentinels

- `type`: all 18 = `1`.
- `effectiveTime`: `0`×11 (permanent), `720`×7 (12-hour temporary).
- `gold`: `0`×10 (non-purchasable / earned), values 268–588 on 8 premium skins.
- Stat fields: the only non-zero values found are `lifePer=8`, `phyAttackPer=8`, `debuffPer=8` on skins `id` 7, 9, 11 (all time-limited). All Basic fields are `0` throughout.

## Client usage

- `MountPanel.as:2245` — `GameData.d[TBL_MOUNT_DRESS][dressId]` loaded via the mount's current `dressId` field; `name` and `iconCode` extracted.
- `MountPanel.as:2299–2306` — `gold` read for purchase price; `iconCode` resolved to image URL via `DressResMap` or `ResManager`.
- `MountPanel.as:3417–3420` — purchase alert shows `gold` and `name` for a selected skin.
- `MountPanel.as:3444–3456` — costume list populated: `name`, `iconCode`, `type` (type=2 branch check at `:3467`).
- `MountPanel.as:3586–3617` — current equipped dress read; `dressId` from `TBL_MOUNT` row → lookup here for the equip display.
- `LongBuffCanvas.as:576–581` — `GameData.d[TBL_MOUNT_DRESS][useMountDress]` read on a timer to refresh the mount-dress countdown bar; calls `updateMountDressList`.
- `LongBuffCanvas.as:593–594` — `useMountDress` initialised from player data `useDress` field.

## Related tables

- `id` referenced by `TBL_MOUNT.dressId` → [[TBL_MOUNT]] (level-step rows point to the skin unlocked at that step).
- Mount instance runtime data (which skin the player currently wears) lives in the player session object, not here.
