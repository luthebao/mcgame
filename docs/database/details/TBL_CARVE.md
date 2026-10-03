# TBL_CARVE

| Property | Value |
|---|---|
| Table ID | 138 |
| Record count | 960 |
| JSON | `docs/database/game_data/TBL_CARVE.json` |
| Client constant | `GamePredef.TBL_CARVE = 138` |

## Purpose

Defines every individual carve/engrave node in the Pet PVE (Văn Chỉ / "KP") carving system. Each record is one upgrade step on a specific icon slot within a specific equipment part. The ID encodes position directly: `id = (part × 1000) + (icon × 100) + lev`, so `id 1101` means part 1, icon slot 1, level 1.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Composite: `(part × 1000) + (icon × 100) + lev`. Looked up as `GameData.d[138][id]`. |
| `part` | int | Equipment slot index (1–8). Corresponds to one of 8 gear positions that can be engraved. 120 records per part value. |
| `icon` | int | Icon/node slot within the part (1–6). Each part has 6 icon sub-slots. 160 records per icon value. |
| `lev` | int | Upgrade level of this carve node (1–20). 48 records per level value. |
| `p` | int | Property type ID. Maps to `Language.PROP_NAME_U[p]` for display (e.g., `1`=Hp, `4`=Công vlý, `13`=percent crit). 80 records per p value across 12 distinct prop types. |
| `pv` | float | Property value granted at this level for property type `p`. Read as `Number(_local_9.pv)` in `PetPVESystem.as:2124`. |
| `costkp` | int | Văn Chỉ (KP) currency cost to upgrade this node to the next level. Displayed in `kpConsume` label (`PetPVESystem.as:3014,3027`). |

## Value distributions / sentinels

- `part`: values 1–8, exactly 120 records each (8 parts × 6 icons × 20 levels = 960 total).
- `icon`: values 1–6, exactly 160 records each.
- `lev`: values 1–20, exactly 48 records each (8 parts × 6 icons = 48 nodes per level).
- `p`: 12 distinct property types (1, 4, 5, 6, 7, 8, 9, 11, 13, 31, 32, 58), 80 records each. Each icon slot across all parts uses the same `p` type at all levels.
- `pv`: float string with 5 decimal places (e.g., `"30.00000"`, `"0.05000"`). Absolute values for integer-type props, fractional for percentage props.
- `costkp`: increases with `lev`; level-1 nodes cost 25 KP, higher levels cost more.

## Client usage

- `PetPVESystem.as:2118–2128` — iterates carve node IDs from player's KP data, accumulates total prop bonuses per property type by summing `pv` values grouped by `p`.
- `PetPVESystem.as:3008–3027` — displays current (`nowp`) and next-level (`nextp`) property stat with `Language.PROP_NAME_U[p]` label; shows `costkp` cost for upgrade.
- `PetPVESystem.as:3024` — constructs ID directly as `((part+1)*1000) + ((icon+1)*100) + 1` to find a node from UI selection state (`partIndex`, `iconIndex`).
- Key computation confirmed: `PetPVEIcon.as` uses `partIndex` (0-based) and `iconIndex` (0-based) while the table uses 1-based `part` and `icon`.

## Related tables

- `p` (property type) is the same enum as `propType` in [[TBL_DECO_RUNE]], [[TBL_DECO_HOLE]], [[TBL_DECO_SHOW]], and equipment stat systems.
- [[TBL_CARVE_MASTER]] — master stats for the carve system per player carve-master level (look up by player's master level `id`).
- [[TBL_CARVE_AWARD]] — reward table for reaching Văn Chỉ floor milestones (indexed by `lev`).
