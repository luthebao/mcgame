# TBL_BATTLE_REPORT

| Property | Value |
|---|---|
| Table ID | 84 |
| Record count | 0 |
| JSON | `docs/database/game_data/TBL_BATTLE_REPORT.json` |
| Client constant | `GamePredef.TBL_BATTLE_REPORT = 84` |

## Purpose

Runtime table for battle-result log entries. The constant exists in `GamePredef.as` but the table is not registered in `TBL_INDEX_ARRAY` and no client `.as` code reads or writes `GameData.d[84]`. Battle results are delivered as transient callback payloads (e.g. `onMCZDFightResult` for the arena, `MCZDBattleReport`/`StarBattleReport` pop-up panels) rather than being stored in a client-side game-data array.

Empty export; no static rows. Client constant present but no field-level usage recovered.

## Key reference

No field-level client usage recovered. The report objects delivered by arena/cross-server callbacks include transient fields such as `iswin`, `cpt`, and `list[n].{bid, result}` (`MCZDBattleReport.as:276–317`), but these are not stored under `TBL_BATTLE_REPORT` — they are ephemeral display objects.

## Client usage

- `GamePredef.as:575` — `TBL_BATTLE_REPORT:uint = 84` constant declared.
- `GamePredef.as` (TBL_INDEX_ARRAY block) — **not** registered; no index key assigned.
- `MCZDBattleReport.as` and `StarBattleReport.as` — display panels for transient battle results, but they do not reference `GameData.d[84]`.
- `PopupLayer.as:326`, `340`, `1139`, `1251` — panels registered in the UI layer by class name, with no table-data binding.

## Related tables

- Logically associated with arena/cross-server combat systems (MCZD panel, Star-battle system).
- Report subjects are [[TBL_CHARACTOR]] entities.
