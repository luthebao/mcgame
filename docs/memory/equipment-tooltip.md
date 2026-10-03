# Equipment Tooltip Subsystems (TIPEQUIP_S)

Full research: `docs/research/2026-04-01_01_TIPEQUIP_S_TOOLTIP_SYSTEM_RESEARCH.md`

The client tooltip (`TipEquip.as`) renders equipment info from raw server data using `Language.TIPEQUIP_S` (46-entry localization array) with placeholder substitution. The server sends raw fields only; all HTML formatting and text assembly is client-side.

## Soul Activation

Equipment templates define `ActiveEquipID`, `ActivePropType` (1-8), `ActivePropNum`. Server's `BuildEquipActiveList()` checks if the partner equipment is also equipped AND both items have matching `element` values, returns `map[slotID]bool`. Sent at login and refreshed on every equip/unequip via `onEquipActiveList` callback. Client uses TIPEQUIP_S[0] (cyan/active) or [1] (gray/inactive).

## Equipment Stat Bonuses

Research: `docs/research/2026-04-01_03_EQUIP_STAT_BONUSES_RESEARCH.md`

Equipment and detail-panel bonuses now use semantic server stat keys instead of sharing raw client prop ids across systems. Equipment prop ids must be translated with the equipment dictionary (`21 = Stamina`, `22 = Intelligence`, `23 = Energy/Spirit`, `27..29 = crit resist / debuff resist / anti-defy`), while medal/awakening/war-sprite style props use the common detail dictionary (`31`, `32`, `34`, `59..63`, `71`, `72`). Only core stats such as HP/Attack/Defense use multiplicative percent bonuses; crit/defy/final-damage families add rate points. `BuildViewPropertiesWithEquipment` must build from the recomputed character copy so `finalDefy`, `finalPraDef`, `finalEnhPhyHurt`, attribute totals, and other computed `final*` fields do not fall back to stale `char.ToDTO()` values.

## Change Soul (changeSoul / sureChangeSoul)

Research: `docs/research/2026-04-01_02_CHANGE_SOUL_RESEARCH.md`

Players can assign or re-roll soul activation properties via the EquipFunc panel (tab 4). Requires soul material items (template IDs 1659-1662 by equipment level) and 50000 silver per quantity. Two-step flow: `changeSoul` rolls new values and returns preview, `sureChangeSoul` confirms (type "1" first-time only; type "2" re-rolls apply immediately). Handler: `internal/presentation/rtmp/handlers/item/change_soul.go`.

## Element System

Instance-only property (`Properties["element"]`, 0-6). Randomly assigned during crafting/quest/reforge (1-6, excluding neutral). Character element state (`Ee`/`En`/`Ef`) aggregated from all equipped items. Currently cosmetic in combat.

## Signature Set Bonus (Bộ trang bị chữ ký)

Research: `docs/research/2026-04-01_04_MAKER_SET_BONUS_RESEARCH.md`

When all 11 combat slots (0-10) have matching `maker` (signature name) and meet quality thresholds, character gets HP/Attack/MagicAttack percentage bonuses. Server computes `makerActive` (bool) and `qualityType` (int: 10/11/15/16/20) dynamically via `CalculateMakerSet()` in `internal/application/item/maker_set.go`. Bonuses applied through `AggregateEquipmentStats` as percentage bonuses. Client reads from `player.property` and displays in Character Panel.

## Enhancement Subsystems

- **Suit/Set** (`temp.suitId` → `TBL_EQUIPT_SUIT`): 5 activation tiers based on equipped piece count.
- **Jewels/Sockets** (`holeNum`, `t1-t10`): Up to 10 sockets with inlaid jewel template IDs. Inlay via `jewelSet`, remove via `jewelDel`, query via `getJewelData`, and upgrade gems via `JewelUpdateOne`/`JewelUpdateAll`.
- **Sublimation** (`inst.flag` JSON): `sublimeId` + `sublimeElement` → name suffix "+N", two bonus props, element damage bonus.
- **Ky Linh** (`inst.flag2` JSON): 3 enhancement lines with progress coloring. Requires reqLevel > 150, equipment kinds 1-4.
- **Pet Stones** (`inst.flag3` JSON): 6 stone slots for pet equipment only, may grant skill via `TBL_SKILL`.

## Hole (Socket) Equipment System

Equipment can have up to 10 drilled holes, capped by template `HoleNum`. Item properties `t1`-`t10` use `-1` for undrilled, `0` for drilled-empty, and `>0` for the inserted jewel template ID.

RPC methods:

1. `getHoleNum` returns drilled hole count.
2. `holeDig` drills a new hole and costs `2000` gold plus one diamond item with `type = 600`.
3. `getJewelData` returns `{holeNum, t1..t10}`.
4. `jewelSet` inserts jewels from bag into drilled holes.
5. `jewelDel` removes a jewel, charges `20%` of the jewel gold value, and returns the jewel to inventory.

Crafted equipment can roll random pre-drilled holes in `updateEquipmentQuality`, while shared gem stat aggregation is applied through `AggregateEquipmentStats`.

## Equipment Equip/Unequip Flow

### EquipOn

Handler in `internal/presentation/rtmp/handlers/item/equip.go`. Accepts `itemID` and optional `slotID`. Validates item ownership and equippability. If target slot is occupied, automatically moves existing item to bag (displacement). Returns updated equipment list and sends appearance callbacks. Triggers element state update and `onEquipActiveList` refresh.

Service method `EquipItem()` in `internal/application/item/service.go`: validates equipment item type and durability, auto-selects slot from template position when slot is -1, handles special Ring slot logic (positions 7 & 8), displaces existing equipment to bag.

### EquipOff

Accepts slot reference (item ID, slot number, or SID). Finds equipped item, moves to first empty bag slot. Sends appearance unequip callbacks. Updates character element state.

### Appearance Callbacks

Equipment position determines callback type:

- Position 3 (Weapon): `onEquipOn` / `onEquipOff`
- Position 14 (Flyer): `onFlyerOn` (no off callback)
- Position 21 (Dress): `onEquipOn` / `onEquipOff` (with dressFlag=true)
- Position 22 (Wing): `onWingOn` / `onWingOff`

`resolveEquipmentResCode()` checks: ResCodeFemale/Male -> ResCode -> ResCodeFemale2/Male2. Appearance payloads broadcast to both self and scene via `BroadcastToScene()`.

### GetInitSlot

`getInitSlot` RPC retrieves all items for a character, builds full inventory response with bag/equip state. Uses shared `BuildClientItemDTO()` from the display contract.
