# TBL_GUILD_SLOT

| Property | Value |
|---|---|
| Table ID | 27 |
| Record count | 0 |
| JSON | `docs/database/game_data/TBL_GUILD_SLOT.json` |
| Client constant | `GamePredef.TBL_GUILD_SLOT = 27` |

## Purpose

Runtime guild-warehouse slot table. Each row is one item-slot in a guild's shared bank/warehouse. The number of usable slots is bounded by `TBL_GUILD.bagSlotNum` expanded via the `addGuildBankSlotNum` RPC. The client stores the loaded slots in `DataManager._gsList` keyed by slot `id`.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key — slot row ID. Used as the key in `DataManager._gsList[id]` (`DataManager.as:791`). |
| `gid` | int | Guild ID — foreign key to [[TBL_GUILD]]. Primary index (`TBL_INDEX_ARRAY[TBL_GUILD_SLOT] = "gid"`). Groups all slots belonging to a guild. |
| `sid` | int | Slot position index. Compared against `GamePredef.SLOT_SID_GUILD_BANK[0..4]` to determine which visual slot to populate (`GuildWarehousePanel.as:4338`, `4347`; `CallBack.as:862`). |
| `type` | int | Item slot type flag (same scheme as character inventory slots). Assigned to the rendered slot's `.type` property (`CallBack.as:863`). |
| `itemId` | int | Instance ID of the item occupying this slot (`giid` on the rendered slot). `0` or absent when empty (`CallBack.as:863`; `GuildWarehousePanel.as:4343`). |
| `stackNum` | int | Stack count for stackable items (`CallBack.as:864`). |

## Value distributions / sentinels

Not applicable — empty export; all rows are live-server instances.

## Client usage

- `CallBack.as:859–868` — `onAddGuildSlot(_arg_1)` receives a single slot object (fields: `sid`, `type`, `itemId`, `stackNum`), resolves the UI slot via `_core.view.getSlot(_arg_1.sid)`, sets visual properties, then calls `DataManager.addGuildSlot(_arg_1)`.
- `DataManager.as:784–791` — `addGuildSlot` stores the record in `_gsList[_arg_1.id]`.
- `GuildWarehousePanel.as:4338–4344` — iterates slot records, checks `sid` against `SLOT_SID_GUILD_BANK` bounds, and populates the warehouse grid slots.
- `GuildPanel.as:2020` — `addGuildBankSlotNum` RPC called with `myGuild.id` to purchase an additional bank slot tier.

## Related tables

- `gid` → [[TBL_GUILD]] (owner guild; `bagSlotNum` determines active slot count).
- `itemId` → item instance table (runtime item identity, not a static template).
