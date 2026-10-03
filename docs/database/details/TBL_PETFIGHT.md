# TBL_PETFIGHT

| Property | Value |
|---|---|
| Table ID | 81 |
| Record count | 0 (empty export) |
| JSON | `docs/database/game_data/TBL_PETFIGHT.json` |
| Client constant | `GamePredef.TBL_PETFIGHT = 81` |

## Purpose

Runtime instance table for Pet Fight (Đấu Thú) arena battle records. No static rows exist in the client dump; records are server-managed per-match or per-character. The client references this table type when replaying pet arena battles (RPC `replayPetFight`) and rendering fight configuration panels (`PetFightConf`, `PetFightConfActivity`, `MCZDPetFightConf`).

## Key reference

Empty export; no static rows. Client constant is present. No `gameData[GamePredef.TBL_PETFIGHT]` or `GameData.d[81]` field-level reads were found in non-data AS files — battle records appear to be received as standalone server-push objects rather than being indexed into the GameData array.

Fields inferred from RPC and panel usage:

| Key | Type | Function |
|---|---|---|
| `id` | int | Battle/match record ID. Passed to `remote.call("replayPetFight", null, id)` in `LinkEventUtil.as:388,794` and `ReplayListDetail.as:257`. |

## Client usage

- `LinkEventUtil.as:388` — `remote.call("replayPetFight", null, _local_4[1])` — replay a pet fight by ID from a chat hyperlink.
- `LinkEventUtil.as:794` — `remote.call("replayPetFight", null, event.item.id)` — replay from a list selection.
- `ReplayListDetail.as:257` — `remote.call("replayPetFight", null, _bid)` — replay from a detail view.
- `PanelLayer.as:3739,8379,8763` — panel routing for `PetFightConf`, `PetFightConfActivity`, `MCZDPetFightConf` arena configuration panels.

## Related tables

- Pet combatants are from [[TBL_PET]] (runtime instance).
- Arena configuration references [[TBL_CREATURE]] templates for AI pet stats.
