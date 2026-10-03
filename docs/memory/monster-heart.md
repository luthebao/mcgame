# Monster Heart (Ma Vật Tâm)

## Feature Overview

Panel system where the player drags monster-heart items from a bag into a 5-box × 7-hole grid. The panel state (`{bag, data}`) is persisted in the generic feature-state store under `FeatureMonsterHeart = "monster_heart"`.

## Protocol

- `initMonsterHeartData` → `_result {bag, data}` (NOT a push; uses Responder in AS3).
- `monsterHeartSet [bagItemID, holePos, box, type]` → no Responder; server pushes `onInitViewProp` then `updateMonsterHeartPanel [{bag, data}]`.
- `monsterHeartReMove [holePos, box]` → no Responder; server pushes `onInitViewProp` then `updateMonsterHeartPanel [{bag, data}]`.

`type` (4th arg of `monsterHeartSet`) is the item's `monsterHeartType` category — advisory, not validated server-side (bag ownership check covers security).

## Wire Shape

```
{
  bag: {
    ji: {<itemId>: {itemId, n}, ...},
    lon: {...},
    mo: {...},
    ren: {...},
    shou: {...},
    te: {...},
    zhi: {...}
  },
  data: {
    hadActCombine: {1: {<itemId>: {color, talent}}, ..., 5: {...}},
    hadActHole:    {1: {1: itemId|-1, ..., 7: itemId|-1}, ..., 5: {...}},
    heartBoxLev:   {1: 0, ..., 5: 0}
  }
}
```

Empty hole value is `-1`.

## Open Questions

**OQ10 resolution**: `initMonsterHeartData` returns real state (populated `{bag, data}`) via `_result`. The two connect-time `_error` replies in the live log were transient server flakes — the panel-open call succeeds. Mirroring `_error` would break the panel. Decision: implement real init.

## Code Layout

- Application: `internal/application/monsterheart/`
  - `state.go` — `State`, `NewState()`, `DecodeState()`, `Encode()`, bag/hole helpers.
  - `helpers.go` — `intKey`, `parseIntKey`, `anyInt`, `IsValidBox`, `IsValidHole`.
  - `service.go` — `Service.Load`, `SetSlot`, `RemoveSlot` using `FeatureMonsterHeart` feature-state key.
- Handler: `internal/presentation/rtmp/handlers/monsterheart/`
  - `handler.go` — `Handler`, `RegisterHandlers`, `charIDFromCtx`, `pushViewProps`.
  - `init.go` — `InitMonsterHeartData`.
  - `actions.go` — `MonsterHeartSet`, `MonsterHeartReMove`, `toInt` helper.
  - `wire.go` — `stateToWire`, `emptyPanelWire`.
  - `init_test.go` — basic empty-state assertion.

## Notes

- `initMonsterHeartData` was previously a stub in `internal/presentation/rtmp/handlers/activity/icon_panels.go`. It was moved to the new monsterheart handler package (M8 Batch 2 refactor). The activity handler's `RegisterHandlers` no longer registers it.
- No currency is spent by set/remove. No `onAddMoney`/`onMinusMoney` callbacks needed.
- `pushViewProps` emits `onInitViewProp` after set/remove (matching live sequence). `onUPP` is NOT sent (the live log shows `onInitViewProp` only for these two RPCs).
- Security: `bagItemID` is validated against player-owned bag (`BagContains`); `box` and `holePos` are validated against server-side allow-lists before any state mutation.
- `type` arg (monsterHeartSet arg[3]) is accepted but not validated server-side per research note OQ5.
- `FOR UPDATE` is not used since the feature-state store uses `UpsertCharacterFeatureState` (single-row upsert on PK); concurrent double-send risk is low for UI drag operations.
