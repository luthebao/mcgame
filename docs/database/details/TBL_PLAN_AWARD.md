# TBL_PLAN_AWARD

| Property | Value |
|---|---|
| Table ID | 43 |
| Record count | 0 |
| JSON | `docs/database/game_data/TBL_PLAN_AWARD.json` |
| Client constant | `GamePredef.TBL_PLAN_AWARD = 43` |

## Purpose

Intended to hold additional/guaranteed award rows attached to a parent plan — a secondary award layer beyond the probability-rolled entries in [[TBL_PLAN]]. The index key is `pid` (`TBL_INDEX_ARRAY[TBL_PLAN_AWARD] = "pid"`, `GameData.as:8359`), linking each award row to a parent plan ID. The table is empty in the client data export; in practice all awards are defined directly as [[TBL_PLAN]] rows.

## Key reference

Empty export; no static rows. Client constant `GamePredef.TBL_PLAN_AWARD = 43` is present (`GamePredef.as:536`). Index key is `pid` (`GameData.as:8359`). No field-level usage recovered from any UI/logic `.as` file.

## Client usage

Loaded into GameData slot 43 but not read by any UI or logic `.as` file found in `docs/client/`. The constant and index registration exist but are unused at the client level in this build.

## Related tables

- `pid` → [[TBL_PLAN]].`id` (the plan entry this supplemental award belongs to).
- See also [[TBL_PLAN_KIND]] (id=62) and [[TBL_PLAN_REQUIRE]] (id=44).
