# TBL_MYTC_SUIT

| Property | Value |
|---|---|
| Table ID | 142 |
| Record count | 8 |
| JSON | `docs/database/game_data/TBL_MYTC_SUIT.json` |
| Client constant | `GamePredef.TBL_MYTC_SUIT = 142` |

## Purpose

Defines the 8 suit groups in the Mặc Ý Tụ Cẩm ("Moyintuce") fashion crafting system. Each suit is a named set of up to three equipment templates (`m1`, `m2`, `m3`) that a player can craft together at the crafting station. The `Moyintuce.as` panel displays these suits as a tree, and uses `TBL_MYTC_DETAIL` (indexed by suit ID) to get per-level stat bonuses for each suit.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key (suit ID, 1–8). Used as index key when iterating `GameData.d[142]` in `Moyintuce.as:4194–4215`. |
| `name` | string | Vietnamese suit display name (e.g., `"Trang 1"`). Shown in `Moyintuce.as:4199` as `_local_5.name`, displayed in `suitName1.text`. |
| `m1` | int | Equipment template ID of the first required piece. Looked up via `GameData.d[TBL_EQUIPT_TEMPLATE][m1]` in `Moyintuce.as:3203`. `0` = slot unused (triggers `mytcVS.selectedIndex = 2` fallback). |
| `m2` | int | Equipment template ID of the second required piece. Looked up via `GameData.d[TBL_EQUIPT_TEMPLATE][m2]` in `Moyintuce.as:3213`. `0` = unused. |
| `m3` | int | Equipment template ID of the third required piece. Looked up via `GameData.d[TBL_EQUIPT_TEMPLATE][m3]` in `Moyintuce.as:3223`. `0` = unused. |

## Value distributions / sentinels

- `id`: 1–8 (8 suits total).
- All `m1`, `m2`, `m3` values are positive equipment template IDs in this dataset (IDs 1964–2352 range observed).
- `name`: `"Trang 1"` through `"Trang 8"` (all named sequentially in Vietnamese).

## Client usage

- `Moyintuce.as:4193–4215` — iterates `GameData.d[TBL_MYTC_SUIT]`; for each suit, copies `name`, `m1`, `m2`, `m3` into a VO; looks up `gameDataIndex[TBL_MYTC_DETAIL][suitId]` to attach per-level detail data; builds the `dp` ArrayCollection shown in the suit selection tree.
- `Moyintuce.as:3193–3258` — reads `m1`, `m2`, `m3` to populate equipment slot displays (`es1`, `es2`, `es3`) and checks player bag for matching equipment to unlock crafting buttons.
- `MoyintuceItemsRenderer.as:188` — checks `_arg_1.m1 == null || m1 == ""` to determine if a row should show an empty-suit placeholder.
- `Moyintuce.as:4227` — after building the suit list, fires `remote.call("getMYTCDataView", null)` to request server-side crafting progress.

## Related tables

- `m1`, `m2`, `m3` → [[TBL_EQUIPT_TEMPLATE]] (the required equipment pieces for this suit).
- Crafting level progression per suit: [[TBL_MYTC_DETAIL]] (linked by `tid = TBL_MYTC_SUIT.id`).
