# TBL_NPC_CREATURE

| Property | Value |
|---|---|
| Table ID | 36 |
| Record count | 1553 |
| JSON | `docs/database/game_data/TBL_NPC_CREATURE.json` |
| Client constant | `GamePredef.TBL_NPC_CREATURE = 36` |

## Purpose

Defines the creature-encounter roster attached to specific NPC battle points. Each row binds a creature template (`cid`) to an NPC (`nid`) with level scaling, XP override, spawn-probability range, boss tier, and uniqueness flags. The primary index key is `nid` (`TBL_INDEX_ARRAY[TBL_NPC_CREATURE] = "nid"`, `GamePredef.as:8352`), so the server can pull all creatures for a given NPC battle node in one lookup.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key of this creature-assignment row. |
| `nid` | int | Foreign key → [[TBL_NPC]].`id`. The NPC battle node that hosts this creature. Primary index key. |
| `cid` | int | Foreign key → TBL_CREATURE.`id`. The creature template to spawn. |
| `level` | int | Forced level for this creature instance, overriding the creature template's base level. |
| `qLevel` | int | Quality/difficulty tier. `3` = Cao cấp (advanced, 1537 records), `0` = unranked (16 records). Maps to `GamePredef.CREATURE_QLEVEL` labels: index 1 = "Sơ cấp ", 2 = "Trung cấp ", 3 = "Cao cấp " (`GamePredef.as:1245`, `Language.as:2538–2540`). |
| `bossFlag` | int | Spawn tier. `0` = normal encounter (351), `1` = named/elite boss (375), `2` = world/field boss (827). Used by server to determine spawn priority and loot table. |
| `uniqueFlag` | int | `1` = only one instance of this creature spawns at a time (1065 records); `0` = multiple can coexist (488 records). (inferred from data — no direct client read found) |
| `exp` | int | XP override for killing this creature. `−1` = use formula default (612 records); `1` = minimal; positive integers = absolute XP grant. |
| `expMulti` | float | XP multiplier applied on top of base XP (before `exp` override). `"1.00"` for the vast majority. |
| `expSet` | int | XP calculation mode. `0` = standard (1187 records), `2` = use absolute `exp` value (366 records). When `expSet == 2`, `exp` is treated as a direct value rather than a modifier. |
| `startRate` | int | Lower bound (inclusive) of the probability range for this creature to appear in a random encounter. Integer percentage 0–100. |
| `endRate` | int | Upper bound (exclusive) of the probability range. A random roll in `[startRate, endRate)` selects this creature. Most single-creature NPC nodes have startRate=0, endRate=100. |

## Value distributions / sentinels

- `bossFlag`: 0×351, 1×375, 2×827.
- `uniqueFlag`: 0×488, 1×1065.
- `qLevel`: 0×16, 3×1537.
- `expSet`: 0×1187, 2×366.
- `exp = −1` means "let the formula compute it"; present in 612 rows.

## Client usage

Loaded into `GameData.d[36]` and indexed by `nid` via `TBL_INDEX_ARRAY[TBL_NPC_CREATURE]`. No UI or logic file outside of `GameData.as`/`moreData.as` was found reading records from this table directly. Encounter resolution is server-side: the server uses `startRate`/`endRate` to roll the encounter creature and sends the result to the client. The client's quest battle system (`QuestBattle.as` / battle handlers) receives creature IDs from the server.

## Related tables

- `nid` → [[TBL_NPC]].`id` (owning NPC battle node)
- `cid` → TBL_CREATURE.`id` (creature template)
