# TBL_CHARACTOR_SLOT

| Property | Value |
|---|---|
| Table ID | 9 |
| Record count | 0 (runtime/instance table) |
| JSON | `docs/database/game_data/TBL_CHARACTOR_SLOT.json` |
| Client constant | `GamePredef.TBL_CHARACTOR_SLOT = 9` |

## Purpose

The character's live item/equipment inventory. Each record represents one slot in any of the character's bag or equipment containers, holding a reference to the item or equipment instance occupying that slot. No static rows exist — records are pushed by the server on login (via `initSlotData(_arg_1.i)`) and updated in real time as items are picked up, moved, or consumed. The client's internal slot list is stored as `data.sList` (keyed by slot record `id`), with a bag-slot index built by `initBagSlotIndex()`.

Classification: **runtime / character-scoped inventory instance data**.

## Key reference

Fields confirmed from `CallBack.as:onGetItem()`, `DataManager.as`, and `MailManagerPanel.as`:

| Key | Type | Function |
|---|---|---|
| `id` | int | Slot record ID. Used as the key in `_sList[id]`. |
| `sid` | int | Slot UI position ID — identifies which visual bag/equip slot this item occupies. Passed to `_core.view.getSlot(sid)` to find the UI slot component (`CallBack.as:6805`, `DataManager.as:105/252`). |
| `type` | int | Item table type — indicates which template table the `itemId` references. E.g. `GamePredef.TBL_ITEM_INSTANCE` for consumables, or `TBL_EQUIPT_INSTANCE` for equipment. `DataManager.as:106`, `CallBack.as:6810`. |
| `itemId` | int | The instance or template ID of the item in this slot. Also exposed as `giid` on the UI slot (`CallBack.as:6808`). `DataManager.as:826`. |
| `stackNum` | int | Stack quantity in this slot. Set on the UI slot as `stackNum` (`CallBack.as:6809`). |

Additional fields accessible on the slot data object (from `CallBack.as:6810` trace and `TipItem.as`/`TipEquip.as` usages):

| Key | Type | Function |
|---|---|---|
| `b` | int | Bind state. `0` = unbound, `>0` = bound. Checked in `TipItem.as:431–433`, `TipEquip.as:1213/1901`, `TipWing.as:796/802`, `TipCre.as:1197–1203`. |
| `n` | int | Stack count duplicate (also exposed as `stackNum` on the VO; appears as `.n` on raw slot object in some item-renderer contexts, e.g. `EquipFunc.as:2346/2352`). |

## Client usage

- `CallBack.as:onChooseCharactor()` — `_core.data.initSlotData(_arg_1.i)` populates `_sList` with all initial slot records.
- `CallBack.as:onGetItem():6804–6813` — `addNewData(TBL_CHARACTOR_SLOT, _arg_1)` adds a new slot, then `getSlot(sid)`, sets `type`, `giid`, `stackNum`, `slotData`.
- `DataManager.as:865–873` — `initSlotData(obj)` stores the slot map as `_sList`.
- `DataManager.as:103–107` — reads `sid`, `type`, `tid` from a slot entry when updating item template links.
- `DataManager.as:243/255` — deletes slot entries on item removal.
- `DataManager.as:390/770` — `_sList[item.id] = item` on insert/update.
- `BattleServer.as:37` — `TBL_CHARACTOR_SLOT` listed in `_RECREATE_INDEX_ARRAY` for cross-battle re-indexing.
- `MailManagerPanel.as:2086` — `obj.type = GamePredef.TBL_CHARACTOR_SLOT` when categorising attachment slots.

## Related tables

- `type` resolves to → [[TBL_ITEM_INSTANCE]] or [[TBL_EQUIPT_INSTANCE]] (item or equipment instance lookup).
- `itemId` (when `type = TBL_ITEM_INSTANCE`) → [[TBL_ITEM_TEMPLATE]] via `itemId` index.
- `cid` (implicit, not in wire fields above) — slot records belong to a character → [[TBL_CHARACTOR]].
