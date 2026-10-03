# Star System (Cung Hoàng Đạo)

## Scope

Character zodiac stars — 12 zodiac signs × 12 levels = 144 catalog rows in `data.data_tbl_stars_template`. Each upgrade is gold-costed and time-gated. **Distinct from equipment star upgrade** (which lives in `internal/application/item/equip_stats.go` and applies per-item).

Implementation reference: `docs/research/2026-05-05_02_STAR_SUBSYSTEM_RESEARCH.md` (Phase K1 research).

## Storage

State persists via the shared stat-feature plumbing. Catalog row `data.data_tbl_stat_feature` id=17:

- `feature_key='stars'`
- `state_key='starsData'`
- `state_table='player.character_stat_features'` (JSONB row)
- `bonus_strategy='stars_now_map'` — server aggregates each slot's `level`-driven `addValue * addition` bonus.
- `bonus_ready=1` — combat-ready stat bonus aggregation lives in `statfeature.applyStarsBonus` (`internal/application/statfeature/character.go`).

JSONB shape under `player.character_stat_features`:

```json
{ "1": {"tid":..., "level":..., "addition":..., "finishDate":...},
  "2": {...}, ..., "12": {...} }
```

`tid` is the catalog row id at the slot's current level. `finishDate` is unix-ms; `0`/absent means no upgrade in progress. `addition` is `float64` (was `int`; legacy 0 values are coerced to 1.0 on decode).

## StarPnt Currency

`StarPnt` (Điểm Tinh Cung) uses the GameKV currency system. No stored-procedure changes needed.

- Constant: `CurrencyStarPnt = 240` in `internal/domain/character/character.go`
- Field: `StarPnt int` on `Character` struct (after `StoneSealPoint`)
- Registered via `registerIntGameKV` in `internal/domain/character/currency_keys.go`
- Descriptor: `ClientKey: "starPnt"`, `Label: "Điểm Tinh Cung"`
- Persisted via `player.upsert_character_currency` (same as all GameKV currencies)
- Login: `cData["starPnt"] = char.StarPnt` in `login.go`

## GamePredef Constants (from GamePredef.as lines 2121–2150)

```
STAR_ADDITION_BASIC_SUCCESS = [1, 0.045, 0.0225, 0.01125, 0.005625]  // indexed by colorTier 0–4
STAR_ADDITION_BASIC_MONEY = {1:300, 2:4500, ...}  // keyed by star TYPE 1–12 (not colorTier!)
STAR_SPEED_UP_ITEM_IDS = {1:3316, 2:3317, ...12:3327}  // templateIDs
ITEM_TYPE_STAR_ADD = 551
ITEM_TYPE_STAR_SPEED = 552
STAR_ADDITION_COLOR = [1,2,3,4,5]
```

colorTier derivation: `for i, threshold in STAR_ADDITION_COLOR: if addition <= threshold: return i`

## Login wiring

`starsData` in login payload comes from `h.starService.Load()` called in `buildChooseCharacterPayload()`. Auth handler has `starService *appstar.Service` field and `SetStarService` setter. Both construction sites in main.go call `authHandler.SetStarService(starService)` after creating starService.

## Application service

`internal/application/star/`:

- `service.go` — `Service` with `Load`, `Begin`, `Finish`, `Cancel`. Now includes `itemService *appitem.Service`, `rng *rand.Rand`. `SetItemService(svc)` setter. `StarSlot.Addition` is now `float64`.
- `encoding.go` — JSONB ↔ `StarsState` codec. `defaultState()` uses `Addition: 1.0`. Decodes with legacy fallback: `if addition <= 0 { addition = 1.0 }`. Has `float64From()` helper.
- `predef.go` — star constants from GamePredef.as: `starAdditionSuccessRates`, `starAdditionColorThresholds`, `starAdditionBasicMoney` (by star type 1–12), `starSpeedUpItemIDs`, `colorTierFromAddition()`.
- `speedup.go` — `SpeedUp(ctx, charID, starType, itemID)`: consumes speed-up item (by itemID if >0 else by template), sets slot.FinishDate = now-1ms.
- `addition.go` — `AddAddition(ctx, charID, starType, quantity, itemID)`: consumes `quantity` add-items by instance ID, charges silver = `round(BASIC_MONEY[starType] × 20 × rate × addition)`, rolls one Bernoulli trial vs `rate = min(BASIC_SUCCESS[tier] × quantity + ADD_SUCCESS[tier], 1.0)` (`computeAdditionRate` in `predef.go`). Quantity is clamped to `StarAdditionMaxQuantity = 9999`. On success `slot.Addition += 0.05`, capped at 5.0. Returns `*AddAdditionResult{Consumed, Rate, MoneyCost, …}`. Mirrors `StarAdditionPanel.as:651-700`.
- `exchange.go` — `Exchange(ctx, charID, sourceItemID, targetTemplateID, num)`: consumes `num` of source item, awards `num` of target speed-up item (ItemTypeConsumable). Returns `*ExchangeResult`.

### RPC handlers

`internal/presentation/rtmp/handlers/star/`:

| File          | RPC                | Status                                   |
|---------------|--------------------|------------------------------------------|
| `handler.go`  | `beginStarLvUp`    | ✅ implemented                            |
| `handler.go`  | `finishStarLvUp`   | ✅ implemented                            |
| `handler.go`  | `cancelStarLvUp`   | ✅ implemented                            |
| `speedup.go`  | `speedUpStarLvUp`  | ✅ implemented (was placeholder)          |
| `addition.go` | `addStarAddition`  | ✅ implemented (server-push onAddStarAddition) |
| `exchange.go` | `pmStarExchage`    | ✅ implemented (intentional typo)         |

`Handler` struct now has `itemService *appitem.Service` and `SetItemService(svc)` setter.

`speedUpStarLvUp` args: `[starType, useItem (bool), num (int), itemID (int64)]`
Response: `{"d": starsStateMap, "n": 1}` per `onSpeedUpStarLvUp`.

`addStarAddition` args: `[starType, quantity (int), itemID (int64)]`. Handler caps `quantity` at `StarAdditionMaxQuantity = 9999` before invoking the service. Pushes `onAddStarAddition({t, f, n: consumed, d: slot})` and (on success) `onUPP` stat refresh.

`pmStarExchage` args: `[sid (int64), giid (int), num (int), tempFlag (bool)]`
Response: `{"flag": true, "finalNum": N, "finalNme": "...", "slotId": ID}`.

### Error messages in starErrorMessages slice

New entries added: `ErrNoUpgradeItemForStar`, `ErrInsufficientSpeedItems`, `ErrInsufficientStarPnt`, `ErrAdditionItemRequired`, `ErrInsufficientAddItem`, `ErrAdditionMaxed`.

## Dispatcher rate limits

Added at 500ms each: `speedUpStarLvUp`, `addStarAddition`, `pmStarExchage`.
None added to `quietMethods` yet — confirm with user after QA.

## Wired in main.go

```go
starService := appstar.NewService(statFeatureRepo, characterRepo, gameDataManager, log)
starService.SetItemService(itemService)
starHandler := starhandler.NewHandler(starService, log)
starHandler.SetItemService(itemService)
starHandler.RegisterHandlers(dispatcher)
authHandler.SetStarService(starService)
```

Both call sites (dev `runMonolithServer` and prod `runLineServer`) updated.

## Stat-bonus aggregation

`statfeature.applyStarsBonus` (`internal/application/statfeature/character.go`) iterates star types 1–12 in the `FeatureStars` JSONB state. For each slot with `level > 0` it resolves `FindStarsTemplateByTypeAndLevel(starType, level)`, maps `AddProp` via `magicArrayPropToID`, and applies `template.AddValue * slot.addition` through `applyCharacterPropBonus`. Slot `tid` mirrors the client's `tid`-keyed lookup; the server uses `level` so an in-progress upgrade (Begin → Finish window) does not grant the next level's bonus prematurely.

`finishStarLvUp` and `addStarAddition` push `rtmputils.SendStatRefreshUPP` (`onUPP`) after a successful state change so the character panel's combat stats reflect the new bonus immediately. Star service exposes `LoadCharacter(ctx, charID)` to the handler for this fetch. Without the push the bonus is correct on the next stat refresh (combat, equipment change) but invisible in the panel until then.

## What is NOT yet wired (follow-up)

1. **Quiet methods** — none of the 6 RPCs are in `quietMethods` yet. Add after user confirms feature in QA.
2. **Cancel refund policy** — currently no refund.
3. **MC_BIRTH event boost** — `MC_BIRTH_CONFIG[14]` overrides `STAR_ADDITION_BASIC_SUCCESS` during an unspecified birthday event (`StarAdditionPanel.as:674-690`). Not yet implemented server-side; gated on the same flag the client checks.

## File pointers

- Catalog: `data.data_tbl_stars_template` (144 rows), `data.data_tbl_stat_feature` id=17
- Domain: `internal/domain/statfeature/statfeature.go` (`FeatureStars`)
- Currency: `internal/domain/character/character.go` (CurrencyStarPnt=240, StarPnt field), `currency_keys.go`
- Application: `internal/application/star/{service.go, encoding.go, predef.go, speedup.go, addition.go, exchange.go}`
- Presentation: `internal/presentation/rtmp/handlers/star/{handler.go, speedup.go, addition.go, exchange.go}`
- Auth handler: `internal/presentation/rtmp/handlers/auth/{handler.go, login.go}` (SetStarService, starsData/starPnt)
- Wire-up: `cmd/gameserver/main.go` (two call sites)
- Research: `docs/research/2026-05-05_02_STAR_SUBSYSTEM_RESEARCH.md`
