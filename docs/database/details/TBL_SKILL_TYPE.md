# TBL_SKILL_TYPE

| Property | Value |
|---|---|
| Table ID | 57 |
| Record count | 11 |
| JSON | `docs/database/game_data/TBL_SKILL_TYPE.json` |
| Client constant | `GamePredef.TBL_SKILL_TYPE = 57` |

## Purpose

Enum lookup table mapping skill sub-type IDs to their parent kind and an internal Chinese display name. The client does not query this table at runtime directly — it uses the pre-built `GamePredef.SKILL_TYPE_NAME` object (keyed by type int) for Vietnamese display strings in `TipSkill.as:295`. Loaded into `GameData.d[57]` at startup. `TBL_INDEX_ARRAY[57] = "sid"` at `GamePredef.as:8372` is vestigial (records use `id`).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key; corresponds to the `type` field in [[TBL_SKILL]]. |
| `kid` | int | Parent kind ID; FK → [[TBL_SKILL_KIND]].`id`. Links this sub-type to its kind category. |
| `name` | string | Internal Chinese label (not shown in UI; Vietnamese labels in `SKILL_TYPE_NAME`). |

## Value distributions / sentinels

All 11 records:

| id | kid | name (internal) | Vietnamese (SKILL_TYPE_NAME) | TBL_SKILL.type count |
|---|---|---|---|---|
| 1 | 1 | 物理近战 | Cận chiến | 836 |
| 2 | 2 | 物理远程(子弹) | Tầm xa | 118 |
| 3 | 3 | 魔法直接伤害 | Ma pháp | 813 |
| 4 | 8 | 魔法子弹伤害 | Ma pháp | 178 |
| 5 | 5 | 魔法恢复 | Ma pháp | 366 |
| 6 | 4 | 状态施加 | Trạng thái | 1041 |
| 7 | 6 | 状态清除 | Trạng thái | 82 |
| 8 | 7 | 功能伤害 | Đặc biệt | 157 |
| 9 | 9 | 功能恢复 | Đặc biệt | 47 |
| 10 | 10 | 其他(被动等) | Khác | 26 |
| 11 | 11 | 护卫 | Hỗ trợ | 971 |

Note: Life-skill types (`type` 14–24 in TBL_SKILL: Fishing, Plant, Herb, Cook, Pharmacy, Hidden Weapon, Sew, Cookbook) have no rows here — they are defined only in `GamePredef.as:1474–1481` constants and all map to the same Vietnamese label from `Language.GAMEPREDEF_S[404]` ("Kỹ năng sống" / life skills, inferred from context).

## Client usage

Loaded into `GameData.d[57]` on startup. Not accessed directly by any UI file found during analysis. `GamePredef.SKILL_TYPE_NAME` (an Object keyed by type int, built at `GamePredef.as:9891–9908`) is the actual runtime source for type labels used in `TipSkill.as:295`.

## Related tables

- `id` is the value of `type` in [[TBL_SKILL]].
- `kid` → [[TBL_SKILL_KIND]].
