# Shop System

## NPC Direct Shop Callback Routing

Direct NPC template shops (`npc.ShopID > 0`) must always use the standard `onOpenShop` callback path from `internal/presentation/rtmp/handlers/npc/npc_click.go`.

`openShopById` is reserved for explicit special-shop scripts such as the handlers in `npc_script.go`. The Flash client binds those callbacks to different data sources:

- `onOpenShop` -> `TBL_SHOP` / `TBL_SHOP_SLOT`
- `openShopById` -> `TBL_CREDIT` / `ViewManager.NPCSHOP_CONFIG`

Shop IDs overlap between those systems, including low IDs such as `2`, so numeric heuristics like `shopID <= 7` are not valid for direct NPC shop routing. That overlap is what caused normal NPC shops such as `Tiệm Thuốc Ông Vương` to open the courage-shop panel (`NPC_SHOP_PANEL[100]`, "Shop Dũng Khí") instead of the standard shop UI.

## Shop Purchase Bag Slot Sync

Shop purchases can touch more than one bag slot in a single operation. A large buy may both fill an existing stack and create one or more remainder slots.

The Flash client only stays visually correct if the server sends `onAddCharactorSlot` for every changed bag slot, not just the last modified item. `internal/application/shop/purchase_sync.go` now snapshots matching bag items by `templateID`, `itemType`, and `isBound`, then returns `AddedItemDTOs` for every changed slot after `BuyItem`, `BuySystemItem`, and `BuySystemItemMulti`.

This keeps immediate shop updates aligned with later `bagSort` results and preserves the bind-state rule: stack only into slots with the same bound/unbound state, and send separate slot updates when the purchase creates a new remainder stack.
