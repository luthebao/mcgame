# TBL_ARTIFACT

| Property | Value |
|---|---|
| Table ID | 102 |
| Record count | 300 |
| JSON | `docs/database/game_data/TBL_ARTIFACT.json` |
| Client constant | `GamePredef.TBL_ARTIFACT = 102` |

## Purpose

Defines the Magic Weapon Stage (Thần Binh Thức / Artifact forging) progression table. Each record is one upgrade stage for a specific equipment template (`tid`). For a given equipment, stages are chained by `level`; the client looks up the current stage by matching the equipment's live `mainPropNum1`/`mainPropNum2` against `propNum1`/`propNum2`. Upgrading costs `spiritNum` spirituality points and `itemNum` of a catalyst item, with a success `rate`.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Table is indexed by `tid` as secondary key: `TBL_INDEX_ARRAY[TBL_ARTIFACT] = "tid"` (`GameData.as:8396`). |
| `tid` | int | Foreign key to `TBL_EQUIPT_TEMPLATE.id`. Identifies which equipment template this stage table applies to. 6 unique `tid` values in this dataset (1348–1353), 50 stages each. Looked up via `gameDataIndex[102][equInst.tid]` at `EquiptFuncPanel.as:8523`. |
| `level` | int | Stage level within this equipment's chain (1–50). Read at `EquiptFuncPanel.as:8528,12303,12311` to find the next stage. Appended to the equipment name as `"+{level}"` in `TipEquip.as:2909`. |
| `propNum1` | int | First main-stat threshold value. The client matches `equInst.mainPropNum1 == stageMeta.propNum1` to locate the current stage at `EquiptFuncPanel.as:8540,12301`. |
| `propNum2` | int | Second main-stat threshold value. Paired check with `propNum1`. |
| `spiritNum` | int | Spirituality (灵力) cost to attempt this upgrade. Checked against `charProp.spirituality` at `EquiptFuncPanel.as:8549`. |
| `itemNum` | int | Number of catalyst items required. Checked against `stageItem.stackNum` at `EquiptFuncPanel.as:8554`. Displayed at `EquiptFuncPanel.as:12327`. |
| `rate` | int | Success probability percentage (30–100). Most stages are 30%; higher rates appear at lower levels. Displayed as `"{rate}%"` at `EquiptFuncPanel.as:12322`. Note: modified by `MC_BIRTH_CONFIG[18][level]` if the player has birth flag 18 active. |

## Value distributions / sentinels

- `tid`: 6 unique values (1348–1353), 50 stages each = 300 records.
- `level`: 1–50, 6 records per level (one per tid).
- `rate`: 30% for most stages (90 records); 35–55% for levels 2–10 range; 60–100% for earliest stages. Level 1 always `rate=100`.
- `spiritNum`: scales from 100,000 at stage 1 to 5,000,000 at stage 50.
- `itemNum`: scales from 10 at stage 1 to 170 at stage 50.

## Client usage

- `EquiptFuncPanel.as:8522–8547` — Magic Weapon Stage upgrade: loads `gameDataIndex[102][equInst.tid]`, finds current stage by `propNum1/propNum2` match, reads `spiritNum` and `itemNum` for cost validation.
- `EquiptFuncPanel.as:12293–12328` — UI preview: iterates stage dict by `level`, reads `rate`, `itemNum`, `spiritNum` for display; appends `"+level"` suffix.
- `TipEquip.as:2904–2909` — tooltip: loads `gameDataIndex[102][inst.tid]`, finds matching stage, appends `"+{level}"` to equipment name.

## Related tables

- `tid` → [[TBL_EQUIPT_TEMPLATE]] (the equipment this stage chain belongs to).
- Secondary index: `TBL_INDEX_ARRAY[TBL_ARTIFACT] = "tid"` — client accesses as `gameDataIndex[102][tid]` returning all stages for that equipment as a dict keyed by stage `id`.
- `GamePredef.ARTIFACT_QUALITY_ARR` and `STAGE_EIGHT_MIN/MAX` constants control threshold comparisons (`TipEquip.as:2926–2928`).
