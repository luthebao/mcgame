# TBL_SKILL_KIND

| Property | Value |
|---|---|
| Table ID | 55 |
| Record count | 4 |
| JSON | `docs/database/game_data/TBL_SKILL_KIND.json` |
| Client constant | `GamePredef.TBL_SKILL_KIND = 55` |

## Purpose

Enum lookup table mapping skill-kind numeric IDs to their Chinese internal category names. At runtime the client does not query this table directly — instead it uses the pre-built `GamePredef.SKILL_KIND_NAME` array (populated from `Language.as`) for Vietnamese display strings. TBL_SKILL_KIND is loaded into `GameData.d[55]` but has no confirmed direct UI/logic access; the `TBL_INDEX_ARRAY[55] = "sid"` entry in `GamePredef.as:8370` is vestigial (the exported records use `id`, not `sid`).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Corresponds to the `kind` field in [[TBL_SKILL]]. |
| `name` | string | Internal Chinese category label (not shown in UI; Vietnamese labels come from `GamePredef.SKILL_KIND_NAME` array). |

## Value distributions / sentinels

All 4 records:

| id | name (internal) | Vietnamese label (SKILL_KIND_NAME) | TBL_SKILL.kind count |
|---|---|---|---|
| 1 | 主动技能 | Chủ động (Active) | 3443 |
| 2 | 被动技能 | Bị động (Passive) | 1031 |
| 3 | Buff技能 | Trạng thái (Buff/Status) | 246 |
| 4 | 功能技能 | Chức năng (Functional) | 57 |

Note: `kind = 5` (Luyện / Training-ring, 130 records in TBL_SKILL) has no corresponding row here — it is defined only in `SKILL_KIND_NAME[5] = Language.GAMEPREDEF_S[365]` ("Luyện") at `GamePredef.as:1461`.

## Client usage

Loaded into `GameData.d[55]` on startup. Not accessed directly by any UI or logic file found during analysis. `GamePredef.SKILL_KIND_NAME` (a 6-element array built from Language strings) is the actual runtime source for kind labels used in `TipSkill.as:295`.

## Related tables

- `id` is the value of `kind` in [[TBL_SKILL]].
- Sub-types within each kind are in [[TBL_SKILL_TYPE]].
