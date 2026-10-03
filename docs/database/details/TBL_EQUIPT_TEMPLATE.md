# TBL_EQUIPT_TEMPLATE

| Property | Value |
|---|---|
| Table ID | 19 |
| Record count | 1872 |
| JSON | `docs/database/game_data/TBL_EQUIPT_TEMPLATE.json` |
| Client constant | `GamePredef.TBL_EQUIPT_TEMPLATE = 19` |

## Purpose

Defines every equippable item template in the game: weapons, armor, jewelry, mounts (flyers), pet equipment, fashion (dress), and wing-class items. The Flash client indexes this table by `type` (`TBL_INDEX_ARRAY[19] = "type"`) and looks up individual records as `GameData.d[19][id]`. It is the primary reference for stat ranges, visual assets, class restrictions, crafting requirements, and the active-property soul system.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up as `GameData.d[19][id]`. Also aliased as `tid` on instance objects (`equIns.tid`). |
| `name` | string | Vietnamese display name (e.g. `"Thanh Đồng Khôi"`). Rendered in tooltip header by `TipEquip.as:1512/1520`. Color-wrapped via `MSG_ITEM_COLOR[temp.color]` if `color >= 0`. |
| `description` | string | Flavour text shown in the item tooltip body (`TipEquip.as:1520`). May contain `\r` for line breaks. |
| `info` | string | Secondary lore text appended below description in the tooltip (`TipEquip.as:1521–1526`). Often empty. |
| `type` | int | Equipment type code. Used as the secondary index. Maps to `ITEM_TYPE_*` constants in `GamePredef.as`. See Value distributions for the full enum. |
| `kind` | int | Equipment kind / slot category. Maps to `ITEM_KIND_*`: 1=MAINHAND, 2=SUBHAND, 3=DEFENCE, 4=JEWELRY, 8=MAGICWEAPON (artifact), 9=PETEQU, 10=FLYER (mount), 11=DRESS (fashion), 12=GATHER, 13=WING, 14=FEATHER. Drives tooltip branching in `TipEquip.as:1152–1633`. |
| `position` | int | Equip slot ID. Mapped to Vietnamese slot names via `GamePredef.EQUIP_POSITION[]` (`GamePredef.as:9856–9884`). See Value distributions. |
| `useType` | int | Who can wear this item. Values: 1=player equipment, 2=pet equipment with class restriction, 3=general equip (no class check), 4=jewelry, 8=fashion, 9=wing/flyer, 10=flyer subtype, 11=dress subtype, 12=gathering tool, 13=gathering tool alt. Drives the class/level requirement branch in `TipEquip.as:1595–1687`. |
| `reqLevel` | int | Minimum player (or pet) level to equip. Displayed red if player level is below it (`TipEquip.as:1598–1604`). |
| `reqClass` | pipe-list | Pipe-delimited class IDs allowed to equip this item (e.g. `"\|1\|"`, `"\|1\|2\|3\|4\|5\|6\|"`). Parsed in `TipEquip.as:1610`. Used for player class restriction. |
| `reqClassId` | pipe-list | Pipe-delimited class IDs for pet/creature restriction (e.g. `"\|2\|3\|4\|"`). Read at `TipEquip.as:1638`. Only set on jewelry and pet-targeted items. |
| `color` | int | Template base color tier (0=White, 1=Green, 2=Blue, 3=Purple, 4=Orange). `-1` means no color override. Client reads via `MSG_ITEM_COLOR[temp.color]` at `TipEquip.as:1178/1510`. Note: scale differs from `ColorCode` used on equipment instances (see CLAUDE.md). |
| `colorCode` | int | Glow/aura code applied to the icon via `ResManager.setColorCode(iconImg, temp.colorCode)` (`TipEquip.as:1519`). `0` = no glow. Non-zero values are item-template IDs or glow preset IDs. |
| `brightCode` | int | Lighting/brightness preset for the item's world sprite. `0` = default. Passed to stage rendering — same field pattern as `TBL_MAP.brightCode`. (inferred from data — no direct equipment-UI usage found; field is present on template and read structurally) |
| `iconCode` | int | Icon asset code. Passed to `ResManager.getIconUrl(temp.iconCode)` (`TipEquip.as:1518`). 13-digit code encoding asset pack, category, and frame. |
| `resCode` | int | World sprite SWF asset code for the item on the game stage. `0` on most armor/jewelry; non-zero on weapons and mounts. |
| `resCodeMale` | int | Male-character body attachment SWF asset code. Used in `CreatureView.as:10006` and `DressDisplay.as:574` gender branching. |
| `resCodeFemale` | int | Female-character body attachment SWF asset code. Used in `CreatureView.as:10010` and `DressDisplay.as:574`. |
| `resCodeMale2` | int | Secondary male SWF code (e.g. alternate skin). Checked against `gameObject.resCode` in `CreatureView.as:9824`. Empty string when unused. |
| `resCodeFemale2` | int | Secondary female SWF code (alternate skin). Checked in `CreatureView.as:9828`. Empty string when unused. |
| `wavCode` | int | Audio/animation code for flyer (mount). Sent to `setFakeFlyerDress` / `unsetFakeFlyerDress` RPCs (`DressDisplay.as:593/597`). Also used as `flyerFrontResCode` in `CallBack.as:5470`. `0` on non-flyer items. |
| `mainProp1` | int | Primary stat type 1. Index into `GamePredef.EQUIPT_PROP_NAME` (e.g. 6=DEFENCE, 4=ATTACK, 20=STRENGTH, 24=HP%). Used to render the base stat range in the tooltip (`TipEquip.as:1187–1193`). |
| `mainPropNum1` | int | Base value for `mainProp1`. Multiplied by quality multiplier range to produce the displayed min–max (`TipEquip.as:1189`). |
| `mainProp2` | int | Primary stat type 2 (second row in tooltip). 0 = none. Same index as `mainProp1`. |
| `mainPropNum2` | int | Base value for `mainProp2`. |
| `prop1` | int | Secondary stat type 1 (bonus stat, shown after main stats). 0 or -1 = none. Uses same `EQUIPT_PROP_NAME` index (`TipEquip.as:1195`). |
| `propNum1` | int | Value for `prop1`. |
| `prop2` | int | Secondary stat type 2. 0 = none. |
| `propNum2` | int | Value for `prop2`. |
| `bindPropNum` | int | Bind bonus multiplier (shown as a percentage bonus on bound items). Displayed only when `slotData.q >= 6` or item is MAGICWEAPON/FLYER (`TipEquip.as:1204–1211`). |
| `bindType` | int | Bind rule: 0=bindable (normal), 1=permanently bound (BoP). Displayed via `GamePredef.PROP_BINDTYPE[temp.bindType]` (`TipEquip.as:1563`). Empty string treated as 0. |
| `endureMax` | int | Maximum durability of the template. Shown in tooltip as `{endureMax}` via `Language.TIPEQUIP_S[13]` (`TipEquip.as:1557`). Not shown for DRESS-kind items. |
| `holeNum` | int | Max number of jewel socket slots this template can have. Almost always 0 in the template; actual socket count lives on the instance (`inst.holeNum`). The single record with `holeNum=1` is an outlier. |
| `suitId` | int | Set/suit ID. `0` = no set. Non-zero links to [[TBL_EQUIPT_SUIT]] for set bonus display (`TipEquip.as:3419–3508`). |
| `activeEquipId` | int | Template ID of the required companion equipment to activate this item's soul property. When non-zero, the client fetches the companion template from `TBL_EQUIPT_TEMPLATE[activeEquipId]` (`TipEquip.as:3407–3416`). |
| `activePropType` | int | Soul property type ID. Maps to `GamePredef.EQUIPT_ACTIVE_*`: 1=ATTACK, 2=MATTACK, 3=CRITICAL, 4=DEFY, 5–7=REDUCEHURT variants, 8=HP (`GamePredef.as:1360–1367`). 0=no active prop. |
| `activePropNum` | int | Soul property magnitude (percentage shown as `{activePropNum}%`). Read on the instance in `TipEquip.as:2590/2605`. |
| `artifactSkill` | pipe-list | Artifact (magic weapon) skill chain in `"skillId\|stage-level\|stage-level\|..."` format. E.g. `"4879\|7-2\|7-3\|7-4"`. Parsed in `TipEquip.as:2954` and `SkillManager.as:992`. Empty on non-artifact equipment. |
| `nextEquTid` | int | Template ID of the upgraded version of this item. `0` = final tier. `-1` = one-way terminal. Used by `EquipFunc.as:3982` and `EquiptFuncPanel.as:8166` for the level-up preview. |
| `makable` | bool(0/1) | Whether this item can be crafted at the forge. `1` = craftable. Fetched in crafting panel context. |
| `succRate` | float | Base crafting success rate (%). `0` on most items; non-zero values (e.g. 70, 80, 95, 100) appear on craftable items. Used by `ProductPanel.as` crafting flow. |
| `proTime` | int | Crafting production time in seconds. `ProductPanel.as:866` sets `timer.repeatCount = proTime * 10`. 0 or empty = instant. |
| `requireItem1` | int | Item template ID of crafting material 1 (→ [[TBL_ITEM_TEMPLATE]] or [[TBL_EQUIPT_TEMPLATE]]). `0` = not required. Read by `EquipFunc.as:3990`. |
| `requireNum1` | int | Quantity required of `requireItem1`. |
| `requireItem2` | int | Crafting material 2 template ID. |
| `requireNum2` | int | Quantity of `requireItem2`. |
| `requireItem3` | int | Crafting material 3 template ID. |
| `requireNum3` | int | Quantity of `requireItem3`. |
| `repairable` | bool(0/1) | Whether durability can be repaired at a blacksmith. `1` = repairable (most items). |
| `tradable` | bool(0/1) | Whether the item can be traded or listed on the auction house. Controls `vo.costVisible` in `TipEquip.as:1169/1854`. |
| `stackMax` | int | Maximum stack size in inventory. Always `1` for equipment (equipment instances never stack). |
| `price` | int | Silver coin (money) price when sold in a system shop. Used in shop slot tooltip rendering (`TipEquip.as:1578`). |
| `gold` | int | Gold coin (premium currency) price in shop contexts (`TipEquip.as:1583`). 0 = not sold for gold. |
| `honor` | int | Honor currency price (used in honor shops). `ShopSlot.as:793`, `WaWaSlot.as:642`. |
| `itemLevel` | int | Internal item power level. Used for gear-level calculations and filters. |
| `isTest` | int | Test/debug flag. `-1` = live item (normal). `1` = test-only item (12 records). Test items may be hidden from normal UI. |
| `t` | int | Time-limited expiry duration in **minutes**. `-1` = permanent. Parsed in `TipEquip.as:1522–1533` into days/hours/minutes for display (divides by 1440 for days, 44640 for months, etc.). E.g. 43200 = 30 days, 10080 = 7 days, 1440 = 1 day. |
| `singleFlag` | int | (inferred from data — no client usage found) Possible server-side flag controlling drop/reward singularity. Values observed: -1 (empty/none, 1788), 0 (rare override), 1–4 (category codes). |

## Value distributions / sentinels

**`type`** — Equipment type codes (maps to `ITEM_TYPE_*` in `GamePredef.as`):

| Type | ITEM_TYPE constant | Count | Category |
|---|---|---|---|
| 100–105 | HAMMER/STICK/GUN/SWORDONE/GUITAR/BAT | 17 each | Main-hand weapons |
| 200–205 | SHIELD/BOOK/CUFF/KNIFE/PICK/GLOVE | 17 each | Off-hand / sub-hand |
| 300–305 | HAT/CLOTHES/TROUSERS/BELT/SHOE/SHOULDER | 97 each | Armor set |
| 400–403 | NECKLACE/RING/JEWELRY1/JEWELRY2 | 34–37 | Jewelry |
| 800 | MAGICWEAPON | 6 | Artifact weapon |
| 801 | (artifact sub-type) | 15 | |
| 900–905 | PETEQU_SPUR/NECK/BELL/WING/ARMOR/CUFF | 18 each | Pet equipment slots |
| 906–907 | PETEQU_DRAGON1/2 | 232 each | Pet dragon-type equipment |
| 1000 | ITEM_TYPE_FLYER_SUBTYPE | 90 | Mounts/flyers |
| 1100 | ITEM_TYPE_DRESS_SUBTYPE | 238 | Fashion items |
| 1200–1201 | GATHER_GLOVE/ROD | 6/12 | Gathering tools |
| 1300 | WING | 10 | Wing items |

**`position`** — Equip slot index (mapped via `GamePredef.EQUIP_POSITION[]`):

| Position | Count | Meaning |
|---|---|---|
| 1–12 | 97 each | Standard player armor/weapon/jewelry slots |
| 3 | 102 | (one extra row — helmet has extra count due to multi-type) |
| 6, 11 | 33 each | Specific armor slots |
| 13 | 18 | Gathering tool slot |
| 14 | 90 | Flyer/mount slot |
| 15 | 6 | Magic weapon slot |
| 16–20 | 3 each | Feather slots 1–5 |
| 21 | 238 | Fashion/dress slot |
| 22 | 10 | Wing slot |
| 50–57 | 18–232 | Pet equipment slots (6 basic + 2 dragon types) |

**`kind`** (ITEM_KIND_* enum):
- 1 MAINHAND ×102, 2 SUBHAND ×102, 3 DEFENCE ×582, 4 JEWELRY ×137, 8 MAGICWEAPON ×21, 9 PETEQU ×572, 10 FLYER ×90, 11 DRESS ×238, 12 GATHER ×18, 13 WING ×10.

**`useType`**: 1×102, 2×102, 3×582, 4×137, 8×21, 9×572, 10×90, 11×238, 12×18, 13×10.

**`color`**: `-1` (no override) ×1516, `0`–`4` (White/Green/Blue/Purple/Orange) ×356 total.

**`bindType`**: `0` (bindable) ×1752 (plus 108 empty = also `0`), `1` (permanently bound) ×12.

**`makable`**: `0` (not craftable) ×956, `1` (craftable) ×916.

**`tradable`**: `1` (tradable) ×1755, `0` (non-tradable) ×117.

**`isTest`**: `-1` (live) ×1860, `1` (test-only) ×12.

**`t`** (time-limited expiry, minutes): `-1` (permanent) ×1572, `0` (non-expiring variant) ×63, then 43200×111 (30 days), 21600×43 (15 days), 10080×14 (7 days), 1440×22 (1 day), etc.

**`activePropType`**: `0` (no soul prop) ×956, `1` ×136, `2` ×153, `3` (CRITICAL) ×627.

**`singleFlag`**: `-1` ×1572 (most items, treated as none), `0` ×63, `1/2/3/4` ×small counts.

## Client usage

- **`TipEquip.as`** (primary consumer) — reads almost every field to render the equipment tooltip. Branches on `kind`, `useType`, `color`, `colorCode`, `mainProp1/2`, `prop1/2`, `bindPropNum`, `reqLevel`, `reqClass`, `reqClassId`, `endureMax`, `bindType`, `position`, `tradable`, `price`, `gold`, `t`, `suitId`, `activeEquipId`, `activePropType`, `artifactSkill`, `description`, `info`.
- **`EquipFunc.as`** — crafting UI reads `requireItem1–3`, `requireNum1–3`, `nextEquTid`, `makable`. Also reads `activePropNum`, jewel-related fields, `binded`.
- **`EquiptFuncPanel.as`** — equipment upgrade panel uses `nextEquTid` for preview.
- **`ProductPanel.as:866`** — `proTime` drives the crafting progress timer.
- **`Slot.as:1095`** — `equTmp = GameData.d[19][equIns.tid]` to load template from instance.
- **`DressDisplay.as:574`**, **`DressPanel.as:2786`** — `resCodeMale/Female` for gender-aware avatar display.
- **`CreatureView.as:9824/9828/10006/10010`** — `resCodeMale/Female/Male2/Female2` for in-world creature appearance.
- **`DressDisplay.as:593/597`**, **`CallBack.as:5470`** — `wavCode` for flyer animation.
- **`ShopSlot.as:793`**, **`WaWaSlot.as:642`**, **`LimitShopSlot.as:788`** — `honor` price in honor shops.
- **`SkillManager.as:992/1331`** — `artifactSkill` parsed for artifact skill tree rendering.
- **`TipEquip.as:3407–3421`** — `activeEquipId` triggers async load of companion template; `suitId` triggers async load of set data.
- Secondary index `TBL_INDEX_ARRAY[19] = "type"` means `GameData.d[19]` is also keyed by type for bulk filtering.

## Related tables

- `suitId` → [[TBL_EQUIPT_SUIT]] (set bonus data).
- `activeEquipId` → self-reference [[TBL_EQUIPT_TEMPLATE]] (soul companion equipment).
- `requireItem1–3` → [[TBL_ITEM_TEMPLATE]] (crafting materials).
- `artifactSkill` skill IDs → [[TBL_SKILL]].
- Equipment instances that reference this table: [[TBL_EQUIPT_INSTANCE]] (via `inst.tid`).
- Jewel sockets: [[TBL_EQUIPT_JEWEL]] (keyed by equipment instance ID).
- `reqClass` class IDs → [[TBL_CLASS]].
- `reqClassId` creature class IDs → [[TBL_CREATURE]].
