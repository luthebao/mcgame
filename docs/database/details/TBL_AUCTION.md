# TBL_AUCTION

| Property | Value |
|---|---|
| Table ID | 1 |
| Record count | 0 (runtime table) |
| JSON | `docs/database/game_data/TBL_AUCTION.json` |
| Client constant | `GamePredef.TBL_AUCTION = 1` |

## Purpose

A runtime instance table holding active auction listings on the auction house. No static rows exist; all rows are created and destroyed at runtime by the server as players list and close auctions. The client's GameData slot 1 is populated by the server's `auctionSearch` RPC response and updated by auction callbacks. Three indexes are registered: primary `ownerId`, secondary `itemKind`, tertiary `itemType` (`GameData.as:8317, 8405, 8480`) to support the auction search UI's filtering.

## Key reference

Fields confirmed from `AuctionPanel.as` client usage (runtime objects, not static schema):

| Key | Type | Function |
|---|---|---|
| `id` | int | Auction listing ID. Used for bid/cancel RPCs: `auctionBid(id, amount)`, `auctionBidMax(id)`, `cancelAuction(id)`. |
| `ownerId` | int | Seller's character ID (primary index key, `GameData.as:8317`). Used to identify the player's own listings in "my auctions" panel. |
| `auctionType` | int | Currency type for bidding: `1`=money (silver), `2`=gold (premium). |
| `nowMoney` | int | Current bid in money. Cast with `Number()` on receipt (`AuctionPanel.as:1493`). |
| `nowGold` | int | Current bid in gold. |
| `maxMoney` | int | Buy-now price in money (`0`=no buy-now). |
| `maxGold` | int | Buy-now price in gold. |
| `itemKind` | int | Item category kind code (secondary index key, `GameData.as:8405`). Corresponds to `GamePredef.ITEM_KIND_*`. |
| `itemType` | int | Item type sub-code (tertiary index key, `GameData.as:8480`). |
| `itemId` | int | The item instance/template ID being auctioned. |
| `slotId` | int | The inventory slot ID of the item in the seller's bag (`AuctionPanel.as:1713`). |
| `duration` | int | Auction duration in hours, chosen by seller at listing time (`AuctionPanel.as:1728`). |
| `name` | string | Item name (used in sort comparator `AuctionPanel.as:934`). |

## Client usage

- `AuctionPanel.as` (primary UI) — renders search results in `resultDataGrid`. Sends: `auctionSearch`, `auctionBid`, `auctionBidMax`, `auctionAdd` (new listing), `cancelAuction` RPCs. Reads `auctionType`, `nowMoney`, `nowGold`, `maxMoney`, `maxGold`, `itemKind`, `itemType`, `id`, `slotId`, `itemId`, `duration`, `name`.
- `PMAuctionPanel.as` — alternative auction panel (likely for a different server line / PvP mode), same field set.
- `GameData.as:8317, 8405, 8480` — registers three indexes (`ownerId`, `itemKind`, `itemType`) on slot 1.

## Related tables

- `itemKind` + `itemType` → classification matches TBL_ITEM_TEMPLATE / TBL_EQUIPT_TEMPLATE taxonomy.
- `ownerId` → character ID (not a static table; live player session).
