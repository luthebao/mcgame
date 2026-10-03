# TBL_PET_SLOT

| Property | Value |
|---|---|
| Table ID | 41 |
| Record count | 0 (empty export) |
| JSON | `docs/database/game_data/TBL_PET_SLOT.json` |
| Client constant | `GamePredef.TBL_PET_SLOT = 41` |

## Purpose

Runtime instance table holding the soul-gem socket slots for each pet instance. Records are per-pet and server-managed; no static rows exist in the client dump. The secondary index `TBL_INDEX_ARRAY[41] = "pid"` (`GamePredef.as:8357`) groups slot records by pet instance ID.

## Key reference

Fields confirmed from `.as` client usage:

| Key | Type | Function |
|---|---|---|
| `pid` | int | Parent pet instance ID (`TBL_PET.id`). Index key for grouping all soul slots belonging to one pet. |

Empty export; no static rows. The client constant is present and the index scheme is confirmed (`TBL_INDEX_ARRAY[41] = "pid"`), but no direct `gameData[GamePredef.TBL_PET_SLOT]` reads were found in non-data AS packages. Soul slot data arrives attached to pet instance objects (likely as a nested array/object in the server push). The `BagPanel.as` references "PetSlot" only in the UI widget sense (bag inventory slots for pets), not as look-ups into this table.

## Client usage

- `TBL_INDEX_ARRAY[41] = "pid"` (`GamePredef.as:8357`) — confirms the grouping key.
- No `gameData[41]` or `GameData.d[GamePredef.TBL_PET_SLOT]` reads found in client logic/UI files.
- Pet soul panel (`PetSoulPanel`, `PetSoulCanvas`, `SoulExchangePanel`) reads soul data from runtime pet-instance objects rather than this table directly.

## Related tables

- `pid` → [[TBL_PET]] (parent pet instance).
- Soul gem definitions referenced by slot contents come from [[TBL_PET_SOUL]].
