# TBL_ITEM_TEMPLATE

| Property | Value |
|---|---|
| Table ID | 29 |
| Record count | 6468 |
| JSON | `docs/database/game_data/TBL_ITEM_TEMPLATE.json` |
| Client constant | `GamePredef.TBL_ITEM_TEMPLATE = 29` |

## Purpose

The core item-template catalog covering every consumable, material, jewel, formula, pet-function item, quest item, and miscellaneous item (non-equipment) in the game. Each row defines the static properties of an item class; per-character ownership is tracked in `TBL_ITEM_INSTANCE` (id 28). The client maintains a secondary index by `name` (`TBL_INDEX_ARRAY[29] = "name"`) and a tertiary index by `type` (`TBL_INDEX_ARRAY3[29] = "type"`), giving fast lookups by both item-name string and item category (`GamePredef.as:8345,8508`). Accessed as `GameData.d[29][id].<field>` and via `_core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][id]` throughout the UI.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up as `GameData.d[29][id]`. Referred to as `tid` / `itemId` in foreign-key references from other tables. |
| `name` | string | Vietnamese display name (e.g. `"Thuốc Viên Bổ Máu"`). Shown in tooltip, bag panel, and item-gain system messages. The secondary index key on this table. |
| `description` | string | Short tooltip subtitle (e.g. `"Thuốc phục hồi sinh mệnh"`). |
| `info` | string | Long-form tooltip body (e.g. `"Khôi phục 300 điểm HP"`). Rendered by `TipItem.as` — may contain duration/effect text. |
| `type` | int | Item sub-category (see distributions). Compared against `GamePredef.ITEM_TYPE_*` constants (`GamePredef.as:1025–1093`). Controls bag-slot styling, use-routing, and which UI panels accept the item. Also used as the tertiary index (`TBL_INDEX_ARRAY3[29] = "type"`). |
| `kind` | int | Item super-category (`ITEM_KIND_*`). `5` = `ITEM_KIND_ITEM` (6226/6468 rows), `14` = `ITEM_KIND_FEATHER` (142), `6` = `ITEM_KIND_MATERIAL` (100). Determines routing in `ToolKit.isLifeMaterial`, `ToolKit.isOriginalMaterial`, `Slot.as:289`, and `TipItem.as:944`. |
| `color` | int | Quality color tier for items that lack an explicit `colorCode`. Scale differs from equipment: `-1` = not applicable/no color (3487 rows), `0` = white, `1` = green, `2` = blue, `3` = purple, `4` = orange. Used in `Slot.as:316` via `setStyleName(_local_1.color)` for jewels. See CLAUDE.md `ItemTemplate.color` note. |
| `colorCode` | int | Display override / glow code. `0` = none (4891 rows). Non-zero values are asset IDs for special glow effects layered on the icon. Takes resolution priority over `color`. |
| `iconCode` | int/string | 13-digit icon asset code passed to `ResManager.getIconUrl(iconCode)` for bag-slot and tooltip icons (`TipItem.as:814`, `SimpleSlot.as:113`). |
| `resCode` | int | 3D/scene asset code for this item when rendered in the world. Passed to `ResManager.getResUrl(resCode)`. |
| `price` | int | NPC buy-back price in gold (store sells to player at `price`; player sells back at `price/4` — see `TipItem.as:723`). `0` = unsellable. |
| `gold` | int | Gold cost override used by specific shop contexts. `0` on 5604/6468 rows; `10` on 421 rows. (inferred from data — low UI usage found; may be a secondary vendor cost field) |
| `honor` | int | Honor-point cost. `0` on all 6468 records in this dump. (inferred from data — no client usage found for this field specifically in TBL_ITEM_TEMPLATE) |
| `tradable` | bool(0/1) | `1` = item can be traded/sold. Drives `vo.costVisible` in `TipItem.as:404,717`, `TipWing.as:760`, `TipEquip.as:1169`. `0` = bound/untradable (5018/6468). |
| `bindType` | int | Binding rule on acquisition: `0` = never binds on pickup (3145), `1` = binds on pickup (3323). Displayed via `GamePredef.PROP_BINDTYPE` array in `TipItem.as:867`, `TipEquip.as:1563`, `TipWing.as:2063`. |
| `stackMax` | int | Maximum stack count per bag slot. `99999` on 5349 rows (consumables/materials stack freely); `1` on 1070 rows (unique/one-per-slot items). |
| `reqLevel` | int | Minimum player level required to use. Shown in tooltip (`TipItem.as:984`). Compared against `_core.player.level`. `0` = no level requirement. |
| `reqClass` | pipe-list | Pipe-delimited class IDs that may use this item, e.g. `"\|1\|2\|3\|4\|6\|5\|"`. Empty string = all classes. Parsed in `TipItem.as:993`, `UserBarCanvas.as:1405,2376`. |
| `itemLevel` | int | Life-skill / material tier (1–6). Used to display bracket suffix `[Nguyên Liệu Cấp {itemLevel}]` in `TipItem.as:430`. Only meaningful when `kind == ITEM_KIND_MATERIAL`. |
| `level` | int | Item tier level — distinct from `reqLevel`. Used in `TipPetStone.as:257,267` for pet-stone ranks. `0` on most non-pet-stone rows. |
| `useType` | int | Who/what the item can be used on. `1` = player only (4710), `2` = pet only (268), `3` = player and pet (82), `4` = specific creature class (1408). Rendered in `TipItem.as:978–1090` via `Language.TIPITEM_S[13–21]`. |
| `skillId` | int | Skill ID triggered on item use. `0` = no direct skill (item effect may be scripted). Read in `UserBarCanvas.as:2653,2671`, `BattleSettingPanel.as:1391`. Cross-references `TBL_SKILL`. |
| `t` | int | Item validity/duration. `-1` = permanent (4360 rows), `0` = permanent (46 rows), positive small values = duration in minutes (`t % 60` for minutes, `t/60` for hours, `t/1440` for days — `TipItem.as:838–842`), large 12-digit values (e.g. `201112291000`) = absolute expiry timestamp in `YYMMDDHHmm` format (`TipItem.as:831`: branch `t <= 100000000000`). For the instance, `inst.t` is a Unix ms timestamp of the actual expiry (`TipItem.as:708`). |
| `propType` | int | Pet-function item property type (e.g. `3` = boost coefficient, `2` = type-change, `7` = star level — `TipItem.as:895,901,907`). `0` = no property (6137/6468). Used together with `proplNum`. |
| `proplNum` | int | Pet-function item property value / count. Meaning depends on `propType`: e.g. divisor for percentage display (`proplNum/100`), creature quality level ID, creature class filter. Used in `TipItem.as:903,909,1075`. |
| `i1` | int | Crafting/recipe ingredient slot 1 — template ID of required item. Non-zero only on `type=502` (food crafting) rows. Read in `LifeSkillPanel.as:2191,2619` as `gameData[29][id].i1`. Cross-references `TBL_ITEM_TEMPLATE`. |
| `i2` | int | Crafting ingredient slot 2 template ID. Paired with `i1`. Read in `LifeSkillPanel.as:2192,2620`. |
| `i3` | int | Crafting ingredient slot 3 template ID. Paired with `i1`. Read in `LifeSkillPanel.as:2193,2621`. |
| `n1` | int | Quantity required for ingredient slot 1 (`i1`). Read in `LifeSkillPanel.as:2194,2622`. |
| `n2` | int | Quantity required for ingredient slot 2 (`i2`). Read in `LifeSkillPanel.as:2195,2623`. |
| `n3` | int | Quantity required for ingredient slot 3 (`i3`). Read in `LifeSkillPanel.as:2196,2624`. |
| `makable` | bool(0/1) | `1` = item can be crafted / appears in the crafting panel (`EquiptFuncPanel.as:11493,11507,13760`). `0` on 6255/6468 rows. |
| `nextJewelTid` | int | For jewel upgrade chains: ID of the next-tier jewel template this one upgrades into. `0` = no upgrade. Used in `EquiptFuncPanel.as:10386`, `WingFuncPanel.as:4084,6072,7494,8968`. Cross-references `TBL_ITEM_TEMPLATE`. |
| `singleFlag` | bool(0/1) | `1` = single-use unique (only one may be owned / equipped at once). `0` on 6410/6468 rows. (inferred from name + data pattern — no direct tooltip client usage found) |
| `isTest` | int | `-1` = live item (6453 rows), `1` = test/dev-only item (14 rows), `0` = unknown (1 row). Items with `isTest=1` should be hidden from normal players. (inferred from data and field name — no direct client branch confirmed) |
| `description` | string | (see above) |

## Value distributions / sentinels

**`type` (top 10 by count):**
| type | Count | Meaning (GamePredef.as constant) |
|---|---|---|
| 550 | 3863 | `ITEM_TYPE_OTHER` — miscellaneous / event items |
| 508 | 1088 | `ITEM_TYPE_QUEST` — quest items |
| 506 | 199 | `ITEM_TYPE_CREBOOK` — creature/pet codex books |
| 505 | 197 | `ITEM_TYPE_SKILLBOOK` — skill books |
| 500 | 189 | `ITEM_TYPE_REEL` — scroll / reel items |
| 516 | 144 | `ITEM_TYPE_FORMULA` — crafting formulas |
| 502 | 143 | `ITEM_TYPE_FOOD` — food items (also used for life-skill crafting) |
| 501 | 106 | `ITEM_TYPE_MEDICINE` — medicines / potions |
| 509 | 103 | `ITEM_TYPE_KEY` — keys |
| 503 | 72 | `ITEM_TYPE_JEWEL` — gems/jewels |
| 1404 | 68 | `ITEM_TYPE_FEATHER_D` — feather grade D |

**`kind`:** `5` (ITEM_KIND_ITEM) = 6226, `14` (ITEM_KIND_FEATHER) = 142, `6` (ITEM_KIND_MATERIAL) = 100.

**`bindType`:** `0` (free) = 3145, `1` (binds on pickup) = 3323.

**`tradable`:** `0` (untradable) = 5018, `1` (tradable) = 1450.

**`useType`:** `1` (player) = 4710, `4` (creature class-specific) = 1408, `2` (pet) = 268, `3` (player+pet) = 82.

**`color`:** `-1` (N/A) = 3487, `4` (orange) = 519, `3` (purple) = 456, `1` (green) = 766, `2` (blue) = 339, `0` (white) = 853, `5` (gold/special) = 48.

**`t` field sentinel logic:** `-1` = permanent (no expiry), `0` = also permanent, `1–100000000000` (100 billion) = duration in minutes decoded as years/months/days/hours/minutes, `> 100000000000` = absolute timestamp in `YYMMDDHHmm` format decoded as a Date object. The 43200-minute value (1398 rows) = 30 days.

**`stackMax`:** `99999` = 5349, `1` = 1070; a handful of values (10, 30, 50, 100) for limited-stack items.

**`honor`:** `0` on all 6468 records — field appears unused/reserved in this version.

## Client usage

- `TipItem.as:813,430,984,993,978,1094` — primary tooltip renderer; reads `name`, `description`, `info`, `t`, `useType`, `reqLevel`, `reqClass`, `tradable`, `propType`, `proplNum`, `itemLevel`, `iconCode`, `f` (inst field).
- `LifeSkillPanel.as:2191–2196,2619–2624` — reads `i1/i2/i3` and `n1/n2/n3` for crafting ingredient display via `gameData[GamePredef.TBL_ITEM_TEMPLATE][id]`.
- `UserBarCanvas.as:2376,2646,2653` — reads `reqClass`, `skillId`, checks item type against `TBL_ITEM_INSTANCE`.
- `EquiptFuncPanel.as:11493,11507,13760` — reads `makable`, `reqClass` for crafting panel filter.
- `EquiptFuncPanel.as:10386` / `WingFuncPanel.as:4084,6072` — reads `nextJewelTid` for jewel-upgrade chain navigation.
- `Slot.as:289,295,316` — uses `type` (jewel check) and `color` (style selection).
- `ToolKit.as:87,250,333` — `isLifeMaterial` / `isOriginalMaterial` use `kind`.
- `CallBack.as:830,1568` — `onAddItem` payload uses short fields (`t`, `i`, `n`, `c`, `q`, `s`, `tt`) that mirror key semantics for the item-gain notification banner.
- `MysteryFurnace.as:1514–1525` — reads `TBL_RECYCLING` indexed by `itemId` / `color` on ITEM_TEMPLATE rows to compute recycle value.
- Loaded into `GameData.d[29][id]` at startup; secondary index by `name`; tertiary index by `type`.

## Related tables

- `skillId` → [[TBL_SKILL]] (skill triggered on use).
- `i1` / `i2` / `i3` → [[TBL_ITEM_TEMPLATE]] self-reference (crafting ingredients).
- `nextJewelTid` → [[TBL_ITEM_TEMPLATE]] self-reference (jewel upgrade chain).
- Foreign-key target: `itemId` / `tid` in [[TBL_RECYCLING]] (`itemId` → this table).
- Foreign-key target: `giid` on `TBL_CHARACTOR_SLOT` when `type == TBL_ITEM_TEMPLATE`.
- Instance rows: [[TBL_ITEM_INSTANCE]] (id 28).
- Equipment equivalent: [[TBL_EQUIPT_TEMPLATE]] (id 30).
