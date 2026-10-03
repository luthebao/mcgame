# TBL_FARM

| Property | Value |
|---|---|
| Table ID | 82 |
| Record count | 0 |
| JSON | `docs/database/game_data/TBL_FARM.json` |
| Client constant | `GamePredef.TBL_FARM = 82` |

## Purpose

Runtime per-character farm (Fazenda) root record. Each row holds a character's farm identity and progression state (`cid`, `exp`, `name`, `farmNum`). The client receives this inside a composite packet `{farm: {...}, mine: {...}}` from the `onGetFarmData` callback and stores the `farm` sub-object as `_farmData`; the authenticated player's full packet is also cached as `_fazendaDataSelf`. A friend's farm can also be loaded via `onGetFriendFarm`.

## Key reference

| Key | Type | Function |
|---|---|---|
| `cid` | int | Character ID of the farm owner. Used to distinguish own farm from a friend's farm (`FazendaPanel.as:1541`, `1552`, `1484`). Stored as `_ownerId`. |
| `exp` | int | Farm experience points. Drives the farm level (resolved via `_core.getFazendaLevelByExp(exp)`) and displayed in the character-property panel (`FazendaPanel.as:1554`, `615`, `707`, `718`, `2074`). |
| `name` | string | Farm display name (character's farm name). Shown in the property panel header (`FazendaPanel.as:1555`). |
| `farmNum` | int | Number of unlocked farm plots (max bounded by `GamePredef.FARM_LVUP_CONFIG[level].maxFarm`). Controls how many plot slots are active in the UI (`FazendaPanel.as:1443`, `1453`, `1513`, `2075`). Updated via `onAddFarmNum` callback (`FazendaPanel.as:1263`; `CallBack.as:10282`). |

The composite packet also carries a `mine` sub-object (a map of plot index → mine-plot data) and optional friend fields `icon` and `lv`. These belong to the mine-plot runtime state (related to [[TBL_MINERAL_TEMPLATE]]) rather than to the TBL_FARM row itself:

| Companion field | Type | Function |
|---|---|---|
| `mine[n].id` | int | Mineral template ID (`mid`) of the planted crop. Resolved via `GameData.d[TBL_MINERAL_TEMPLATE][mid]` (`FazendaFarm.as:163`). |
| `mine[n].num` | int | Current resource count in the plot (`FazendaPanel.as:1466`, `1914`). |
| `mine[n].time` | timestamp | Harvest/ready timestamp. Compared against `_core.timeLag` to determine readiness (`FazendaPanel.as:1473`, `1482`). |
| `mine[n].havestFlag` | bool(0/1) | Whether the plot has been harvested (client sets this locally after harvest; `FazendaPanel.as:1464`, `2122–2123`). |

## Value distributions / sentinels

Not applicable — empty export; all rows are live-server instances.

## Client usage

- `CallBack.as:10599–10601` — `onGetFarmData(_arg_1)` routes the composite packet to `FazendaPanel.updateFazendaData(_arg_1, true)`.
- `CallBack.as:6468` — `onGetFriendFarm(_arg_1)` routes a friend's farm packet to the same panel with `_arg_2 = false`.
- `CallBack.as:10282–10286` — `onAddFarmNum(_arg_1)` increments `_farmData.farmNum` via `FazendaPanel.onAddFarmNum(_arg_1.num)`.
- `FazendaPanel.as:1539–1600` — `updateFazendaData` unpacks the packet: sets `_farmData`, `_mineData`, `_ownerId`; renders the farm-plot grid.
- `FazendaPanel.as:1443–1484` — iterates `1..farmNum+1` to enable/disable and populate plot slots from `_mineData`.
- `FazendaPanel.as:2074–2075` — checks `exp`-derived level against `FARM_LVUP_CONFIG[level].maxFarm` to gate plot-unlock purchase.
- `FazendaFarm.as:163`, `200`, `211`, `325` — individual plot component resolves `_mid` → `TBL_MINERAL_TEMPLATE` for crop icon and capacity.

## Related tables

- `cid` → [[TBL_CHARACTOR]] (farm owner).
- `mine[n].id` → [[TBL_MINERAL_TEMPLATE]] (planted crop template; `TBL_MINERAL_TEMPLATE = 83`, adjacent constant).
