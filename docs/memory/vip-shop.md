# VIP Shop

## Wire Contract (Flash client expects, unchanged)

The Flash VIP shop panel uses direct responder results, not named callbacks, for its main RPC payloads.

- `getVipShopConfig` returns `{flag, vipShop, reflashTime, shopDynamic}` — shared 4h rotation visible to every active VIP.
- `getVipShopCharConfig` returns the same shape — personal refresh, overrides the shared rotation only for the calling character.
- `buyVipShopItem(slotId, num)` returns `{flag, shopDynamic}`. `num` is server-clamped to 1.

Required out-of-band callbacks:

- VIP refresh that debits gold also sends `onUPP({"gold": newGold})`. Free first-of-day refresh skips `onUPP`.
- VIP purchase also sends `onUPP`, `onAddItem`, one `onAddCharactorSlot` per modified bag slot, and `onBlueMsg` (success) or `onRedMsg` (failure).

Slot DTO keys (camelCase, matches client game data shape):

- `id`, `sid`, `st`, `position`, `type`, `itemId`
- `quality`, `q`
- `money`, `gold`, `priceAll`, `point`, `amount`
- `pType1`, `pNum1`, `pType2`, `pNum2`
- `sale`, `gt`, `r`
- `flag` for sold-out state

Important: `gold` is the **already-discounted** final price. `priceAll` carries the un-discounted base for clients that may render a strikethrough later (the current panel only displays `gold`).

`shopDynamic` rows include `cid`, `cName`, `type`, `itemId`, `num`, `time`. Global ring buffer of 20 entries, in-memory.

Catalog source:

- `GamePredef.VIP_SHOP_ID = 99`
- VIP selections come from `TBL_SHOP_SLOT` rows where `sid = 99` and `st != 5`.

## Server-Side Behavior (post 2026-05-11 refactor)

### Currency policy: gold-only (no bound gold, no special currencies)

- VIP purchases always debit `char.Gold`. Bound-gold (`Gt=1`), `PType1/PType2`, and `money` price columns are intentionally ignored on this path.
- `BuyResult.CurrencyType` is hard-coded to `4` (gold) so the handler always sends `onUPP({"gold": newGold})` and the success line shows "Vàng".
- `vipShopCurrencyType = 4` constant lives in `vip_buy.go`.

### Shared rotation

- **Every 4 hours** in Asia/Saigon civil time. Buckets: `00 04 08 12 16 20`.
- `rotation_epoch = unix_ms(bucket_start)`.
- Deterministic 6-slot Fisher-Yates selection seeded with `fnv64a("vip_shop_global:" + epoch)`.
- Persisted as a singleton row in `shop.vip_shop_rotation` (PK `id=1` with check constraint).
- Reseed (when epoch advances) prunes stale `vip_shop_character_override` and `vip_shop_character_purchase` rows in the same SQL function.

### Per-VIP-tier discount (aggressive top-tier curve)

- VIP1 → 2%, VIP2 → 4%, VIP3 → 8%, VIP4 → 12%, VIP5 → 18%
- VIP6 → 25%, VIP7 → 33%, VIP8 → 42%, VIP9 → 50%
- Formula: `floor(baseGold * (100 - %) / 100)` with `min 1` when base > 0.
- Applied server-side by `applyDiscount` in `internal/application/shop/vip_discount.go`. The discount table itself is the user contribution: change tiers there in one place.

### Personal refresh budget (free-1 + 4×20g + cap)

- 1st refresh of the civil day (Asia/Saigon): **free**.
- Refreshes 2 through 5: **20 gold** each.
- 6th refresh and beyond: rejected with `ErrVIPShopRefreshCapReached` → `onRedMsg("Bạn đã làm mới shop VIP đủ số lần hôm nay.")`.
- Counter persisted in `shop.vip_shop_refresh_counter`. Resets at 00:00 Asia/Saigon. Restart-safe.
- Cost decision lives in `nextRefresh(usedToday)` (`vip_refresh.go`). Pure function, no clock or DB.

### Schema (new `shop` schema, migration `20260511005538_vip_shop_schema.sql`)

- `shop.vip_shop_rotation` — singleton (id=1) with `rotation_epoch`, window, slot ids, seed.
- `shop.vip_shop_character_override` — per-character override (PK `character_id`, FK to `player.characters`).
- `shop.vip_shop_character_purchase` — sold-out marker keyed by `(character_id, rotation_epoch, shop_slot_id)`.
- `shop.vip_shop_refresh_counter` — per-character daily counter, PK `(character_id, day_bucket)`.

### Stored procs (security invoker, schema-qualified)

- `shop.fn_get_or_seed_rotation(epoch, starts, ends, seed, slot_ids[])` — idempotent reseed under EXCLUSIVE table lock; cleans stale overrides/purchases.
- `shop.fn_apply_personal_refresh(character_id, rotation_epoch, slot_ids[], day_bucket, max_per_day)` — atomic counter cap-check + increment + override upsert + purchase reset. Returns `(allowed, new_count)`.
- `shop.fn_record_purchase(character_id, rotation_epoch, slot_id, amount)` → `boolean` (true if newly inserted, false on conflict).

## Activity Icon Visibility (unchanged)

The VIP shop launcher icon on the main HUD is gated by `startedActList`, not by `getVipShopConfig`.

- Login `startedActList` includes entry id `19` (`GamePredef.VIP_SHOP_PANEL`) with `flag = true`.
- Already wired server-side; refactor did not touch this path.

## Files of Interest

- `internal/application/shop/vip.go` — entry points: `GetVIPShopConfig`, `RefreshVIPShopConfig`, `BuyVIPShopItem`.
- `internal/application/shop/vip_dto.go` — slot DTO builder (applies discount, sets `priceAll`).
- `internal/application/shop/vip_buy.go` — gold-only VIP purchase path (separate from regular `BuyItem`).
- `internal/application/shop/vip_rotation.go` — 4h boundary math, deterministic selection.
- `internal/application/shop/vip_discount.go` — discount table (USER contribution).
- `internal/application/shop/vip_refresh.go` — refresh budget policy (USER contribution).
- `internal/application/shop/vip_repository.go` — interface only.
- `internal/infrastructure/persistence/postgres/vipshop_repository.go` — pgx implementation.
- `internal/presentation/rtmp/handlers/shop/vip.go` — handler + Vietnamese message mapping (`vipConfigErrorMessage`, `vipRefreshErrorMessage`, `vipBuyErrorMessage`). All `onRedMsg` / `onBlueMsg` strings on this path are Vietnamese.

## Sentinels (use `errors.Is`, never string-match)

- `appshop.ErrVIPShopMembershipRequired` — character is not an active VIP. Routed to a specific Vietnamese message in all three error helpers.
- `appshop.ErrVIPShopRefreshCapReached` — daily 5-refresh cap.
- `appshop.ErrVIPShopInsufficientGold` — gold check failed (refresh paid tier or item purchase).
- `appshop.ErrVIPShopSlotNotAvailable` / `appshop.ErrVIPShopSlotAlreadyPurchased` — purchase-time invariants.

## Companion Docs

- Plan: `docs/plans/2026-05-11_01_VIP_SHOP_REFACTOR.md`
- Research: `docs/research/2026-05-11_01_VIP_SHOP_FLASH_CLIENT_RESEARCH.md`
