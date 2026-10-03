# EXP & Level-Up System

## Centralized EXP Callbacks

`SendExpAndLevelUpCallbacks(sender, char, expGained, leveledUp)` in `internal/presentation/rtmp/utils/exp_helper.go`.

Callback protocol (order matters):

1. `onUPP` -- sends full `char.ToDTO()` with `expSkill` override and nested `property` map with refreshed stats. Must be sent first.
2. `onPlayerLevelUp` (only if leveled up) -- character ID, cumulative `expSkill`, attr points, level.
3. `lvUp` (only if leveled up) -- triggers client level-up effects.

Callers: Quest handler, Chat handler (admin `/stat exp`), Character handler (client `lvUp` RPC).

## Level-Up Stat Refresh Fix

Fixed stale stats in level-up `onUPP` by sending nested property-aware payload. `BuildUPPPayload` helper sends both top-level player fields and nested `property` data with refreshed `final*` fields.

## changeProperty onUPP Noise Fix

`changeProperty` must not send the full top-level `BuildUPPPayload` unchanged. Flash `CallBack.onUPP` treats top-level `bagSlotNum`, `bankSlotNum`, and `petMaxNum` as slot-expansion events and shows mid-screen notices whenever those keys are present, even if the RPC only changed stats. The fix is a stat-refresh-specific payload that keeps the nested `property` map and refreshed stat fields but strips unrelated notice-trigger keys before sending `onUPP`.

## bagSlotNum / bankSlotNum / petMaxNum Semantics

Flash client expects `bagSlotNum` as the number of bag tabs, `bankSlotNum` as the number of bank tabs, and `petMaxNum` as the direct pet-count cap. Server-side code should use `char.MaxBagSlots()` and `char.MaxBankSlots()` when actual slot capacity is needed.

Admin and runtime writes must treat `BagSlotNum` / `BankSlotNum` as the authoritative values. Raw slot totals are derived as `bagSlotNum * 30` and `bankSlotNum * 30`; legacy `bagSlots` / `bankSlots` inputs should only be accepted when they cleanly map back to that 30-slot page size.

The purchasable regular bag count is capped at 7 pages. Bag pages 8 and 9 are the fixed quest-item and pet-item pages and are not part of `bagSlotNum`. Bank count is capped at 5 pages.

## /stat Chat Command

Syntax: `/stat <field> <amount>` where field is `money`, `moneybind`, `gold`, `goldbind`, `exp`, or `level`. `/add` and `/stat` require `character.GMLevel >= 5`.

Callbacks for currency: `onAddMoney(characterID, fieldKey, amount, currentTotal)` and `onUPP({ fieldKey: currentTotal })`. For EXP: `onUPP({"expSkill": amount})`, plus level-up callbacks if applicable. `/stat level <target>` is upward-only, zeroes `expSkill`, and reuses the same `onUPP`, `onPlayerLevelUp`, and `lvUp` callback flow as a normal level-up refresh.

## Character GM Level

Flash client GM badge visibility is driven by `data.gmLevel > 0` in `CharactorInfoPanel`. Server-side `gmLevel` is stored on `player.characters.gm_level`, must be scanned through `player.list_character_details()`, and should be present in both `Character.ToDTO()` payloads and the login `cData` object.

## Gold/GoldBind int4 Overflow Fix

Database columns `gold` and `gold_bind` in `player.characters` were `integer` (int4, max 2,147,483,647). Large gold values from `/stat gold` commands caused persistent save failures blocking all character data for that player.

Fix: migrated both columns to `bigint` (migration `20260403034544_character_gold_bigint.sql`). Updated Go domain model `Gold`/`GoldBind` from `int` to `int64`. Removed unnecessary `int()` casts across shop, quest, trade, pet, and chat handlers.
