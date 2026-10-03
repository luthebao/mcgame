# TBL_CHARACTOR_SKILL

| Property | Value |
|---|---|
| Table ID | 8 |
| Record count | 0 (runtime/instance table) |
| JSON | `docs/database/game_data/TBL_CHARACTOR_SKILL.json` |
| Client constant | `GamePredef.TBL_CHARACTOR_SKILL = 8` |

## Purpose

Runtime per-character skill instance table. Holds each character's learned skills as live session data delivered by the server — not exported as static rows. The client registers a secondary index `TBL_INDEX_ARRAY[8] = "cid"` (at `GamePredef.as:8324`), meaning instances are bucketed by character ID (`cid`), enabling `gameDataIndex[8][cid]` to return all skills for a given character.

## Classification

Instance / runtime / character-scoped. No static rows exist. Data arrives from the server as AMF0 objects during login or skill-learn/upgrade callbacks and is merged into `GameData.d[8]`.

## Key reference

Empty export; fields inferred from the secondary index definition and the `TBL_INDEX_ARRAY` registration:

| Key | Inferred Type | Function |
|---|---|---|
| `cid` | int | Character ID. Secondary index key — identifies which character owns this skill instance. `(inferred from TBL_INDEX_ARRAY[8] = "cid" at GamePredef.as:8324)` |
| `sid` | int | FK → [[TBL_SKILL]].`id`. The skill template this instance refers to. `(inferred from how player.skillList entries expose .sid in SkillManager.as:969 and UserBarCanvas.as:2703)` |
| `position` | int | Hotbar slot position the skill is assigned to. Read in `SkillManager.as:974` as `_local_4.position`. `(inferred from SkillManager.as usage)` |
| `kind` | int | Kind value copied from the skill template at the time of learning. Read in `SkillManager.as:979` as `_local_4.kind`. `(inferred from SkillManager.as usage)` |

## Client usage

- `GamePredef.TBL_CHARACTOR_SKILL` constant declared at `GamePredef.as:501`.
- Secondary index registered at `GamePredef.as:8324`: `TBL_INDEX_ARRAY[8] = "cid"`.
- The constant itself is not referenced in any `ui/`, `logic/`, or `object/` file found during grep — the client accesses character skill data via `_core.player.skillList` (a separate in-memory list populated from server callbacks) rather than `GameData.d[8]`.
- `player.skillList` entries have at minimum: `sid` (skill template id), `position` (hotbar position), `kind` (from template). These are read in `SkillManager.as:967–984`, `UserBarCanvas.as:2703`.

## Related tables

- `sid` → [[TBL_SKILL]] (the learned skill template).
- `cid` → player character identity (session-scoped).
