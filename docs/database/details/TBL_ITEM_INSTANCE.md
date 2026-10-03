# TBL_ITEM_INSTANCE

| Property | Value |
|---|---|
| Table ID | 28 |
| Record count | 0 (empty export — runtime/instance table) |
| JSON | `docs/database/game_data/TBL_ITEM_INSTANCE.json` |
| Client constant | `GamePredef.TBL_ITEM_INSTANCE = 28` |

## Purpose

Per-character runtime table holding every consumable, material, formula, jewel, and miscellaneous item currently in a player's bag. No static rows exist — the JSON export is empty because all rows are created and destroyed during gameplay. The server sends instance data via callbacks (`onGetItem`, `onCreateItemInstance`) and the client caches them in `gameData[28][id]` keyed by instance `id`. This table is distinct from [[TBL_EQUIPT_INSTANCE]] (id 27) which holds equipment instances. The client's secondary index is not set (`TBL_INDEX_ARRAY[28] = null`); all lookups are by `id` directly, typically through `slot.slotData.itemId` → `getData(28, itemId)`.

## Classification

- **Scope:** character-scoped (one set per logged-in character, cleared on logout).
- **Lifecycle:** populated by `onGetItem` / `onCreateItemInstance` server pushes; individual slots are cleared or updated by buy/sell/use/drop callbacks.
- **Link type:** `LINK_TYPE_ARRAY[28] = "IT"` (`GamePredef.as:8556`).

## Fields confirmed from .as usage

| Field | Type | Confirmed in | Semantic meaning |
|---|---|---|---|
| `id` | int | `DataManager.as:148` — `gameData[28][_arg_2.id]`; `Slot.as:990` — `slot.slotData.itemId` → `getData(28, itemId)` | Primary key of this item instance. Used as the lookup key in `gameData[28]`. |
| `tid` | int | `Slot.as:995` — `getGameData(TBL_ITEM_TEMPLATE, inst.tid)` | Template ID — foreign key into [[TBL_ITEM_TEMPLATE]]. Identifies what kind of item this is. |
| `t` | int/timestamp | `TipItem.as:706,708` — `new Date(Number(_arg_1.inst.t))` | Per-instance expiry: Unix millisecond timestamp of when this item expires. `0` or absent = permanent. Distinct from `temp.t` (the template's duration in minutes). |
| `color` | int | `TipItem.as:747` — `GamePredef.MSG_ITEM_COLOR[_arg_1.inst.color]` | Display color tier applied to this specific instance (e.g. for material quality). Same `0–5` scale as `ItemTemplate.color`. |
| `binded` | int | `TipItem.as:724,737,748` — `_arg_1.inst.binded > 0` | Bind status of this instance. `0` = unbound (freely tradable), `> 0` = bound. Shown as "Đã khóa" / "Chưa khóa" in tooltip. |
| `f` | string | `TipItem.as:1094,1110` — `inst.f.indexOf("tipFormat")`, `call("getItemInst_f", ..., inst.id)` | Optional tooltip-format override string. When present and contains `"tipFormat"`, triggers an RPC to fetch extended tooltip data from the server. |
| `sid` | int | `CallBack.as:6805` — `_core.view.getSlot(_arg_1.sid)` | Slot index in the player's bag where this item is placed. |
| `type` | int | `CallBack.as:6806,6814` — `_local_2.type = _arg_1.type`; branch on `type == TBL_ITEM_INSTANCE` | Table-type tag (`28` = TBL_ITEM_INSTANCE). Used by slot rendering code to decide which tooltip and drag handler to use. |
| `itemId` | int | `CallBack.as:6807` — `_local_2.giid = _arg_1.itemId` | Alias/synonym for `id` as transmitted in `onGetItem` payload. Set as `slot.giid`. |
| `stackNum` | int | `CallBack.as:6808` — `_local_2.stackNum = _arg_1.stackNum` | Current stack count of this item in the slot. |
| `b` | int | `TipItem.as:431,433` — `slotData.b > 0` → "Đã khóa" | Short-form bind flag on `slotData` (same semantic as `binded`; `slotData` is the raw server payload, `inst` is the cached `gameData[28]` object). |
| `q` | int | `TipItem.as:413,415` — `slotData.q` → `getColorByQuality` | Quality value on `slotData`; used for material color. |
| `st` | int | `TipItem.as:435` — `slotData.st == 3` | Slot state flag. `3` = limited-shop purchase slot (triggers remaining-stock fetch via `getRemainShopConfig` RPC). |
| `amount` | int | `TipItem.as:443` — `slotData.amount` | Remaining purchase limit for `st == 3` (limited-shop) items. |

### Short-field names used in `onAddItem` notification payload

When the server sends the item-gained banner notification (`onAddItem`, `CallBack.as:804`), it uses abbreviated field names for the lightweight descriptor object:

| Short field | Full meaning |
|---|---|
| `t` | Table type (`TBL_ITEM_TEMPLATE` or `TBL_ITEM_INSTANCE`) |
| `i` | Item template/instance ID |
| `n` | Item display name |
| `c` | Color code (`>= 0` = explicit color, `-1` = compute from `q`) |
| `q` | Quality value |
| `s` | Stack count (appended to notification string, `CallBack.as:847`) |
| `tt` | Item kind (`ITEM_KIND_*`) |

## Client usage

- `CallBack.as:6302` (`onCreateItemInstance`) — `addNewData(28, _arg_1)` caches a new instance.
- `CallBack.as:6802–6818` (`onGetItem`) — stores slot data in `TBL_CHARACTOR_SLOT`, sets `slot.giid = itemId`, `slot.slotData = _arg_1`; also calls `addNewData(28, ...)` indirectly when `type == 28`.
- `DataManager.as:134–156` (`addNewData`) — stores `gameData[28][_arg_2.id] = _arg_2` and fires a `GameDataEvent`.
- `Slot.as:990,995` — when a bag slot contains a `TBL_ITEM_INSTANCE` item, fetches via `getData(28, slotData.itemId)` then looks up template via `getGameData(29, inst.tid)`.
- `TipItem.as:706–748,1094,1110` — reads `inst.t`, `inst.color`, `inst.binded`, `inst.f`, `inst.id` to render the item tooltip expiry, color, bind status, and optional server-fetched extended tip.
- `TipItem.as:413–450` — reads `slotData.q`, `slotData.b`, `slotData.st`, `slotData.amount` from the slot's cached server payload.
- `UserBarCanvas.as:2646` — branches on `type == TBL_ITEM_INSTANCE` to determine item hotbar behavior.
- `PortraitCanvas.as:421,1116` — checks buff/portrait slot type; if `type == TBL_ITEM_INSTANCE`, calls `getData(28, itemId)` for tooltip.
- `BattleCreatureView.as:951` — reads item instance for battle-item resolution.
- `ToolTipUtil.as:83,258` — dispatches `case TBL_ITEM_INSTANCE` to `TipItem` tooltip renderer.

## Related tables

- `tid` → [[TBL_ITEM_TEMPLATE]] `id` (template definition).
- `sid` → `TBL_CHARACTOR_SLOT` `id` (bag slot position).
- Equipment equivalent: [[TBL_EQUIPT_INSTANCE]] (id 27).
- Template equivalent: [[TBL_ITEM_TEMPLATE]] (id 29).
