# TBL_SKILL_POOL

| Property | Value |
|---|---|
| Table ID | 56 |
| Record count | 315 |
| JSON | `docs/database/game_data/TBL_SKILL_POOL.json` |
| Client constant | `GamePredef.TBL_SKILL_POOL = 56` |

## Purpose

Join table mapping skill pools (identified by a pool ID `pi`) to individual skills (`si`). Used primarily for pet and class-specific skill pools: each pool `pi` groups a set of skills that belong to a particular class or special-skill collection. The client's secondary index `TBL_INDEX_ARRAY[56] = "pi"` (at `GamePredef.as:8371`) buckets pool entries by `pi`, enabling lookups of all skills in a given pool via `gameDataIndex[56][pi]`.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key (row identifier). |
| `pi` | int | Pool ID. Groups skills into a named collection (e.g. class skill pool, pet skill pool). Secondary index key — `gameDataIndex[56][pi]` returns all rows for a pool. 197 distinct `pi` values in this export; pools `0`–`22` appear to be class/pet pools (2–11 skills each); pools `100`+  are singletons (one skill per pool, likely special/event pools). |
| `si` | int | FK → [[TBL_SKILL]].`id`. The skill belonging to this pool. |

## Value distributions / sentinels

- Pools with multiple members: `pi=2`×11, `pi=22`×11, `pi=1`×10, `pi=3`–`pi=4`×10 each, `pi=6`×9, `pi=8`–`pi=20`×6 each. These are the class/character skill pools.
- `pi=0`×3 (3 skills): shared/universal pool.
- `pi=5`×1: single-skill pool (id 213, si=2835).
- Pools `pi=100` through `pi=280`: singletons (one entry each), likely individual special or event skills.

## Client usage

No direct UI-level access found for `TBL_SKILL_POOL` during analysis — it is loaded into `GameData.d[56]` at startup and its secondary index is registered, but no `ui/`, `logic/`, or `object/` file was found reading from it by constant name. The pool groupings likely inform server-side skill distribution logic (e.g. which class can learn which pet skill). `(inferred from data structure — no UI client usage recovered)`

## Related tables

- `si` → [[TBL_SKILL]].`id` (the pooled skill).
- Pool membership complements class restrictions on [[TBL_SKILL]].`reqClass`.
