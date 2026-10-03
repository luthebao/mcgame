# TBL_PET_STONE

| Property | Value |
|---|---|
| Table ID | 136 |
| Record count | 132 |
| JSON | `docs/database/game_data/TBL_PET_STONE.json` |
| Client constant | `GamePredef.TBL_PET_STONE = 136` |

## Purpose

Defines Pet Stones (Mệnh Thạch) — gemstones that are socketed into pet equipment slots to grant a single stat bonus. Records are arranged in upgrade chains (level 1–6 per stone type), each pointing to the next via `nextId`. The final level (`nextId == 0`) is the maximum tier. Stones can optionally carry an "energy" skill link (`energyFlag`, `energyId`). The `resolveNum` controls how many material stones are required to dissolve/combine.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up as `GameData.d[136][id]` in `PetStonePanel.as:1135,1312,1464,1641,1765,1867,2738` and `PetStoneBag.as:907`. |
| `name` | string | Vietnamese stone name (e.g. `"Mệnh Thạch Ám Viêm"`). Displayed in `TipPetStone.as:224`. |
| `level` | int | Upgrade level of this stone (1–6). Used in `TipPetStone.as:221,230,247,257,267` for tier-gated display branching. |
| `iconCode` | int | 13-digit icon asset code. Loaded via `ResManager.getIconUrl(iconCode)` for stone slot icons. |
| `propType` | int | Stat type this stone modifies (e.g. `1` = HP, `4` = Physical Atk). Rendered using `Language.TIPPROP_S[propType]` in tooltip displays (`TipMysTreasure.as:350,360,368`). |
| `propNum` | float | Magnitude of the stat bonus. Displayed directly (flat values) or divided by `10000`/`100` depending on stat type. |
| `nextId` | int | ID of the next-level stone in the upgrade chain. `0` means this is the maximum level. Used in `TipPetStone.as:237–238` to chain to the next-tier record for preview. |
| `costSil` | int | Silver cost to upgrade this stone to the next level. `(inferred from data — no client usage found in non-GameData files)` |
| `resolveNum` | int | Number of stones required to dissolve/combine. Scales with level (e.g. `3` at lv1, `10` at lv2, `18` at lv3, `31` at lv4, `54` at lv5). `(inferred from data — no client usage found in non-GameData files)` |
| `energyFlag` | bool(0/1) | When `1`, this stone has an associated energy/skill upgrade. `0` × 110 (standard), `1` × 22 (energy stones). |
| `energyId` | int | ID of the energy skill or ability unlocked when `energyFlag == 1`. `0` when `energyFlag == 0`. Observed usage in `TipPetStone.as:257,267` gating display on energy-level stones. |

## Value distributions / sentinels

- `level`: `1` × 22, `2` × 22, `3` × 22, `4` × 22, `5` × 22, `6` × 22 — exactly 22 stone types, each with 6 levels.
- `energyFlag`: `0` × 110, `1` × 22 — the level-5 stones (one per type) are the energy tier.
- `nextId`: `0` appears for 22 records (the max-level lv6 stones).

## Client usage

- `PetStonePanel.as:1135,1312,1464,1641,1765,1867,2738` — looks up `GameData.d[136][giid]` to populate stone slot display and upgrade UI.
- `PetStoneBag.as:907–908` — resolves stone template and assigns `type = GamePredef.TBL_PET_STONE`.
- `TipPetStone.as:220–276` — primary tooltip: reads `iconCode`, `name`, `level`, `nextId`, chains next-level record for preview; branches on `energyFlag` level gating at lv5/lv6.
- `PetStoneSlot.as:77,89,101,121,133` — type-guards against `GamePredef.TBL_PET_STONE` for drag/drop.
- `Slot.as:341,458,591,1537` — generic slot routing for `TBL_PET_STONE` typed items.
- `TipMysTreasure.as:350,360,368` — alternate tooltip path reading `propType` and `propNum` for mystery-treasure context.

## Related tables

- `energyId` references a skill or energy record (exact table unknown from static analysis alone).
- `propType` maps to the shared stat enum used by [[TBL_PET_SOUL]], [[TBL_BUFF]], and equipment tables.
- Stone instances are part of per-pet equipment data (runtime, server-managed).
