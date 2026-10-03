# TBL_CREATURE_SKILL

| Property | Value |
|---|---|
| Table ID | 14 |
| Record count | 1861 |
| JSON | `docs/database/game_data/TBL_CREATURE_SKILL.json` |
| Client constant | `GamePredef.TBL_CREATURE_SKILL = 14` |

## Purpose

Maps creatures to their skill loadout. Each row binds one skill (`sid`) to one creature (`cid`). The table is indexed by `cid` so the client can fetch all skills for a given creature with `gameDataIndex[TBL_CREATURE_SKILL][cid]`. 741 distinct creatures have at least one skill row; a creature can have multiple rows. Used in the Pet Handbook and Pet Intro panel to display skill slots.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Row primary key (global sequence). Not used as a lookup key; the index key is `cid`. |
| `cid` | int | Foreign key → [[TBL_CREATURE]].`id`. The creature that owns this skill. Client index: `TBL_INDEX_ARRAY[TBL_CREATURE_SKILL] = "cid"`. |
| `sid` | int | Foreign key → TBL_SKILL.`id`. The skill assigned to this creature. Client reads `_local_18.sid` and loads it via `getGameData(TBL_SKILL, sid)` (`GameIntroPanel.as:6764` context). |
| `position` | string | Always empty (`""`) in this dump. Reserved slot-position identifier — used in the player skill system (e.g., `SkillUseSlot.as:344`) but never populated for creature skills in this export. (inferred from data — no creature-specific client read found) |

## Value distributions / sentinels

- `position`: `""`×1861 — uniformly empty for all creature skill rows in this dataset.
- `cid`: 741 distinct creature IDs have at least one entry; average ~2.5 skills per creature, max ~9 (e.g., cid 152 has 9 rows).

## Client usage

- `GameIntroPanel.as:6764` — loads all skills for a creature via `gameDataIndex[TBL_CREATURE_SKILL][cid]`, then iterates to populate up to 4 skill slots (`skillSlot1`–`skillSlot4`) with data from TBL_SKILL.
- `GamePredef.as:8330` — sets `TBL_INDEX_ARRAY[TBL_CREATURE_SKILL] = "cid"`, enabling `gameDataIndex[14]` lookup.

## Related tables

- `cid` → [[TBL_CREATURE]]: creature template that owns these skills.
- `sid` → TBL_SKILL: skill definition (name, effects, animation).
