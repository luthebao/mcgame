# TBL_PET_GUARD

| Property | Value |
|---|---|
| Table ID | 135 |
| Record count | 120 |
| JSON | `docs/database/game_data/TBL_PET_GUARD.json` |
| Client constant | `GamePredef.TBL_PET_GUARD = 135` |

## Purpose

Defines the Pet Guard (Thú Thủ Vệ) upgrade tiers for each of four guard slots. Each record represents one guard type (`sid` 1–4) at one upgrade level (`lev` 1–30), carrying four stat bonuses and a gold/item cost. The client iterates records by `sid` via the secondary index (`gameDataIndex[135][sid]`) to find the row matching the player's current guard level and compute stat contributions.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. |
| `sid` | int | Guard slot/type identifier (1–4). Used as the primary index key (`TBL_INDEX_ARRAY[135] = "sid"`, `GamePredef.as:8402`). The client iterates `gameDataIndex[135][sid]` to find the record where `record.lev == currentLevel` (`PetGuardPanel.as:2973–2975`, `PetGuardInSidePanel.as:1146–1148,1297`). |
| `lev` | int | Guard level (1–30 per `sid`). Matched against `petGuardObj["lvData"][sid]` (the player's current level for this guard type). |
| `gold` | int | Gold cost to upgrade to this level. Shown in upgrade confirmation: `Language.PANEL_PETGUARD[18].replace("{num}", PET_GUARD_ADD[lev]["gold"])` (`PetGuardPanel.as:2824`). |
| `num` | int | Secondary upgrade resource count required. Compared against `player.petguardout` (`PetGuardPanel.as:2795`) and `player.petguardin` (`PetGuardInSidePanel.as:1150`). |
| `costType` | int | Currency type for the upgrade cost. Always `0` in this dataset (gold only). `(inferred from data — no client usage found)` |
| `prop1` | int | Stat type for the first bonus. Accessed dynamically as `row["prop" + n]` in the `PetGuardPanel` display loop (`PetGuardPanel.as:2946,2950`). Values: `1`, `4`, `6`, `71`. |
| `prop2` | int | Stat type for the second bonus. Values: `5`, `7`. |
| `prop3` | int | Stat type for the third bonus. Values: `59`. |
| `prop4` | int | Stat type for the fourth bonus. Values: `60`. |
| `propVal1` | int | Magnitude for `prop1`. Grows linearly with `lev` (e.g. `2990000` at lev 2, `5980000` at lev 3 for sid=1). |
| `propVal2` | int | Magnitude for `prop2`. |
| `propVal3` | int | Magnitude for `prop3`. |
| `propVal4` | int | Magnitude for `prop4`. |
| `desc` | string | Description text. Empty string in all 120 records. `(inferred from data — no client usage found)` |

## Value distributions / sentinels

- `sid`: `1` × 30, `2` × 30, `3` × 30, `4` × 30 — exactly 30 levels per guard type.
- `costType`: `0` × 120 (all records).
- `prop1` unique values: `1` (HP), `4` (Physical Atk), `6` (Physical Def), `71` — one value per `sid` group.
- `propVal3`/`propVal4` are significantly smaller than `propVal1`/`propVal2`, suggesting percentage-type stats for props 3/4.

## Client usage

- `PetGuardPanel.as:2973–2975` — iterates `gameDataIndex[135][sid]`, matches `lev`, reads `prop1–4` and `propVal1–4` via dynamic `row["prop" + n]` and `row["propVal" + n]` keys.
- `PetGuardPanel.as:2946,2950` — formats stat tooltip lines using `Language.TIP_MONSTER_H[row["prop" + n]]` and `PET_GUARD_MAX_PROP[row["prop" + n]]`.
- `PetGuardPanel.as:2795,2824` — reads `num` and `gold` for upgrade cost validation and confirmation dialog.
- `PetGuardInSidePanel.as:1146–1150,1297–1299` — iterates by `sid`, matches `lev`, reads `num` for upgrade-slot check against `player.petguardin`.
- `PET_GUARD_SID`, `PET_GUARD_ADD`, `PET_GUARD_INDEX_SID`, `PET_GUARD_MAX_PROP` are hardcoded constant objects in `PetGuardPanel.as:999–1163` — the table data drives display but upgrade costs and per-colour percentages are stored client-side.
- Secondary index: `TBL_INDEX_ARRAY[135] = "sid"` (`GamePredef.as:8402`).

## Related tables

- Guard pets placed in slots are from `TBL_PET` (runtime instance table, id=39); their IDs are stored in `petGuardObj["petData"][sid]`.
- `prop1–4` stat type integers map to the shared stat enum used by [[TBL_BUFF]], [[TBL_PET_SOUL]], and equipment tables.
