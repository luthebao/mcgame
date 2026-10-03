# Hắc Diệu Thạch (heiyaoshi) Panel

## Overview

20-figure two-stage progression panel:

- **Stage 1** (figures 1–10) spends `heiyaoshiPoint` (currency 233)
- **Stage 2** (figures 11–20) spends `heiyaoshiPoint2` (currency 234)

The player activates points. As each 3-node triangle (area) within a figure completes, its `TRIANGLE_FIGURE[fig][area].attribute` bonus is added immediately to the character. On full-figure completion, the `ALL_HEIYAOSHI[fig]` bonus is added **on top of** the accumulated triangle area sums — it is a completion bonus, not a replacement for the triangle values.

## RPC surface

| RPC | Direction | Args | Purpose |
|---|---|---|---|
| `initHeiyaoshiPanelData` | C → S (Responder) | none | Returns `{TRIANGLE_FIGURE, data: {actPoint, actLine, actArea, Buff, lastActFigure}}` |
| `lightHeiyaoshiPoint` | C → S | `(figureIdx:int, pointId:int)` — figureIdx is global 1–20 (`pStage + pIndex`) | Primary activation RPC. Fired on every point button-click in `HeiYaoShiPoint.as:154`. |
| `resetHeiyaoshi` (custom) | C → S | `(targetCharID:int)` | GM ≥ 5 only; clears state and pushes fresh panel |
| `activateHeiyaoshiPoint` (v2) | C → S | `(typeNum:int, pointNum:int)` | Alert-panel confirm-with-gold path. **Not yet implemented.** Lives in `HeiyaoshiAlertPanel.as:303`. |

Server pushes (callback names from `CallBack.as`):

- `gotoLightHeiyaoshiPoint(pointId)` — every successful activation
- `gotoLightHeiyaoshiArea(areaData, buffData)` — when a triangle just completed
- `gotoLightHeiyaoshiLine(lineData, lastActFigure)` — when a connecting line just completed
- `gotoLightHeiyaoshiAllJihuo(state)` — when the figure just fully completed
- `onUPP({heiyaoshiPoint: <new>, heiyaoshiPoint2: <new>})` — wallet delta

## Figure-match security rule

The wire RPC `lightHeiyaoshiPoint` carries a client-supplied `figureIdx`. The server **must** validate `figureIdx == state.LastActFigure` (default 1 for fresh state) — otherwise a malicious client could:

- Skip ahead to a higher figure without completing the prerequisites.
- Spend cheap Stage-1 stones on Stage-2 boards (the SWF cost tables differ per figure).

Mismatch returns `ErrFigureMismatch`. The currency pool is **derived server-side** via `PoolForFigure(figureIdx)` after the match check passes — never read from a client argument. Consistent with CLAUDE.md's "never trust a privilege flag from RPC payload" rule.

## Persistence

State blob: `player.character_stat_features` row with `feature_key='heiyaoshi'`. Actual JSONB shape (one figure at a time — `ResetCurrentFigure` clears these on advance, so namespacing per-figure is unnecessary):

```json
{
  "lastActFigure": 2,
  "actPoint": [1, 2, 3, 4],
  "actArea":  {"1": 1, "2": 1},
  "actLine":  {"1": 1, "2": 1, "3": 1},
  "AreaNum":  2,
  "LineNum":  3,
  "Buff":     {"1": 300, "4": 150, "5": 120, "6": 240, "7": 240}
}
```

`actPoint` is a flat int array, `actArea`/`actLine` are string-keyed object maps (id → 1). On figure advance the current-figure fields are reset and the new figure's starter is seeded.

## Starter-point auto-seed (game design requirement)

Every figure has exactly one `Price=0` starter point (always `pointID=1`). The Flash client renders this point as `_activated=true` purely from `price <= 0` (`HeiYaoShiPoint.as:127`) and **hides the click button** for it (`HeiYaoShiPoint.as:217-220`). Therefore the server **never receives** a `lightHeiyaoshiPoint(_, 1)` RPC for the starter — yet area completion checks still require point 1 to be in `state.ActPoint` (areas are 3-point triangles).

The server seeds starters automatically:

- `seedStarters(state, figure)` in `topology.go` adds every `Price<=0` point of `figure` to `state.ActPoint` if missing.
- Called from `ActivatePoint` (after loading state, before validating), from `LoadPanel` (via `reconcileFigureProgress`), from `Reset`, and on figure-advance after `ResetCurrentFigure`.

Without this, every area whose vertex set includes the starter (always area 1 of every figure) would be uncompletable server-side, and the player would lose stat bonuses.

## State normalization (DecodeState)

`DecodeState` is the single source of truth for normalizing `LastActFigure`. Any value `< MinFigure` (including the Go zero value 0) is treated as `MinFigure`. `NewState()` likewise starts at `MinFigure`. So every consumer of `*State` sees a valid current figure — no callsite needs an ad-hoc `if zero ⇒ 1` block.

## LoadPanel rescue contract

`LoadPanel` is responsible for repairing legacy / corrupted state:

1. Normalize `LastActFigure`.
2. `reconcileFigureProgress(state)` — seeds starters, re-derives complete areas/lines from `ActPoint`, advances through any figures that are now complete (handles cascading: legacy state with all areas completed but `LastActFigure` not advanced is fixed up). Bounded by `MaxFigure+1` iterations.
3. `computeBuffs` (pure helper next to `recomputeBuffs`) returns the canonical Buff map. If it differs from the persisted Buff (e.g. because the bug emitted `{}`), overwrite.
4. If anything changed, persist with `saveState`. No-op when state is already consistent.

This means the next time any affected player opens the heiyaoshi panel, their row is silently corrected — no SQL backfill needed.

## Past bug fixed in 2026-05-07

Symptom: `Buff: {}` and `lastActFigure: 0` persisted in DB even after activations. Root cause: `LoadPanel` and `ActivatePoint` each had a local `if state.LastActFigure == 0 { = MinFigure }` that mutated a *local variable* instead of the state, so `recomputeBuffs(state, state.LastActFigure)` was always called with 0. The 0 also leaked into `gotoLightHeiyaoshiLine`'s second arg, which the Flash client uses for `getStageOfHeiYaoShi` — wrong stage → wrong line graphics on Stage 2 boards. Fixed by centralizing normalization in `DecodeState`/`NewState` and adding `reconcileFigureProgress` rescue in `LoadPanel`.

Compounded by the missing starter-seed: even after the buff fix, area 1 of any figure stayed uncompletable because point 1 was never in `state.ActPoint` (client hides its activation button). Fixed by adding `seedStarters` and calling it on every state mutation entry-point.

## Error surfacing to client

`activateHeiyaoshiPoint` and `lightHeiyaoshiPoint` failures call `notifyActivateError(ctx, err)` (in `handlers/heiyaoshi/helpers.go`) which sends a Vietnamese `onSystemSay` toast for: ErrInvalidPoint, ErrInvalidFigure, ErrFigureMismatch, ErrPointAlreadyActive, ErrInsufficientStone, ErrInsufficientGold. Without this the player sees no feedback when, e.g., the gold-fallback alert path runs out of gold — the server log gets the warning but the UI stays silent.

## Buff aggregation rule (revised 2026-05-09, final)

`state.Buff` (propID → float64) is computed from scratch by `computeBuffs(state, currentFigure)` (`topology.go`):

- **Completed figures** (`f` in `[MinFigure, LastActFigure)`): for each figure `f`, add **both** (a) the sum of all `AreasInFigure(f)[*].Attribute` (triangle area sums) **and** (b) `FullFigureBuffs(f)` (the `ALL_HEIYAOSHI[f]` completion bonus). These are additive; `ALL_HEIYAOSHI` is a bonus on top, not a replacement.
- **In-progress figure** (`LastActFigure`): add `AreaAttributes(LastActFigure, areaID).Attribute` for each `areaID` in `state.ActArea`.

On figure completion, `service.go:197-204` calls `ResetCurrentFigure()` (clears `ActArea`) and advances `LastActFigure` before `recomputeBuffs`. The just-completed figure's triangle sums + ALL_HEIYAOSHI are now both included in Branch A; Branch B contributes zero for the next empty figure. No double-counting.

Note: `TRIANGLE_FIGURE` area attributes do NOT sum to `ALL_HEIYAOSHI` for the same figure. Figure 1's areas cover props 1/6/7; `ALL_HEIYAOSHI[1]` also adds 4 and 5. So on figure completion the bonus for props 4 and 5 appears for the first time (from ALL_HEIYAOSHI) on top of the triangle bonus for props 1/6/7. Both are intended.

`Buff` is always recomputed from scratch on every mutation. The consumer (`applyHeiyaoshiBonus`, `statfeature/character.go:217`) reads `Buff` on each stat aggregation cycle.

**Previous bug (pre-2026-05-09)**: `computeBuffs` only applied `ALL_HEIYAOSHI[f]` for completed figures — triangle area sums were omitted. This caused char #1 (10 figures complete) to show `Buff.1 = 6800` (ALL_HEIYAOSHI only) instead of the correct `60000` (triangle sums + ALL_HEIYAOSHI). Fixed by adding `AreasInFigure(f)` accumulation for each completed figure.

**Migration**: Existing players with stale Buff entries have them corrected on next `LoadPanel` reconcile. Char #1 was manually updated via SQL on 2026-05-09.

Locked in by `TestComputeBuffs_AddsActAreaAttributes`, `TestComputeBuffs_MixesCompletedFigureAndCurrentFigureAreas`, `TestComputeBuffs_AccumulatesAcrossMultipleCompletedFigures`, `TestActivatePoint_PartialFigureAddsAreaAttributes`, and `TestActivatePoint_FigureCompleteAppliesExactFullFigureBuff`.

## Static config

Three large client-side static tables migrated to Postgres (2026-05-09) and loaded via `gameDataManager`:

- `POINT_FIGURE[figure][pointId]` — `{price, gold, around[], area[], aroundLine[]}` for **20 figures**. Source of truth for activation cost and adjacency. Price 0 for the first point of each figure (free starter).
- `TRIANGLE_FIGURE[figure][areaId]` — `{LResNum, AResNum, attribute}` for **10 base figures** (stored in DB). Stage 2 (figures 11–20) reuses Stage 1 layouts, so `AreaAttributes(figure, areaID)` normalizes `figure > 10 → figure - 10`. The **server response** includes keys 1–20 (keys 11–20 are derived at init time via `scaleRawTriangleFigure`) because `HeiYaoShiPanel.bigPicOperation` looks up key = `tempFigure + 1 + 10` for advanced stage — missing keys crash the panel rendering.
- `ALL_HEIYAOSHI[figure]` — `{propId: cumulativeValue}` for **20 figures**. Granted in full when the figure completes.

### DB tables (schema: data)

| Table | Rows | Purpose |
|---|---|---|
| `data_tbl_heiyaoshi_point` | 296 | Point metadata (price, gold) |
| `data_tbl_heiyaoshi_point_link` | 2914 | around/area/around_line adjacency lists |
| `data_tbl_heiyaoshi_area` | 125 | Area metadata (LResNum, AResNum) — stage 1 only |
| `data_tbl_heiyaoshi_area_attribute` | 191 | Per-area attribute bonuses — stage 1 only |
| `data_tbl_heiyaoshi_full_buff` | 106 | ALL_HEIYAOSHI completion bonuses |

`InitFromGameData(mgr)` in `config.go` loads from the manager at server boot, after `gameDataManager.LoadAll`. Stage-2 `rawTriangle` keys (11–20) are computed from stage-1 data at init time.

`InitFromConfigBlob(blob)` is a test-only helper used by `TestMain` in `service_test.go` — loads from `testdata/heiyaoshi_config.json` (not embedded in production). The extractors (`cmd/extract-heiyaoshi/`, `cmd/heiyaoshi-seed-once/`) have been deleted; future config changes go directly to the seed SQL or DB.

## Init response gotcha

`HeiYaoShiPanel.onInitHeiyaoshiData` (line 13061-13063 of the AS3 panel) overrides the panel's instance variable `TRIANGLE_FIGURE` from the response. The static `HeiYaoShiConfig.TRIANGLE_FIGURE` is never read directly by the panel — only the instance variable. **If the server omits `TRIANGLE_FIGURE` in the init response, all area rendering breaks.** Server always echoes the full TRIANGLE_FIGURE map verbatim.

## Out-of-scope (v1)

- **Gold-fallback path**: `heiyaoshiBuy` / `goldBuyHeiyaoshi` callbacks would let the player spend gold when stones run out. v1 returns `not enough heiyaoshi stones` error and the client UI degrades. Implement in v2 if game design wants the gold sink.

## Login DTO gotcha — cData vs cProp

`character.ToDTO()` includes `heiyaoshiPoint` and `heiyaoshiPoint2`, but at login the Flash client wires the wallet to `Player.set data(_arg_1)` (not `Player.property`). The login payload has TWO fields:

- `cData` (used by `_core.player = createPlayer(cData)` → triggers `set data`) — **must include `heiyaoshiPoint`/`heiyaoshiPoint2`** or the client shows `NaN`.
- `cProp` (`char.ToDTO()`, assigned to `_core.player.property`) — has them but isn't read for the wallet display.

`internal/presentation/rtmp/handlers/auth/login.go` builds `cData` as an **explicit allow-list**, not a copy of `ToDTO()`. Any new wallet field that the panel reads via `_core.player.<field>` must be added to that map. Symptom of missing field: AS3 typed setters convert `undefined → NaN`.

Same trap applies to any future stat-feature currency (the existing `petguardout`, `petguardin`, `shishangdian` are already in `cData`).

## File map

- App: `internal/application/heiyaoshi/{config,state,topology,service,service_test}.go`
- Handler: `internal/presentation/rtmp/handlers/heiyaoshi/{handler,init,actions,helpers}.go`
- Test fixture: `internal/application/heiyaoshi/testdata/heiyaoshi_config.json` (test-only, not embedded)
- DB models: `internal/gamedata/models/heiyaoshi_*.go` (5 files)
- Seeds: `supabase/seeds/data_tbl_heiyaoshi_*.sql` (5 files)
- Migration: `supabase/migrations/20260509200000_add_data_tbl_heiyaoshi_tables.sql`
- DI wiring: `cmd/gameserver/main.go` (two server-mode blocks; `InitFromGameData` after `LoadAll`)
- Handler test: `internal/presentation/rtmp/handlers/character/stats_test.go`
- Tests: `go test ./internal/application/heiyaoshi/... ./internal/application/statfeature/... ./internal/presentation/rtmp/handlers/character/...`

## quietMethods workflow

Per CLAUDE.md, the three new RPCs (`initHeiyaoshiPanelData`, `activateHeiyaoshiPoint`, `resetHeiyaoshi`) are **NOT in the quietMethods map** until the user confirms end-to-end behavior is correct. Add to dispatcher.go with value `true` after manual verification.

## Stat reload on activation (2026-05-07)

`applyHeiyaoshiBonus` is wired into `AggregateCharacterStatBonuses`, but that aggregator only runs on **character load**. After `lightHeiyaoshiPoint` / `activateHeiyaoshiPoint` save a new `Buff`, the connected client still uses the pre-activation stat snapshot until next login.

Fix: the handler pushes a stat refresh after every successful activation via `rtmputils.SendStatRefreshUPP(ctx, itemService, char)`. That helper:

1. Reloads element / maker-set runtime state on the character.
2. Calls `itemService.AggregateEquipmentStats(ctx, charID)` — which fans into `statfeature.AggregateCharacterStatBonuses` (fresh DB read of `character_stat_features`, including the just-saved Buff).
3. Sends `onUPP` with `BuildStatRefreshUPPPayloadWithEquipment(char, bonuses)` — full property map (`finalHp`, `finalAttack`, `hpMax`, etc.) so the client side mirrors the new totals immediately.

Wiring: `Handler.SetItemService(...)` (any `rtmputils.StatRefreshService`) and `Handler.SetCharacterService(...)` (a `GetByID(ctx, id)` loader — `appchar.Service` satisfies it). Wired in both monolith and line modes in `cmd/gameserver/main.go`. The handler is null-safe — refresh becomes a no-op if either dep is unset.

Same pattern as `dress`, `buff`, `magicweapon`, `item/reward_callbacks`. Any future stat-feature handler that mutates persisted bonuses must do the same — recomputing bonuses server-side without pushing UPP leaves the client out of sync until next login.

## HP bonus path verification (2026-05-08)

User reported "HP +300 not adding to character; other stats are okay." Traced the full server-side path:

1. Heiyaoshi `Buff` map persists with raw propIDs: `{"1": 300, "4": 150, "5": 120, "6": 240, "7": 240}` (HP, ATK, MATK, DEF, MDEF). Verified in DB via `select state from player.character_stat_features where feature_key='heiyaoshi'`.
2. `applyHeiyaoshiBonus` in `internal/application/statfeature/character.go:217` reads each propID + value, calls `applyCharacterPropBonus(bonuses, propID, value)`.
3. `applyCharacterPropBonus` (`helpers.go:313`):
   - `NormalizeCharacterPropType(1)` → `CommonFeaturePropToStat(1)` → `PropMaxHP` (1001).
   - `IsPercentScalableProp(PropMaxHP)` is true → `bonuses.AddFlat(PropMaxHP, 300)`.
4. `Character.ApplyEquipmentBonuses` (`equip_stats.go:353`):
   - `hasAttrBonus` is false (heiyaoshi doesn't grant Strength/Stamina/etc.), so `RecalculateStats()` is NOT re-run after Stat-bonus block.
   - Flat loop: `PropMaxHP` is < `PropStrength` so passes the `propType >= PropStrength && propType <= PropSpirit` skip → `addFlatBonus(PropMaxHP, 300)` → `c.MaxHP += 300`.
5. `syncFinalFields()` → `c.FinalHp = float64(c.MaxHP)`.
6. `BuildStatRefreshUPPPayloadWithEquipment(char, bonuses)` returns `hpMax: 374, finalHp: 374` for a level-1 Stamina-8 character (74 base + 300).

Pre-condition: `gameDataManager` must be set on the statFeatureService — `AggregateCharacterStatBonuses` short-circuits to empty bonuses if it's nil. Wired in both monolith and line modes (`cmd/gameserver/main.go:220`, `:772`).

Lock-in test: `TestAggregateCharacterStatBonusesAppliesHeiyaoshiBuff` in `service_test.go` asserts the full chain end-to-end: HP +300 lands as `view["hpMax"] == baseMaxHP+300`. Other propIDs (4/5/6/7) verified in the same test.

If the client UI still shows the wrong total: the cause is downstream of `onUPP` (Flash player cache, panel binding, etc.), not the server.

`DetailPropPanel.as:2019` `updateCharDetailData()` short-circuits when `_cid == _core.cid`, so its `getCharDetailData` poll never re-fires inside the same character session. The escape hatch is `CallBack.as:6493` `onInitViewProp(propData)` — that callback bypasses the cache and calls `DetailPropPanel.updateView(propData)` directly. Heiyaoshi handlers push `onInitViewProp` after every successful activation via `Handler.pushViewProps` (`internal/presentation/rtmp/handlers/heiyaoshi/handler.go`). Same workaround is used by `handlers/item/change_element.go`, `change_soul.go`, `maker.go`, and `change_bind.go`.

## Adjacency rule (2026-05-08)

`POINT_FIGURE[figure][pointID].around` is the bidirectional neighbor list. `service.activate()` rejects with `ErrPointNotAdjacent` (Vietnamese toast: "Vị trí này phải nằm cạnh điểm đã kích hoạt") if no entry of `point.Around` is in `state.ActPoint`. The check is skipped for free starter points (`Price == 0 && Gold == 0`) since the client hides their button and the server auto-seeds them. Locked in by `TestActivatePoint_RejectsNonAdjacent` and `TestActivatePoint_AllowsAdjacentAfterPrior`.

## Buff value scaling and dual-scale config (revised 2026-05-09)

Heiyaoshi config uses **three distinct scales** for its propID values. Understanding which scale a propID belongs to is critical for correct server handling and SWF panel display.

| Group | propIDs | Config scale | Meaning | HeiYaoShiPanel Buff label display | DetailPropPanel display |
|-------|---------|-------------|---------|-----------------------------------|------------------------|
| Flat int | 1, 4, 5, 6, 7, 11 | raw int | `300` = +300 HP | shown as flat count | shown as flat count |
| Percent-points | **13, 14, 31, 34, 61** | percent-point | `0.4` ≡ `0.4%` | raw (no ×100) via FinalAdds | `finalCriticalDamage` with `%`, others as decimal |
| Fraction-of-1 | **59, 60, 62, 63** | fraction-of-1 | `0.002` ≡ `0.2%` | `Math.round(value * 10000) / 100 + "%"` (×100 effectively) | `value * 100` written to `c.FinalPraDef` etc., shown as `4.00%` |

**Important data inconsistency fixed 2026-05-09**: The `TRIANGLE_FIGURE` area attributes for propIDs 59/60/62/63 were originally extracted as percent-point values (e.g. `4` = 4%) while the `ALL_HEIYAOSHI` values for the same props are fraction-of-1 (e.g. `0.002` = 0.2%). The SWF panel formula for TRIANGLE tooltips is `value * 100 + "%"`, so the extracted value `4` would display as `400%`. All 20 affected entries in `heiyaoshi_config.json` were divided by 100 (e.g. `4 → 0.04`, `3.2 → 0.032`, `0.2 → 0.002`) to bring them into fraction-of-1 scale.

`applyHeiyaoshiPropBonus` (`internal/application/statfeature/character.go`) routes each propID to the correct bonus channel:

1. **Percent-point propIDs (13, 14, 31, 34, 61)** → `bonuses.AddFinal(propID, rawValue)`. These bypass the int-rounding stat path and write directly into `c.Final*` fields via `applyFinalAdds` in `equip_stats.go`, called after `syncFinalFields()`. This preserves fractional values (e.g. `0.32`) that would otherwise round to `0` via int fields.
2. **Fraction-of-1 propIDs (59, 60, 62, 63)** → `bonuses.AddFloat(statProp, rawValue * 100)`. The ×100 conversion is required because `state.Buff` stores these in fraction-of-1 scale (matching the HeiYaoShiPanel expectation) but `c.FinalPraDef` / `c.FinalPraMagDef` / `c.FinalEnhPhyHurt` / `c.FinalEnhMagicHurt` are percent-point fields (DetailPropPanel shows them raw + `%`). So `state.Buff[59] = 0.04` → `c.FinalPraDef += 4.0` → DetailPropPanel shows `4.00%`. Implemented via `heiyaoshiFractionProps` set in `statfeature/character.go`.
3. **Other float-bonus props** → `bonuses.AddFloat(statProp, rawValue)` — raw, no scaling.
4. **Other int-typed props** (HP, ATK, DEF, MaxMP, etc.) → `bonuses.AddFlat(statProp, int(math.Round(rawValue)))`.

All channels bypass the equipment-style `NormalizeRatePropValue` ×100 multiplication. This carve-out is heiyaoshi-only — equipment, war sprite, explorer medal, magic crystal, and other features go through the legacy `applyCharacterPropBonus` → `normalizeRawPropValue` pipeline.

### FinalAdds channel (`EquipmentStatBonuses.FinalAdds`, added 2026-05-09)

`FinalAdds map[int]float64` in `internal/domain/character/equip_stats.go` is a direct-final write channel. `AddFinal(rawPropID, value)` accumulates into this map. `applyFinalAdds(c, bonuses)` is called after `c.syncFinalFields()` in `ApplyEquipmentBonuses`, so the heiyaoshi addition is the last write and is not overwritten by `syncFinalFields`:

- `13` → `c.FinalCriticalDamage += value`
- `14` → `c.FinalDefy += value`
- `31` → `c.FinalResiCritical += value`
- `34` → `c.FinalRebornRate += int(math.Round(value))` (int field; accumulate all figures before rounding)
- `61` → `c.FinalResiDefy += value`

The early-return guard in `ApplyEquipmentBonuses` checks `len(bonuses.FinalAdds) == 0` along with Flat/Percent/Float so that heiyaoshi-only bonuses (no flat/percent/float) still invoke `applyFinalAdds`.

`BuildViewPropertiesWithEquipment` (`view_properties.go`) does NOT call `syncFinalFields()` a second time after `ApplyEquipmentBonuses` — the redundant second call was removed to prevent overwriting `applyFinalAdds` results.

Locked in by `TestApplyEquipmentBonuses_FinalAddsWriteDirectlyToFinalFields`, `TestApplyHeiyaoshiPropBonus_PercentPointPropsRouteToFinalAdds`, `TestApplyHeiyaoshiPropBonus_FractionPropsStillRouteToFloat`, and `TestAggregateCharacterStatBonusesPreservesHeiyaoshiRateValues`.

### Aggregated `getFinalPraDef` / `finalPraMagDef` RPCs (2026-05-08)

The `getFinalPraDef` and `finalPraMagDef` RPC handlers (`handlers/character/stats.go`) previously returned `char.FinalPraDef` / `char.FinalPraMagDef` straight from the persisted Character, bypassing the equipment + feature aggregation pipeline. The Flash client's `DetailPropPanel` calls these RPCs and overwrites the cells populated by `getCharDetailData`, so the heiyaoshi delta was lost on every panel refresh — causing the user to see `0.01%` instead of the aggregated `0.60%`.

Fixed: both handlers now call `aggregatedRateProp(ctx, char, key, fallback)` which runs `AggregateEquipmentStats` + `BuildViewPropertiesWithEquipment` and reads the aggregated value from the resulting props map. Locked in by `TestGetFinalPraDef_AggregatesEquipmentAndFeatureBonuses` and `TestFinalPraMagDef_AggregatesEquipmentAndFeatureBonuses`.

## TRIANGLE_FIGURE advanced-stage crash fix (2026-05-09)

`HeiYaoShiPanel.as:bigPicOperation` computes the TRIANGLE_FIGURE lookup key as:

- Stage < 4 (basic, figures 1–10): `key = tempFigure + 1` → keys 1–10
- Stage ≥ 4 (advanced, figures 11–20): `key = tempFigure + 1 + 10` → keys 11–20

The server's `TRIANGLE_FIGURE` (sourced from `rawTriangle`) only had keys 1–10. For any player who reached figure ≥ 11, `TRIANGLE_FIGURE[11]` was `undefined` in the panel, causing `undefined[areaID].LResNum` to throw a null-dereference → all area images disappear, active-point rendering stops, and `gotoLightHeiyaoshiArea` crashes silently.

Fix: in `loadConfig` (`config.go`), after building `rawTriangle`, copy keys 1–10 to 11–20 verbatim:

```go
for i := MinFigure; i <= Stage1MaxFigure; i++ {
    out.rawTriangle[strconv.Itoa(i+Stage1MaxFigure)] = out.rawTriangle[strconv.Itoa(i)]
}
```

Stage-2 figures (11–20) reuse the same area layout **and the same triangle area resource IDs** as Stage-1 figures (1–10). The client has no separate phase-2 triangle area asset set — `bigPicOperation` reads whatever `LResNum`/`AResNum` the server sends for keys 11–20. The visual distinction between phase 1 and phase 2 is carried entirely by **hardcoded line resources** (`103000/001/002` → `103023/024/025` in `bigPicOperation`) and the **point button style** (`BtnHeiyaoshiPointNotActive` → `BtnHeiyaoshiPointNotActiveStage2`), not by the triangle area icons. Applying any numeric offset to `LResNum`/`AResNum` is wrong — e.g. `+20` maps `103003 → 103023` which is the phase-2 line graphic, not a triangle area sprite.

## FinalAdds not propagated through item.mergeEquipmentStatBonuses (2026-05-09)

`AggregateEquipmentStats` in `internal/application/item/equip_stats.go` calls `mergeEquipmentStatBonuses(dst, src)` to fold in `statfeature.AggregateCharacterStatBonuses` results. The merge only transferred `Flat`, `Percent`, and `Float` — `FinalAdds` was silently dropped.

Consequence: heiyaoshi percent-point propIDs (13 = finalCriticalDamage, 14 = finalDefy, 31 = finalResiCritical, 34 = finalRebornRate, 61 = finalResiDefy) never appeared in the `onUPP` / `onInitViewProp` stat payloads sent to the client after activation or on login.

Fix: one line added to `mergeEquipmentStatBonuses`:

```go
for rawPropID, value := range src.FinalAdds { dst.AddFinal(rawPropID, value) }
```

## Stage 2 buff aggregation — mirror stage 1 with per-prop multipliers (2026-05-09, final)

`computeBuffs` in `topology.go` applies two distinct rules depending on the figure stage:

**Stage 1 (fig 1..10):** contribution = `TRIANGLE_FIGURE[n].attribute + ALL_HEIYAOSHI[n]` (normal).

**Stage 2 (fig 11..20):** contribution = `(TRIANGLE_FIGURE[n-10].attribute + ALL_HEIYAOSHI[n-10]) × M(prop)`. Stage 2 mirrors Stage 1 source data scaled per-prop. `ALL_HEIYAOSHI[11..20]` exists in the JSON but is intentionally not read — it was extracted from the AS source but is not part of the aggregation rule.

Per-prop multiplier table (matched against older-server reference screenshot):

| Multiplier | Prop IDs |
|---|---|
| ×2.0 | 1 (HP) |
| ×1.0 | 4, 5, 6, 7, 11 (phys stats), 14 (XPN), 61 (Kháng XPN) |
| ×1.5 | 13 (B.Kích), 31 (Kh.Bạo), 59/60/62/63 (damage fractions) |
| ×0.5 | 34 (Miễn Tử) |
| ×1.0 | default for any other prop |

Verified Phase 2 totals (all 20 figs complete) against reference screenshot: HP=180000, Công VL=30000, Phòng VL/MP=96000, Tốc=12000, B.Kích=30, XPN=10, Kh.Bạo=30, Miễn Tử=18, Kháng XPN=10, fractions=0.25 — 14/15 match exactly; Công MP (24080 vs 24000) is display rounding in the reference panel.

`LoadPanel` self-heals persisted stale `Buff` maps on next panel open via `recomputeBuffs` + DB upsert — no manual migration needed.

## Panel-open client lag (2026-05-07, not server-fixable)

User report: while the heiyaoshi panel is open, player movement is laggy; closing the panel restores normal performance.

Investigation:

- No client polling RPC for the panel (no `Timer` / `setInterval` / `enterFrame` listeners in `HeiYaoShiPanel.as` or `HeiYaoShiPoint.as`).
- No server-side periodic work tied to the panel — server has no notion of "panel open"; init returns once and the connection idles until next click.
- Init payload is ~11 KB JSON for `TRIANGLE_FIGURE` (10 figures, 11 KB serialized), which AMF0 encodes fine — not a bandwidth issue.
- Root cause is `HeiYaoShiPanel.as:8369` setting `cacheAsBitmap = true` on the dragable canvas. With ~10–20 vector triangles per figure rasterized, every visual update (hover / state change / button enable) re-bakes the bitmap on the same render thread the scene movement loop uses → starves movement.

Cannot fix without editing `.as` files (forbidden by CLAUDE.md). The TRIANGLE_FIGURE payload also cannot be omitted (the panel reads it as an instance variable; missing → all area rendering breaks). Document and accept.

## Prop 13 routing — AddFlat, not FinalAdds (2026-05-09)

Heiyaoshi prop 13 ("B.Kích" / Critical Strike) routes through `bonuses.AddFlat(PropCritical, …)` and lands on `c.Critical` → `c.FinalCritical` via `syncFinalFields`. It does **NOT** use the `FinalAdds` channel that the other percent-point props (14, 31, 34, 61) use.

Background: `heiyaoshiPercentPointProps` in `statfeature/character.go` originally listed `{13, 14, 31, 34, 61}` and routed all five to `AddFinal(propID, value)` → `applyFinalAdds`. `applyFinalAdds` had a typo at case 13: `c.FinalCriticalDamage += value` — wrong field. The fix was to remove 13 from `heiyaoshiPercentPointProps`; the fallthrough in `applyHeiyaoshiPropBonus` already handles it correctly via `NormalizeCharacterPropType(13) → PropCritical`.

Canonical prop-ID → stat mapping (verified across server tables):
- 13 → `PropCritical` → `c.Critical` → `c.FinalCritical` (B.Kích)
- 14 → `FinalAdds[14]` → `c.FinalDefy` (XPN)
- 31 → `FinalAdds[31]` → `c.FinalResiCritical` (Kh.Bạo) — `CommonFeaturePropID: 31`
- 34 → `FinalAdds[34]` → `c.FinalRebornRate` (Miễn Tử) — `CommonFeaturePropID: 34`
- 61 → `FinalAdds[61]` → `c.FinalResiDefy` (Kháng XPN) — `CommonFeaturePropID: 61`
- `finalCriticalDamage` is `CommonFeaturePropID: 71` (not 13)
- `finalResiCritical` is `CommonFeaturePropID: 31` (not 13)
