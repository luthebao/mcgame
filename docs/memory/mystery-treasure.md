# Mystery Treasure (Mật Bảo) System

## Feature Overview

Mystery Treasure is a crafting/collection panel that opens off the decorate/forge UI cluster (DecoratePanel.as page 4). It manages:
- A mystery-item bag (slot-indexed, `{mid, num}`)
- Learned recipes (`learnedRec` identity map)
- Make-skill level (`skiLvl`) and points (`skiPt`)
- Per-kind learned-book buffs (`getMysTreBuffByKind`)
- Aggregate stat totals (`getMysTreBuffSimpleData`)

## State Store

Feature key: `domainfeature.FeatureMysteryTreasure = "mystery_treasure"` in `character_stat_features`.

Application layer: `internal/application/mysterytreasure/`
- `service.go` — Load/Save + `BagToWire` shared encoder
- `state.go` — encode/decode for JSONB blob (bag, learnedRec, skiLvl, skiPt, scores)

`MysteryTreasureState.Scores` (added M8 Batch 3): map[string]int keyed by scoreType string (e.g. "2","17"); used by MysteryExchangeScore to validate owned counts. Zero-valued keys are deleted on deduct.

## Handler Package

`internal/presentation/rtmp/handlers/mysterytreasure/`
- `handler.go` — struct, `characterAccessor` interface, `SetCharacterService`, `RegisterHandlers`
- `actions.go` — fetch RPC implementations + `SendUpdateMysTreBag` outbound helper
- `resolve.go` — `ObjResolve` (mysTreObjResolve mutation) + local parse helpers

## Registered RPCs (all verbose, not in quietMethods)

| Method | Handler func | Notes |
|---|---|---|
| `onGetMysBookData` | `GetMysBookData` | Returns empty map (inner-entry shape OQ) |
| `onGetMysMakeData` | `GetMysMakeData` | Returns `{learnedRec, skiLvl, skiPt}` from state |
| `onGetMysBagData` | `GetMysBagData` | Returns `{slot:{mid,num}}` bag from state |
| `onGetChipBagData` | `GetChipBagData` | Delegates to rune service `GetChipBag` + `ChipBagToWire` |
| `getMysTreBuffByKind` | `GetMysTreBuffByKind` | Validates kind in [1,64]; returns empty map (buff data OQ) |
| `getMysTreBuffSimpleData` | `GetMysTreBuffSimpleData` | Returns empty map (aggregate OQ) |
| `mysTreObjResolve` | `ObjResolve` | Push-based null-responder; consumes bag items, credits currencies |

**NOT re-registered here**: `onGetMakeLimitTimes` — already in craft handler (`internal/presentation/rtmp/handlers/craft/handler.go`).

## Mystery Exchange Handler Package (M8 Batch 3)

`internal/presentation/rtmp/handlers/mysteryexchange/`
- `handler.go` — struct, interfaces (`characterAccessor`, `inventoryAccessor`), `NewHandler`, `SetCharacterService`, `SetInventoryService`, `RegisterHandlers`, `accountIDFromCtx`
- `exchange.go` — `ExchangeItem` + `ExchangeScore` implementations, `validateMD5Pass`, `parseItemDict`, `parseScoreDict`, `validateItemOwnership`, `validateAndTallyScores`, `deductScores`
- `exchange_sqli_test.go` — SQLi regression pack (all tests pass)

### MysteryExchangeItem

- Args: `[itemDict, md5pass]` where `itemDict = {instanceId: true}`, `md5pass` is MD5 of delete password.
- Security envelope enforced before any mutation:
  1. md5pass hardening (`validateMD5Pass`): empty/oversized (>64)/control-byte (0x00..0x1f) rejected.
  2. itemDict key hardening: `parseItemDict` rejects non-numeric keys via `strconv.ParseInt`.
  3. itemDict size cap: >256 entries rejected.
  4. Password gate: `h.accountRepo.FindByID` + `account.CheckSecondaryPassword`.
  5. Ownership: `h.inventory.GetInventory` then `validateItemOwnership` — item must be in bag, not equipped, not bound.
- Reply: `{num: newMysteryCrystal, mysteryCrystal: newMysteryCrystal}`.
- Crystal yield: `exchangeItemCrystalPerUnit = 1` — STUB placeholder.

### MysteryExchangeScore

- Args: `[scoreDict, md5pass]` where `scoreDict = {scoreType: count}`.
- Security envelope: same md5pass hardening + dict cap + password gate, plus:
  - Score type allow-list (16 types: 2–17): `allowedScoreTypes` map.
  - Negative count rejected.
  - Owned count re-validated from `MysteryTreasureState.Scores` (parameterized feature-state store).
- Reply: `{num: newMysteryCrystal}` — client assigns to `_core.player.mysteryCrystal`.
- Crystal yield: `exchangeScoreCrystalPerUnit = 1` — STUB placeholder.

### Wiring in main.go

```go
mysteryExchangeHandler := mysteryexchangehandler.NewHandler(accountRepo, mysteryTreasureService, log)
mysteryExchangeHandler.SetCharacterService(charService)
mysteryExchangeHandler.SetInventoryService(itemService)
mysteryExchangeHandler.RegisterHandlers(dispatcher)
```

`itemService` satisfies `inventoryAccessor` via `GetInventory(ctx, charID) ([]*item.Item, error)`.
`charService` satisfies `characterAccessor` via `GetByID` + `Save`.

## mysTreObjResolve Implementation Notes

- Client sends `[mysItemDic]` where `mysItemDic = {slot: {mid, num}}` with null responder.
- Server re-validates each `{mid,num}` against actual mystery bag state (server-side ownership check).
- Validation order: auth check → dict size cap (200) → per-entry parse (slot/mid/num as int, num>0) → ownership (bag[slot].mid matches, bag[slot].num >= num).
- Consumes items from bag state (read-modify-write via feature store), then credits character currencies.
- Push order: `updateRuneChipBag` → `onAddMoney` runeExp → `onAddMoney` decoSilver → `updateMysTreBag` → `_result [undefined]`.
- `updateRuneChipBag` is always sent (reads current chip bag from rune service; changes only if rune service mutation occurs, but per protocol it is always pushed after resolve).
- **Yield rate**: `resolveRuneExpPerItem = 1`, `resolveDecoSilverPerItem = 1` per item-unit — PLACEHOLDER constants. Update once game-data table for dismantling yield is confirmed.
- Raw errors never echoed to client; `pkgerrors.ErrSystemError` is used for infrastructure failures.

## Outbound Push Helper

`SendUpdateMysTreBag(conn, bag, logger)` in `actions.go` — call this after any mutation of the mystery bag (resolve, exchange, make).

## Shared Encoders

- `appmystre.BagToWire(bag)` — `{slot:{mid,num}}` — shared between `onGetMysBagData` reply and `updateMysTreBag` push
- `apprune.ChipBagToWire(chipBag)` — chip bag — `onGetChipBagData` delegates to rune service; do NOT duplicate the chip-bag store

## Wiring (cmd/gameserver/main.go)

```go
mysteryTreasureService := appmystre.NewService(statFeatureRepo, log)
mysteryTreasureHandler := mysterytreasurehandler.NewHandler(mysteryTreasureService, runeService, log)
mysteryTreasureHandler.SetCharacterService(charService)
mysteryTreasureHandler.RegisterHandlers(dispatcher)
```

`SetCharacterService` added in M8 Batch 3 to support currency mutation in `ObjResolve`. `charService` implements `characterAccessor` interface (`GetByID` + `Save`).

## Open Questions (from research doc)

1. **`onGetMysBookData` inner-entry shape** — the per-kind `arg[kind]` value fields were not isolated in the log capture; `GetMysBookData` returns an empty map.
2. **`getMysTreBuffByKind` buff list content** — which learned book entries map to which `{propVal, t}` contributions; live server itself flaked on 10/11 calls so client tolerates `_error`. Returns empty map until data model confirmed.
3. **`getMysTreBuffSimpleData` aggregation logic** — sum of all learned buff contributions by stat name; returns empty map until buff-by-kind is filled in.
4. **mysTreObjResolve yield rate** — `resolveRuneExpPerItem` and `resolveDecoSilverPerItem` are placeholder 1:1 constants; actual rates from game-data table not yet confirmed.
5. **`MysteryExchangeItem` crystal yield per item** — `exchangeItemCrystalPerUnit = 1` is a stub placeholder; actual conversion rates not confirmed from game data.
6. **`MysteryExchangeScore` crystal yield per score unit** — `exchangeScoreCrystalPerUnit = 1` is a stub placeholder; actual rates not confirmed from game data.

## Security Notes

- `getMysTreBuffByKind` validates `kind` is a numeric float64 in [1,64]; rejects non-numeric, out-of-range, and wrong arg count with `pkgerrors.ErrInvalidArgs`.
- All handlers gate on `ctx.CharacterID != ""` to reject unauthenticated calls.
- `mysTreObjResolve` re-validates every `{mid,num}` against server-side bag state before any mutation; dict size capped at 200; mid and num must be positive integers; slot key must be a numeric string.
- `MysteryExchangeItem` / `MysteryExchangeScore`: full password gate + ownership re-validation + input hardening (see exchange handler section above). SQLi regression tests in `exchange_sqli_test.go`.
- No privilege flags read from RPC payload.
- No raw SQL; state read/write goes through parameterized `UpsertCharacterFeatureState` / `ListCharacterFeatureStates`.
- No `fmt.Sprintf` user input into SQL (all parameterized).
- `validateMD5Pass` rejects empty, >64-char, and any byte < 0x20 (covers \x00, \t, \n, \r, all control bytes).
