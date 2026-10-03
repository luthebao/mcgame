# TBL_MOUNT

| Property | Value |
|---|---|
| Table ID | 96 |
| Record count | 33 |
| JSON | `docs/database/game_data/TBL_MOUNT.json` |
| Client constant | `GamePredef.TBL_MOUNT = 96` |

## Purpose

Defines the upgrade-level ladder for the mount dress (costume) system. Each row is one level-step in the mount's progression: it links a dress-level (`level`) to the required mount-costume skin (`dressId`), the EXP threshold needed to reach that step (`exp`), the number of upgrade materials consumed (`itemNum`), the rate at which the experience-bar fills each tick (`addRate`), and the player-level gate to unlock that step (`mountLevLimit`). Type 1 rows are base mount appearances with no progression data; type 2 rows drive the upgrade flow shown in `MountPanel`.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up as `GameData.d[GamePredef.TBL_MOUNT][id]` or via `gameDataIndex[TBL_MOUNT]`. |
| `type` | int | Mount tier category. `1` = base mount skin row (no progression: 20 records); `2` = upgrade-step row (13 records). `TBL_INDEX_ARRAY[TBL_MOUNT] = "type"` (`GameData.as:8391`). |
| `level` | int | Dress-upgrade tier this row represents (0–12 for type=2; 1–19 for type=1). Read at `MountPanel.as:2526` to find the row matching the current mount level. |
| `dressId` | int | Foreign key → `TBL_MOUNT_DRESS.id`. Identifies which mount skin is displayed at this upgrade level. `0` on type=1 rows (no skin progression). Read at `MountPanel.as:3586`, `MountPanel.as:3604`. |
| `exp` | int | EXP required to reach the next upgrade step (bar cap). Displayed as the max value of `expBar` at `MountPanel.as:3569`. `0` on type=1 rows. |
| `addRate` | int | Rate (in EXP units per tick/feed) that the upgrade-progress bar advances. Shown as `curUpExp` label at `MountPanel.as:3576`; used as `upExpBar.value` at `:3595`. Empty string on type=1 rows. |
| `itemNum` | int | Number of upgrade material items consumed per upgrade attempt. Shown in cost label at `MountPanel.as:3598/3602`. |
| `mountLevLimit` | int | Minimum player character level required to unlock this upgrade step. Checked at `MountPanel.as:3027` (`mountData.lev >= mountLevLimit`). `0` on type=1 rows (no gate). |
| `lifeBasic` | int | Flat HP bonus granted by this upgrade level. Applied by iterating `AddProNumArray` (`MountPanel.as:1472`). |
| `lifePer` | int | Percentage HP bonus (%). Applied via `AddProPerArray` (`MountPanel.as:1473`). |
| `phyAttackBasic` | int | Flat physical attack bonus. |
| `phyAttackPer` | int | Percentage physical attack bonus. |
| `magAttackBasic` | int | Flat magical attack bonus. |
| `magAttackPer` | int | Percentage magical attack bonus. |
| `phyDefenseBasic` | int | Flat physical defense bonus. |
| `phyDefensePer` | int | Percentage physical defense bonus. |
| `magDefenseBasic` | int | Flat magical defense bonus. |
| `magDefensePer` | int | Percentage magical defense bonus. |
| `debuffBasic` | float | Flat debuff-resistance bonus. In `AddProNumArray` at index 5 (`MountPanel.as:1472`). Stored as decimal (e.g., `"0.00"`). |
| `debuffPer` | int | Percentage debuff-resistance bonus. In `AddProPerArray` at index 5 (`MountPanel.as:1473`). |

## Value distributions / sentinels

- `type`: `1`×20 (base skin), `2`×13 (upgrade step).
- `addRate`: empty string×20 (type=1, no progression), integer values 1–4 on type=2 rows.
- `dressId`: `0`×20 (type=1), foreign key values 1–18 on type=2 rows.
- `mountLevLimit`: `0`×20 (type=1), ranges 5–40 on type=2 rows.
- `level` on type=2: 0–12 (sequential upgrade steps). On type=1: 1–19 (variant appearances).
- All `Basic` stat fields are `0` in this dump; all `Per` fields are also `0` in this dump. The stat columns appear to be reserved/future-use for this dataset (actual bonuses come from the equipped `TBL_MOUNT_DRESS` costume).

## Client usage

- `MountPanel.as:2523–2526` — `gameDataIndex[TBL_MOUNT][type]` iterated to find the row where `level == currentMountLevel`.
- `MountPanel.as:1472–1473` — `AddProNumArray`/`AddProPerArray` string arrays enumerate all Basic/Per stat keys from this table to aggregate bonuses.
- `MountPanel.as:3027` — `mountData.lev >= mountLevLimit` gates the upgrade button.
- `MountPanel.as:3568–3602` — `exp`, `addRate`, `itemNum`, `dressId` all read for the upgrade-progress UI panel.
- `MountPanel.as:2959` — `gameDataIndex[TBL_MOUNT][2]` used as a starting reference for type=2 row lookup.
- `GameData.as:8391` — `TBL_INDEX_ARRAY[TBL_MOUNT] = "type"` (secondary index by type).

## Related tables

- `dressId` → [[TBL_MOUNT_DRESS]] (the mount skin/costume unlocked at each level step).
- Mount instance data (player's current mount level/exp) stored in runtime player object, not in this static table.
