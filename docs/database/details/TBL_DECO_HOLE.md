# TBL_DECO_HOLE

| Property | Value |
|---|---|
| Table ID | 118 |
| Record count | 204 |
| JSON | `docs/database/game_data/TBL_DECO_HOLE.json` |
| Client constant | `GamePredef.TBL_DECO_HOLE = 118` |

## Purpose

Defines each upgrade level of the four Hồn Khí (Decorate / Rune Hole) slots on a decorative equipment piece. Each record represents one slot at one upgrade level, specifying the stat bonuses granted, upgrade cost, success rate, and the ID of the next level. The client looks up a hole by its `hid` field on the player's instance data to retrieve current stats and upgrade parameters.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up as `GameData.d[118][hid]` where `hid` comes from the player's deco-instance data (`DecoratePanel.as:5153`). |
| `position` | int | Which of the 4 Hồn Khí slots this row applies to (1–4). Used in `DecoratePanel.as:4257,4891,5032` to assign slot visuals. `TIPDECO_S[2]` labels: `1`="Hồn Khí·Hoàng Quan", `2`="Hồn Khí·Thánh Quang", `3`="Hồn Khí·Ấn Tích", `4`="Hồn Khí·Pháp Trận". |
| `level` | int | Upgrade level of this hole state (0=base, 1–N=upgraded). `level=0` rows have all `propNum*=0`. Read at `DecoratePanel.as:4294,8481–8484` to compare slot levels. |
| `nextId` | int | ID of the next upgrade level row for this slot. `0` or absent at max level. Used at `DecoratePanel.as:5184` to fetch the next-level stat preview. |
| `num` | int | Number of Rune material items required for this upgrade attempt. Increases with level (1 at base, 3 at level 1, 5 at level 2, …). `(inferred from data — no direct client read of .num found)` |
| `rate` | int | Success rate (%) of the upgrade attempt (e.g., `100` at level 0, `90` at level 1, down to `30` at high levels). `(inferred from data — no direct client read of .rate found)` |
| `costNum` | int | Rune-chip (Mảnh Vỡ) cost for the upgrade. Displayed at `DecoratePanel.as:5194` as "needSilver" label (Vietnamese: "Cần dùng"). |
| `costSil` | int | Silver (silver currency) cost for the upgrade. Displayed at `DecoratePanel.as:5195` as "needBindSil" label. Values range from 500,000 to several million. |
| `propType1` | int | Property type for stat bonus slot 1 (same enum as `TBL_CARVE.p`). e.g., `1`=Hp, `4`=Công vlý. |
| `propType2` | int | Property type for stat bonus slot 2. |
| `propType3` | int | Property type for stat bonus slot 3. |
| `propType4` | int | Property type for stat bonus slot 4. |
| `propNum1` | int | Stat bonus value for `propType1`. `0` at level 0 (no bonus until first upgrade). Read at `DecoratePanel.as:5168`. |
| `propNum2` | int | Stat bonus value for `propType2`. Read at `DecoratePanel.as:5169`. |
| `propNum3` | int | Stat bonus value for `propType3`. Read at `DecoratePanel.as:5170`. |
| `propNum4` | int | Stat bonus value for `propType4`. Read at `DecoratePanel.as:5171`. |
| `targetType` | int | Entity target of the bonuses. Always `3` across all 204 records (likely `3` = player character). `(inferred from data — always 3, no conditional branch found)` |
| `per` | int | Always `0` across all 204 records. Likely a percentage-display flag; unused in practice. `(inferred from data — no client usage found)` |

## Value distributions / sentinels

- `position`: 1–4, exactly 51 records each (4 slots × ~51 levels including base).
- `targetType`: always `3` (all 204 records).
- `per`: always `0` (all 204 records).
- `rate`: 100 (level 0, 4 records), 90 (4), then 80, 70, 60, 55, 50, 45, 40, 35, 30 at higher levels; minimum observed is 30%.
- `level 0` rows: `propNum1–4` all `0`, `rate=100`, `num=1` — these are the initial "unenhanced" state.

## Client usage

- `DecoratePanel.as:5153` — loads `GameData.d[GamePredef.TBL_DECO_HOLE][hid]` from a player's deco-instance `hid` field to show current hole stats.
- `DecoratePanel.as:5168–5171` — displays `propNum1–4` as current level bonuses in `curLvlProp1–4` labels with `Language.DECORATE_PANEL[22/24/25/23]` prefixes.
- `DecoratePanel.as:5185–5188` — uses `nextId` to fetch next-level row and displays `propNum1–4` as preview in `nexLvlProp1–4`.
- `DecoratePanel.as:5194–5195` — displays upgrade cost: `costNum` in "needSilver" and `costSil` in "needBindSil".
- `DecoratePanel.as:4294,8481–8484` — reads `level` to compare current upgrade depth across the 4 slots.
- `DecoratePanel.as:4257` — uses `position` to route slot data to the correct `headSlot/lightSlot/footSlot/bottomSlot`.

## Related tables

- `propType1–4` (property type enum) shared with [[TBL_CARVE]] (`p`), [[TBL_DECO_RUNE]] (`propType`), [[TBL_DECO_SHOW]] (`propType1–4`).
- [[TBL_DECO_RUNE]] — the rune gems that are embedded in these holes.
- [[TBL_DECO_SHOW]] — the decorative equipment piece that owns these holes.
- `nextId` self-references [[TBL_DECO_HOLE]] for upgrade chain.
