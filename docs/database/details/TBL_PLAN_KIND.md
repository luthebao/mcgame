# TBL_PLAN_KIND

| Property | Value |
|---|---|
| Table ID | 62 |
| Record count | 0 |
| JSON | `docs/database/game_data/TBL_PLAN_KIND.json` |
| Client constant | `GamePredef.TBL_PLAN_KIND = 62` |

## Purpose

Intended to define named categories or "kinds" of loot plans, likely used to group [[TBL_PLAN]] entries by drop-plan category (e.g., "monster drops", "quest rewards", "event items"). The table is empty in the client data export, suggesting this classification was either moved server-side or the feature was never fully populated.

## Key reference

Empty export; no static rows. Client constant `GamePredef.TBL_PLAN_KIND = 62` is present. The secondary index is set to `null` (`TBL_INDEX_ARRAY[TBL_PLAN_KIND] = null`, `GameData.as:8377`), indicating no field-level indexing. No UI/logic code reads from `GameData.d[62]`; no field-level usage recovered.

## Client usage

Loaded into the GameData table array at slot 62 but not accessed by any UI or logic `.as` file found in `docs/client/`. The constant exists in `GamePredef.as:555`.

## Related tables

- Intended companion to [[TBL_PLAN]] (categorizes plan entries by kind).
- See also [[TBL_PLAN_REQUIRE]] (id=44) and [[TBL_PLAN_AWARD]] (id=43) for the full plan sub-table group.
