# Astrology System (12-Cung Zodiac Pick Panel)

## Overview

The Astrology panel ("Thiên Văn" / "12-Cung") is a separate system from the 12-zodiac star upgrade panel. It lets players "pick" zodiac candidate stars and collect them toward formula-completion awards.

## Two Distinct "Star" Systems

1. **Zodiac upgrade** (`FeatureStars` = `"stars"`): the 12-slot begin/finish/cancel upgrade lifecycle. Handlers in `internal/presentation/rtmp/handlers/star/`, service in `internal/application/star/`.
2. **Astrologic pick panel** (`FeatureMagicArray` = `"magic_array"`): the random roll+pick system with formula rewards. Handlers in `internal/presentation/rtmp/handlers/astrology/`, service in `internal/application/astrology/`.

## Data Model

State persisted via `character_stat_features` JSONB row with `feature_key = "magic_array"`. Keys in the JSONB:
- `starsCollected` (`[]interface{float64}`) — ordered list of picked star SIDs
- `starsToPick` (`[]interface{float64}`) — current 3 candidate SIDs
- `pickCount` (float64) — free picks used
- `refreshCount` (float64) — refreshes used
- `buyPickCount` (float64) — purchased extra picks; when free picks exhausted, decremented instead of incrementing pickCount
- `formulasClaimed` (`[]interface{float64}`) — list of aid values already awarded; prevents re-triggering formulas on each subsequent pick

The statfeature login serializer (`application/statfeature/service.go`) reads `FeatureMagicArray` to populate `astrologicData` and `starsData` on login. The astrology service writes back to the same JSONB row. Keys added by astrology (`starsCollected`, `starsToPick`) are new and don't conflict with the legacy login keys (`starsNow`, `formula`, etc.).

## Wire Shapes

`pickStar` request: `[<sid>]` — the SID itself (e.g. `[10]`), not an array position.

`onGetAstrologicData`: `[{award, award_record, buyPickCount, formula, pickCount, refreshCount, starsNow, starsToPick}]`
- `award`: static `[90, 90, 140, 140, 195, 195]`
- `formula`: `[nil, [3,4], [10,5,2]]` — index 0 is always nil
- `starsNow` / `starsToPick`: arrays (not objects), despite login using maps

`onAstrologicStarsRefresh`: `[refreshTimesRemaining, [sid, sid, sid]]`

`onPickStar`: `[{buyTimes, leftTimes, newStars, refreshTimes, result, sid}]`
- `result` is omitted from payload when no formula award (not sent as null/undefined — just absent key)

## Economy

- `maxPickTimes = 12`, `maxRefreshTimes = 10` (observed from live captures)
- `npPntPerPick = 12` — every successful pick credits 12 npPnt; emitted as `onAddMoney [cid, "npPnt", 12, newBalance]` BEFORE `onPickStar`
- Formula award also credits npPnt equal to the award's `aid` value; emitted as a separate `onAddMoney` BEFORE the regular +12 `onAddMoney`
- Both npPnt increments are added atomically in a single `char.AddCurrency` call; the handler reconstructs the intermediate balance for the formula callback as `NpPntBalance - NpPntPerPick`
- Current implementation: all refreshes are free (gold cost for excess refreshes is an open question — OQ: astrologic-economy)
- `pickStar` validation: the received SID must be in the current `starsToPick` candidates server-side
- Guard logic: block only when BOTH free picks AND bought picks are exhausted (`PickCount >= MaxPickTimes && BuyPickCount <= 0`)
- When free picks exhausted, `BuyPickCount` is decremented; `PickCount` is only incremented while free picks remain

## Security Guards Applied

- `sidArg` range-checked `[MinStarSid=1, MaxStarSid=12]`
- SID validated against `starsToPick` before accepting (prevents picking a star not in the offered set)
- `PickCount >= MaxPickTimes && BuyPickCount <= 0` gate prevents exceeding quota
- Per-player `sync.Mutex` (via `playerLocks sync.Map`) wraps all Load→mutate→Save paths in GetAstrologicData, RefreshStars, PickStar to prevent TOCTOU races between concurrent connections for the same charID
- Global `math/rand.Intn` used for candidate rolls (Go 1.20+ global Rand is goroutine-safe; no per-service Rand instance)

## Formula Completion

Hardcoded `staticFormulas` in service.go based on the single observed capture:
- Formula 1: `[3, 4]` → aid 90
- Formula 2: `[10, 5, 2]` → aid 140

Formula evaluation checks if all formula SIDs appear in `starsCollected`, and skips any formula whose `aid` is already in `state.FormulasClaimed`. After awarding, the `aid` is appended to `FormulasClaimed` and persisted. Each formula fires exactly once per cycle.

## award_record Open Question (OQ: astrology-award-record)

`onGetAstrologicData` includes `award_record` — a server-wide history of formula completions by other players (e.g. `[{aid: "1", cid: 1874602, name: "†Duy12†"}, ...]`). No backing table or query exists for this data. The handler returns `[]` and this is documented here as an intentional gap. Implementing it would require a new table or log column to store formula-claim events globally, not per-player.

## Files

- `internal/application/astrology/service.go` — service, state types, encode/decode, formula eval
- `internal/presentation/rtmp/handlers/astrology/handler.go` — RPC handlers + payload builders
- `cmd/gameserver/main.go` — wired after starService (uses `appastrology.NewService(statFeatureRepo, characterRepo, log)`)

## RPC Registration

`getAstrologicData`, `refreshStars`, `pickStar` — all verbose (NOT in `quietMethods`).

## Open Questions

- OQ: astrologic-economy — gold cost per refresh beyond free quota; buy pricing for `buyPickCount`
- OQ: full formula table (only 2 formulas observed in capture; there may be more)
- OQ: daily reset cycle for `pickCount`/`refreshCount` (the `date` field in `defaultAstrologicData` suggests a date-keyed daily reset, not yet implemented)
- OQ: astrology-award-record — `award_record` in `onGetAstrologicData` requires a global formula-claim log; no backing table; returns `[]` until implemented
