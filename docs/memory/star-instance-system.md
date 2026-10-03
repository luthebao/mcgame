# Star Instance System (Tinh Giới Thập Nhị Cung)

Feature implemented on branch `feat/star-tinhcung`. Boss-fight side of the star system that awards `starPnt` (currency 240).

## Overview

12×12 PvE instance grid (144 fights). 5 free daily attempts per player, up to +5 purchased with gold. Wins persist a lifetime monotonic best score and award `starPnt` currency.

## Application Package

`internal/application/starinstance/`

- `service.go` — main `Service` struct with `charRepo`, `featureRepo`, `starService`, `nowFunc`
- `state.go` — `WarMapState` struct + `ToMap()` + `WarMapStateFromMap()` + `defaultWarMapState()`
- `scoring.go` — `ComputeScore(deaths int, elapsedSec int64) int`
- `reward.go` — `StarPntForLevel(level int) int` = `level * 10`
- `service_test.go` — 11 unit tests with fake repos

Key design decisions:

- `starPnt per win = level × 10` (L1=10 to L12=120)
- Score = `100 - deaths*20 - clamp(elapsedSeconds/3, 0, 50)`, clamped [0,100]
- Party: every member spends 1 attempt AND earns full starPnt on win
- Gold cost to buy extra attempt = `(currentSmax - 4) * 10`

## Storage

Reuses `player.character_feature_states` JSONB with `feature_key='star_instance'`. No new DB migration needed.

State shape:

```json
{"scores":{"1":{"1":85,"3":60},...}, "dailyMax":5, "dailyUsed":2, "resetCycle":20260511}
```

`resetCycle` is `YYYYMMDD` integer. Lazy reset on read (same pattern as boss_daily_service.go:56-64).

## Handler Package

`internal/presentation/rtmp/handlers/starinstance/`

- `handler.go` — `Handler` struct, `NewHandler`, `RegisterHandlers`
- `get.go` — `GetWarMap` → returns `{d: {level: {sid: score}}, s: {smax, snum}}`
- `click.go` — `ClickWarMap(sid, level)` → validates all party members first, then increments snum
- `add_time.go` — `AddWarMapTime(currentMax)` → deducts gold, bumps smax, pushes `updateWarMapStatus`
- `errors.go` — Vietnamese error sentinel map

Party resolution: `groupService.GetGroupByMember(ctx, leaderID)` — requires `SetGroupService()`.

## Combat Handler Integration

`internal/presentation/rtmp/handlers/combat/handler.go`:

- Added `starInstanceService *appstarinstance.Service` field
- Added `SetStarInstanceService()` setter

`internal/presentation/rtmp/handlers/combat/battle.go` `EndBattle`:

- Before shared cleanup, detects `battle.BattleType == BattleTypeStarInstance`
- Counts deaths (`Participant.Side == SidePlayer && CurrentHP <= 0`)
- Calls `starInstanceService.OnBattleEnd()`
- Pushes `setStarPoint(newValue)` callback
- Captures response `{r, s:{id,level,score,time,die}}`
- All shared cleanup (ClearBattleDeadlines, ClearBattle, onSetCharState, etc.) runs BEFORE returning
- Returns captured star-instance response instead of default rewards shape

## Domain Changes

`internal/domain/combat/battle.go`:

- Added `BattleTypeStarInstance BattleType = 5`
- Added `WarMapSid int` and `WarMapLevel int` fields to `Battle` struct (after `LogID`)

`clickWarMap` handler sets these when it calls combat service to start the battle.

## Wire Contracts

```
getWarMap → {d:{level:{sid:score},...}, s:{smax:int, snum:int}}
clickWarMap → {c:1} | {c:-2, d:{id, name}} | {c:-3, d:{id, name}} | {c:0}
addWarMapTime → 0 | newSmax (int, not object)
battlePlayEnd (star) → {r:1, s:{id,level,score,time,die}} | {r:0}
server push updateWarMapStatus → {smax:int} or {snum:int}
server push setStarPoint → int
```

## Wiring in main.go

Two sites: monolith (~line 503) and line-server (~line 1082):

```go
starInstanceService := appstarinstance.NewService(characterRepo, statFeatureRepo, starService, log)
starInstanceHandler := starinstancehandler.NewHandler(starInstanceService, starService, characterRepo, log)
starInstanceHandler.SetGroupService(groupService)
starInstanceHandler.RegisterHandlers(dispatcher)
combatHandler.SetStarInstanceService(starInstanceService)
```

## Rate Limits (dispatcher.go)

```go
d.rateLimits["getWarMap"]    = 1000 * time.Millisecond
d.rateLimits["clickWarMap"]  = 500 * time.Millisecond
d.rateLimits["addWarMapTime"] = 500 * time.Millisecond
```

## quietMethods Status

`getWarMap`, `clickWarMap`, `addWarMapTime` are **NOT** in `quietMethods` — left verbose for development. Ask user before silencing.

## Security Notes

- `sid` and `level` validated `∈ [1,12]` at handler boundary
- `smax` hard-capped at 10 server-side
- Cultivation gate re-derived via `starService.Load()` — never trusted from client
- `starPnt` is server-set only
- All party members validated before any state mutation
- No raw `err.Error()` sent to client

## Out of Scope (deferred)

- `initTaskSweepPanelByClient` auto-sweep path for star-instance
- `openStarInsMap` server-push
- `data_tbl_war_map.reward_star_pnt` column (formula lives in code)
- VIP overrides for daily attempt cap
