# TBL_CARVE_MASTER

| Property | Value |
|---|---|
| Table ID | 140 |
| Record count | 48 |
| JSON | `docs/database/game_data/TBL_CARVE_MASTER.json` |
| Client constant | `GamePredef.TBL_CARVE_MASTER = 140` |

## Purpose

Defines the master-level bonus stat grants for the Văn Chỉ (KP / carving) system. Each record represents one master level (1–48) and lists up to 5 bonus properties (type + value pairs) that are permanently added to the player's stats at that master level. These are displayed as cumulative permanent bonuses in the KP panel ("mmp" labels).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key and master level number (1–48). Looked up as `GameData.d[140][masterLevel]`. |
| `p1` | int | Property type ID for bonus slot 1. Maps to `Language.PROP_NAME_U[p1]` for label display (`PetPVESystem.as:2141`). |
| `p2` | int | Property type ID for bonus slot 2 (`PetPVESystem.as:2142`). |
| `p3` | int | Property type ID for bonus slot 3 (`PetPVESystem.as:2143`). |
| `p4` | int | Property type ID for bonus slot 4 (`PetPVESystem.as:2144`). |
| `p5` | int | Property type ID for bonus slot 5 (`PetPVESystem.as:2145`). |
| `pv1` | int | Property value for bonus slot 1. Displayed as `Number(pv1)` next to `Language.PROP_NAME_U[p1]`. |
| `pv2` | int | Property value for bonus slot 2. |
| `pv3` | int | Property value for bonus slot 3. |
| `pv4` | int | Property value for bonus slot 4. |
| `pv5` | int | Property value for bonus slot 5. |

## Value distributions / sentinels

- `id`: 1–48, one record per master level (20 levels are shown in the lev distribution for TBL_CARVE; master levels extend beyond).
- Property types used (from sample records): `p1=1` (Hp), `p2=4` (Công vlý), `p3=5`, `p4=6`, `p5=7` — consistent with the same property-type enum used by [[TBL_CARVE]] and [[TBL_DECO_RUNE]].
- `pv*` values are integers (no decimal strings); scale upward with master level.

## Client usage

- `PetPVESystem.as:2140–2145` — after computing a player's carve master level from their KP data, loads `GameData.d[GamePredef.TBL_CARVE_MASTER][masterLevel]` and displays all 5 property bonus pairs in the "mmp" label row:
  - `mmp1.text = PROP_NAME_U[p1] + ": " + Number(pv1)`
  - `mmp4.text = PROP_NAME_U[p2] + ": " + Number(pv2)`
  - `mmp5.text = PROP_NAME_U[p3] + ": " + Number(pv3)`
  - (and p4/pv4, p5/pv5 in additional labels)
- `PetPVESystem.as:3526` — second lookup to refresh master-level display after a KP spend action.

## Related tables

- `p1`–`p5` (property type enum) shared with [[TBL_CARVE]] (`p` field), [[TBL_DECO_RUNE]] (`propType`), [[TBL_DECO_HOLE]] (`propType1`–`propType4`).
- [[TBL_CARVE]] — per-node carve progression within the same Văn Chỉ system.
- [[TBL_CARVE_AWARD]] — floor reward table for the same Văn Chỉ dungeon.
