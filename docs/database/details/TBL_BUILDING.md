# TBL_BUILDING

| Property | Value |
|---|---|
| Table ID | 70 |
| Record count | 18 |
| JSON | `docs/database/game_data/TBL_BUILDING.json` |
| Client constant | `GamePredef.TBL_BUILDING = 70` |

## Purpose

Defines guild estate and private building templates — the static data for each building type and upgrade level. The client builds two indexes: `TBL_INDEX_ARRAY[70] = "type"` (bucket by type) and `TBL_INDEX_ARRAY2[70] = "codeName"` (bucket by code name, enabling level-chain traversal). `Core.as:createBuild()` merges a template row with runtime instance data (position, id, state) to produce a live `Building` object. The Construction Manager uses `preBuilding`/`postBuilding` chains to determine unlock prerequisites. `buildType` distinguishes guild buildings (`TYPE_GUILD_BUILD = 1`) from private/estate buildings (`TYPE_PRIVATE_BUILD = 2`).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up as `GameData.d[70][tid]` in `Core.as:918`, `ConstructionManager.as:372`, `BuildInfoPanel.as:548`, `CallBack.as:2056`. |
| `name` | string | Vietnamese display name (e.g. `"Đại sảnh cấp 1"`, `"Nhà cấp 2"`). Shown in `TipBuilding.as:620` and `GuildBuildProcess.as:573`. |
| `description` | string | Long-form description. Shown in `GuildBuildProcess.as:573`: `description.text = nextBuild.description`. |
| `codeName` | string | Code identifier for the building family (e.g. `"BUILD100001"`, `"EXT_POINT"`). Used as the secondary index key for grouping all levels of the same building: `gameDataIndex2[TBL_BUILDING][codeName]` (`ConstructionManager.as:389`). |
| `level` | int | Upgrade level of this building variant (0 = placeholder/empty slot, 1–6 for upgrade tiers). `ConstructionManager.as:345/392` checks `level == 1` for base buildings and `level == currentLevel + 1` for next upgrade. |
| `type` | int | Building category: `1` = `TYPE_GUILD_BUILD` (guild building, 17 rows), `3` = empty-plot placeholder (1 row). `Core.as:932` routes guild vs. private buildings to different scene layers. |
| `preBuilding` | pipe-list | Pipe-separated list of prerequisite building `id`s that must exist before this one can be built (`"2"`, `"2|3|5"`, etc.). Empty = no prerequisites. Parsed in `TipBuilding.as:624–636` and `ConstructionManager.as:373`. |
| `postBuilding` | pipe-list | Pipe-separated list of building `id`s that become available after this one is built. Empty = terminal node. `ConstructionManager.as:373`: `_local_2.postBuilding.replace(...)`. `(inferred from data — postBuilding is always empty in this export; client reads it but no non-empty values present)` |
| `goldCost` | int | Gold (vàng) cost to build/upgrade. Displayed in `TipBuilding` cost section. `(inferred from data — field present in JSON; client reads via `vo.goldCost` path not isolated, but `expCost`/`moneyCost`/etc. are all shown in TipBuilding setCommon)` |
| `moneyCost` | int | Silver/money cost. Shown in tooltip: `Language.TIPBUILDING_U[1] + _arg_1.moneyCost` (`TipBuilding.as:616`). |
| `expCost` | int | Experience cost. Shown in tooltip: `Language.TIPBUILDING_U[0] + _arg_1.expCost` (`TipBuilding.as:615`). |
| `genMCost` | int | General material cost. Shown in tooltip: `Language.TIPBUILDING_U[2] + _arg_1.genMCost` (`TipBuilding.as:617`). |
| `rareMCost` | int | Rare material cost. Shown in tooltip: `Language.TIPBUILDING_U[3] + _arg_1.rareMCost` (`TipBuilding.as:618`). |
| `maintainCost` | int | Daily upkeep cost. Shown in `BuildInfoPanel.as:550`: `Language.BUILDINFOPANEL_U[0] + template.maintainCost`. Also `TipBuilding.as:619`. |
| `prop1` | int | First property type ID. Indexes into `GamePredef.PROP_NAME` for localized label. Values: `0`=none, `1`=Giới hạn thành viên, `2`=Giới hạn tiền vàng, `3`=Tiêu hao ngày, `4`=Cấp độ công trình, `5`=Kho bang, `6`=Sản xuất mỗi ngày. `BuildInfoPanel.as:430/438`. |
| `prop1Value` | int | Numeric value for `prop1`. Shown as raw number if `percentFlag == 0`, or as `"N%"` if `percentFlag == 1` (`BuildInfoPanel.as:432/436`). |
| `prop2` | int | Second property type ID. Same enum as `prop1`. |
| `prop2Value` | int | Numeric value for `prop2`. |
| `prop3` | int | Third property type ID. `0` = unused in this export. |
| `prop3Value` | int | Numeric value for `prop3`. |
| `prop4` | int | Fourth property type ID. `0` = unused in this export. |
| `prop4Value` | int | Numeric value for `prop4`. |
| `percentFlag` | bool(0/1) | `0` = prop values are absolute amounts; `1` = prop values are percentages (append `"%"`). `BuildInfoPanel.as:430`. |
| `numLimit` | int | Maximum number of this building type allowed in an estate. `-1` = unlimited. `(inferred from data — no client read found beyond data storage)` |
| `resCode` | string | Asset code string for the building's visual SWF resource (e.g. `"2060090000099"`). Passed to `ResManager.getResUrl()` by `BuildingView.as:119`. |
| `iconCodeSmall` | string | Icon asset code string (e.g. `"3060090000097"`). Passed to `ResManager.getIconUrl()` for the small inventory icon. `(inferred from data — TipBuilding uses `iconCode` not `iconCodeSmall`; this may be for a different display context)` |
| `funcScript` | script | Embedded ActionScript snippet executed when the building's function button is clicked (e.g. `"var obj = {name:Lang.BUILDING_funcScript1,func:\"extInfo\",bid:build.id}; ..."`). `BuildingView.as:142` calls `execBuildFunc(_arg_1.item.func, _arg_1.item.bid, gameObject.type)` with the parsed function name. |

## Value distributions / sentinels

- `type`: `1`×17 (guild buildings), `3`×1 (empty-plot placeholder `EXT_POINT`).
- `level`: `0`×2, `1`×4, `2`×4, `3`×2, `4`×2, `5`×2, `6`×2. Two level-0 records are the placeholder slots.
- `prop1` observed values: `0` (no property), `1` (member limit), `4` (building level), `5` (guild warehouse).
- `percentFlag`: `0` for all 18 records in this export.

## Client usage

- `Core.as:918–940` (`createBuild`) — merges template with runtime instance; branches on `type` to add to guild (`addB`) vs. estate (`addE`) scene layer.
- `ConstructionManager.as:341/345/372/380/382/389/392` — builds upgrade chain: iterates `gameDataIndex[TBL_BUILDING][buildType]`, finds level-1 base, resolves next level via `gameDataIndex2[TBL_BUILDING][codeName]`.
- `ConstructionManager.as:373` — reads `postBuilding` to trim trailing whitespace.
- `TipBuilding.as:615–634` — `setCommon()`: reads `expCost`, `moneyCost`, `genMCost`, `rareMCost`, `maintainCost`, `name`, `preBuilding`. Resolves prerequisite names by re-looking up `gameData[TBL_BUILDING][preId].name`.
- `BuildInfoPanel.as:430/432/436/438/548–553` — `setProperty()`: reads `percentFlag`, `prop1`–`prop4` + `prop1Value`–`prop4Value` to build property label strings; reads `name`, `maintainCost`, `iconCode`.
- `GuildBuildProcess.as:570/573` — reads `description` for the upgrade dialog.
- `CallBack.as:2056` — looks up building by `bid` on a server callback.
- `BuildSlot.as:86` — looks up `tid` from a slot to get the building template.

## Related tables

- `preBuilding` pipe-list → other [[TBL_BUILDING]] `id`s (prerequisite buildings).
- `postBuilding` pipe-list → other [[TBL_BUILDING]] `id`s (unlocked by this building).
- `resCode` → asset resolver (not a DB table).
- `iconCodeSmall` → asset resolver (not a DB table).
