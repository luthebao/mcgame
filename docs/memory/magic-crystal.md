# Magic Crystal (Pháp Tinh)

## Overview

16-slot crystal panel exposed to the Flash client via 5 RPCs:

- `initMagicCrystalData()` — load (paged 0..15, 4-up display)
- `MagicCrystalActive(index)` — flip slot to active (`a`=1)
- `MagicCrystalUp(index)` — increment slot level
- `MagicCrystalAddPower(index, amount, pointType)` — fill `l` (LMC, `pointType="1"`) or `s` (SMC, `pointType="2"`)
- `MagicCrystalRecovery(index)` — refund `l→magiccystalpre`, `s→magiccystallimit`, charge 1 `magiccystalrec`

Each slot is `{index, a, max, l, s, lv}` (index 0..15). `index` is a server-assigned integer; `a` is 0/1 (no separate `active` field).

## Wire shape

`onInitMagicCrystalData` returns an **object keyed by stringified slot index** `"0".."15"`, not an array. Each value is `{a, max, l, s, lv}`. The client overwrites `index` on render.

The four mutation RPCs **do not** have dedicated callbacks. They rely on:
1. `onUPP` push for the resource delta(s) — server side `ctx.Connection.SendCallback("onUPP", {<wire_field>: <new_total>})`
2. The client's existing 60-tick poll re-calling `initMagicCrystalData`

## Persistence

Slot state is persisted via `player.character_stat_features` JSONB row, `feature_key='magic_crystal'`, `state_key='magicCrystalData'`. JSONB shape:

```json
{ "crystals": [
    {"index":0, "a":0, "max":0, "l":0, "s":0, "lv":0},
    ...,
    {"index":15, "a":0, "max":0, "l":0, "s":0, "lv":0}
] }
```

Decoder pads/truncates to 16 entries on load; legacy 4-entry rows pad with zeros.

## Resource fields (currency table)

Three new currency type IDs in `data.character_currencies`, with `Character` struct fields and the same wire-name-as-currency-IDs pattern as `petguardin/petguardout`:

| Currency ID | Character field | Wire field |
|-------------|-----------------|------------|
| 73 | `MagicCrystalRec` | `magiccystalrec` |
| 74 | `MagicCrystalPre` | `magiccystalpre` |
| 75 | `MagicCrystalLimit` | `magiccystallimit` |

`upsertCharacterCurrencies` was extended with `alwaysPersistCurrency()` to write `0` for these three IDs even when drained — required because magic crystal resources frequently cycle through 0.

## Catalog (Go const, no DB)

`internal/application/magiccrystal/catalog.go` mirrors `GamePredef.MAGIC_CRYSTAL_UP` and `MAGIC_CRYSTAL_ACTIVE` as a static 16×10 table:

- `ActivateCost(slot)` — slots 0–6, 15 cost 10 (note slot 15 = 8 in client); slots 7,8,11,12 = 8; slots 9,10,13,14 = 12.
- `LevelUpCost(slot, lv)` — varies per slot. lv=9 always returns 0 (max level).
- `SlotMaxAt(lv)` — `(lv+1)*100`, capped at 1000.
- `SlotStatType(slot)` — fixed slot→`t` map: `[1,2,4,5,6,7,11,13,31,14,61,8,9,32,58,72]`.
- `SlotStatValue(slot, lv)` — stat magnitude at full fill.

## Cost rules enforced server-side

- **Activate**: requires `MagicCrystalRec >= ActivateCost(slot)`, slot must not already be active. Sets `A=1, Lv=0, Max=100`.
- **LevelUp**: requires active slot, `Lv < 9`, sufficient `MagicCrystalRec`. Bumps `Lv`, recomputes `Max=(Lv+1)*100`.
- **AddPower**: requires active slot, `1 <= amount <= 10000`, valid `pointType`, sufficient `MagicCrystalPre`/`Limit`, `L+S+amount <= Max`.
- **Recovery**: requires active slot, `L+S > 0`, `MagicCrystalRec >= 1`. Refunds `L→Pre`, `S→Limit`, charges 1 rec, zeroes `L` and `S`.

All errors are wrapped to a generic message client-side (`"operation failed"`) — original error logged server-side via `zap.Error`.

## Stat-bonus aggregation

`internal/application/statfeature/magic_crystal.go:applyMagicCrystalBonus` is invoked from `AggregateCharacterStatBonuses`. Formula mirrors the client:

```
bonus = v * (l + s) / max
```

Where `v = SlotStatValue(slot, lv)`, `max = (lv+1)*100`. Result routes through `applyCharacterPropBonus`, which selects flat or float based on the stat type (HP/MP/ATK/DEF/Speed → flat; Defy/Pen/etc → float).

## Code map

- `internal/application/magiccrystal/catalog.go` — static catalog + accessors
- `internal/application/magiccrystal/encoding.go` — JSONB ↔ `[]Crystal` codec, `CrystalsToWire(...)` (keyed-by-index map)
- `internal/application/magiccrystal/service.go` — `Service` with `Load`, `Activate`, `LevelUp`, `AddPower`, `Recover`. Returns `MutationResult{Crystal, []ResourceDelta}`. Uses `domainfeature.Repository` for slot state and `CharacterAccessor` (`character.Service`) for resource read/save.
- `internal/application/magiccrystal/service_test.go` — service-level unit tests
- `internal/application/statfeature/magic_crystal.go` — `applyMagicCrystalBonus` aggregator
- `internal/presentation/rtmp/handlers/magiccrystal/{handler,init,actions,helpers}.go` — RTMP entry points; `pushDeltas` emits `onUPP` per delta; errors wrapped to `"operation failed"`
- `cmd/gameserver/main.go` — `appmagiccrystal.NewService(statFeatureRepo, charService, log)` (two call sites: dev path and prod path)

## Quiet methods

The 5 RPC methods stay non-quiet (logging at info) until the user confirms the feature in QA. After confirmation, add to `quietMethods: true` in `internal/infrastructure/rtmp/dispatcher.go`.

## Out of scope

- Weekly Sunday 24:00 SMC reset (`Language[19]`) — wipe `s` field across all 16 slots for all players. Implement once cost/cap pass is QA-confirmed.
- Item-driven resource grants for `magiccystalrec/pre/limit`. Currently grant via admin economy panel (field names `magiccystalrec`, `magiccystalpre`, `magiccystallimit`).

## References

- `docs/research/2026-05-07_01_MAGIC_CRYSTAL_FEATURE_RESEARCH.md` — full reverse-engineering notes
- `docs/plans/2026-05-07_01_MAGIC_CRYSTAL_FEATURE.md` — implementation plan
- `docs/client/predef/GamePredef.as:7057,8051` — source of truth for catalog
- `docs/client/view/view/comp/MagicCrystalCanvas.as` — client-side guards we mirror server-side
