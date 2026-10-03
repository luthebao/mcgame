# Pet Guard

## Overview

Pet guard is the 5×5 slot grid that lets the player place pets in defensive formation columns. State lives in `char.PetGuardData` (a JSONB column on the main character row) with shape:

```json
{
  "lvData": { "0": 0, "1": 0, "2": 0, "3": 0, "4": 0 },
  "petData": { "0": 0, "1": 0, ..., "44": 0, "45": 0 }
}
```

`lvData` keys are columns (0-4); the value is the column's current "level" (number of slots unlocked). `petData` keys are slot positions (0-4 base row, then 11-45 grid positions where the tens digit is the level row); values are pet ids.

## RPCs

| RPC                       | Status                                                                  |
|---------------------------|-------------------------------------------------------------------------|
| `getPetGuardData`         | ✅ shipped — read state                                                  |
| `movePetToPetGuardSid`    | ✅ shipped — move a pet into a slot                                      |
| `putDownPet`              | ✅ shipped — remove a pet from a slot                                    |
| `upGuardSid` (added 2026-05-06) | ✅ partial — column upgrade via gold (costType=2). costType=1 (petguardout token) returns `ErrInvalidInput` until a follow-up wires the token persistence. |

## Slot upgrade flow (Track F slice)

`UpgradePetGuardSid(charID, sid, costType)` in `application/pet/pet_guard.go`:

1. Validate `sid ∈ [0, 4]`, `costType == 2` (gold) — costType=1 (petguardout) is rejected with `ErrInvalidInput` until a follow-up wires petguardout persistence.
2. Load char + state. Reject if `lvData[sid] >= 5` (max level).
3. Look up cost: `gameDataManager.FindPetGuardByLevSid(targetLevel, sid+1)` returns the catalog row. The catalog field `gold` is the deduction.
4. Verify `char.Gold >= cost`; otherwise `ErrInsufficientFunds`.
5. Deduct gold, increment `lvData[sid]`, persist via `charRepo.Update`.
6. Handler pushes `onUpdatePetGuardData` (new state) and `onAddMoney(charID, "gold", -cost, newBalance)`.

The catalog accessor `Cache.FindPetGuardByLevSid` was added in this slice — it iterates `petGuards` and returns the row matching `lev=level AND sid=sid`. `Manager.FindPetGuardByLevSid` proxies through.

## What's NOT yet wired

- **`petguardout` token currency** (costType=1). The Flash UI prefers tokens when the player has them; only falls back to gold when out of tokens. Server today persists nothing for tokens, so token-mode upgrades are rejected. Two follow-up decisions required:
  1. Origin — where do tokens come from? (drop tables / monster kills / quest rewards / shop / admin grant?) Without that, even adding a column doesn't help.
  2. Persistence location — column on `player.character_progression`, or row in `player.character_currencies`, or a stat-feature JSONB key.
- **`petguardin` token** — same problem, separate currency for a different upgrade mode (the Flash UI distinguishes "out" vs "in" by which slot column is being upgraded). Needs the same design decisions.
- **Catalog `cost_type` column** is always 0 in current data; if it ever takes other values (e.g. `cost_type=1` means tokens, `cost_type=2` means gold), the resolver will need to honor it.

## File pointers

- `internal/application/pet/pet_guard.go` — `UpgradePetGuardSid`, `PetGuardCostType*`, `PetGuardMaxLevel`.
- `internal/presentation/rtmp/handlers/pet/pet_guard.go` — `UpGuardSid` handler.
- `internal/presentation/rtmp/handlers/pet/handler.go` — RPC registration.
- `internal/gamedata/cache.go` — `FindPetGuardByLevSid`.
- `internal/gamedata/manager.go` — proxy.
- Catalog: `data.data_tbl_pet_guard` (gold + num cost rows by sid + lev).
- Flash side: `compDragable/PetGuardPanel.as:2816` (`upGuardSid(sid, costType)` call).
