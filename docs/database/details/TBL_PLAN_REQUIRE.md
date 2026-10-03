# TBL_PLAN_REQUIRE

| Property | Value |
|---|---|
| Table ID | 44 |
| Record count | 0 |
| JSON | `docs/database/game_data/TBL_PLAN_REQUIRE.json` |
| Client constant | `GamePredef.TBL_PLAN_REQUIRE = 44` |

## Purpose

Intended to hold prerequisite/requirement rows for loot plans — conditions that must be satisfied before a [[TBL_PLAN]] entry can be awarded (e.g., minimum level, class, quest state). The index key is `pid` (`TBL_INDEX_ARRAY[TBL_PLAN_REQUIRE] = "pid"`, `GameData.as:8360`), where `pid` is the parent plan ID, indicating a one-to-many relationship with [[TBL_PLAN]]. The table is empty in the client data export; requirement logic appears to be handled server-side or via the `qid` and `p` fields directly in [[TBL_PLAN]].

## Key reference

Empty export; no static rows. Client constant `GamePredef.TBL_PLAN_REQUIRE = 44` is present (`GamePredef.as:537`). Index key is `pid` (parent plan ID, per `GameData.as:8360`). No field-level usage recovered from any UI/logic `.as` file.

## Client usage

Loaded into GameData slot 44 but not read by any UI or logic `.as` file found in `docs/client/`. The constant and index registration exist but are unused at the client level in this build.

## Related tables

- `pid` → [[TBL_PLAN]].`id` (the plan entry this requirement applies to).
- See also [[TBL_PLAN_KIND]] (id=62) and [[TBL_PLAN_AWARD]] (id=43).
