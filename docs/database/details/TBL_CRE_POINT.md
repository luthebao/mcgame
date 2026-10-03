# TBL_CRE_POINT

| Property | Value |
|---|---|
| Table ID | 15 |
| Record count | 0 (empty export) |
| JSON | `docs/database/game_data/TBL_CRE_POINT.json` |
| Client constant | `GamePredef.TBL_CRE_POINT = 15` |

## Purpose

Empty export; no static rows exist in the client data dump. Based on the GamePredef registration this is a runtime or instance-scoped table — likely tracking per-player creature/pet point accumulation (e.g., capture points, taming score, or creature energy points). The client registers no index keys and no secondary/tertiary indexes for this table, consistent with a live-state table that does not require the static-data lookup patterns used by template tables.

## Client usage

All three index arrays are `null` for this table:

```
TBL_INDEX_ARRAY[TBL_CRE_POINT]  = null   // GamePredef.as:8331
TBL_INDEX_ARRAY2[TBL_CRE_POINT] = null   // GamePredef.as:8419
TBL_INDEX_ARRAY3[TBL_CRE_POINT] = null   // GamePredef.as:8494
LINK_TYPE_ARRAY[TBL_CRE_POINT]  = "EL"  // GamePredef.as:8560
```

`LINK_TYPE_ARRAY[15] = "EL"` matches the same link type as `TBL_ELEMENT_TEMPLATE` ("ELT"), suggesting creature points may relate to elemental progression or elemental energy accumulation. No `.as` file outside `GamePredef.as` references `TBL_CRE_POINT` or `GameData.d[15]`, so no field-level schema can be recovered from static analysis.

Empty export; no static rows. Client constant present (`GamePredef.TBL_CRE_POINT = 15`) but no field-level usage recovered from any `.as` file.

## Related tables

- Likely related to [[TBL_CREATURE]] (creature type tracked) and possibly [[TBL_ELEMENT_TEMPLATE]] (given `LINK_TYPE = "EL"`).
