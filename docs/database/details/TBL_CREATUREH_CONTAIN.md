# TBL_CREATUREH_CONTAIN

| Property | Value |
|---|---|
| Table ID | 133 |
| Record count | 30 |
| JSON | `docs/database/game_data/TBL_CREATUREH_CONTAIN.json` |
| Client constant | `GamePredef.TBL_CREATUREH_CONTAIN = 133` |

## Purpose

Defines the five heart containers (hộp ma tâm) and their six upgrade levels each. Each container is a named artefact that holds socketed Monster Hearts and can be levelled up by spending "Ma Năng" (MP-like energy) and gold. This table provides the cost and capacity data (EXP required, gold required, socket capacity) for each container–level combination. The client looks up records as `GameData.d[133][box*10 + level]`.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Composite primary key: `box * 10 + level`. First digit = box index (1–5); last digit = upgrade level (1–6). E.g. id `21` = box 2 level 1, id `36` = box 3 level 6. All 30 records follow this pattern (5 boxes × 6 levels). |
| `name` | string | Vietnamese display name of the container artefact. All six level rows share the same name for a given box: `"Hoang Nguyên Thời Kế"` (box 1), `"Hỏa Diệm Thánh Bôi"` (box 2), `"Vương Miện Pha Lê"` (box 3), `"Tử Điện Bảo Thạch"` (box 4), `"Quang Huy Chi Hoàn"` (box 5). |
| `exp` | int | Ma Năng (energy) cost to upgrade this container to the next level. Read as `GameData.d[133][boxId].exp` when prompting the player with the upgrade confirm dialog (`MonsterHeartPanel.as:4041`). Also used in the formula `resolveExp = exp × factor` for dissolving hearts (`MonsterHeartPanel.as:2767,4832`). |
| `goldNum` | int | Gold cost alternative for the upgrade (can pay gold instead of Ma Năng). Read as `GameData.d[133][boxId].goldNum` in the upgrade cost dialog (`MonsterHeartPanel.as:4073`). |
| `num` | int | Socket capacity threshold (stored as `num / 10000` when used as a ratio). In the combination-bonus formula `ceil((talent / 10000) × (num / 10000) × pNum1)` this controls the effectiveness cap of the container at this level (`MonsterHeartPanel.as:4751–4766`). Also displayed as a raw count in tooltip placeholders (`MonsterHeartPanel.as:4465`, `4846`). |
| `line` | pipe-list | Pipe-separated list of active combination line indices for this container level. E.g. `"3|5|6|8|9|12"` — the lines whose combination bonuses are active. The client splits this string to build the set of active `lineCombine` values (`MonsterHeartPanel.as:4712`). |

## Value distributions / sentinels

- `id`: 30 records, IDs `11–16`, `21–26`, `31–36`, `41–46`, `51–56`. No gaps.
- `num`: escalates per level — e.g. box 1 goes `10000→12000→14000→16000→18000→20000`. Box 2 escalates faster. At level 1 (id *1) all boxes start with their base capacity.
- `line`: box 1 uses `"3|5|6|8|9|12"` for all six levels, other boxes vary — higher levels add more active lines.
- `exp` and `goldNum` scale proportionally across levels within a box.

## Client usage

- `MonsterHeartPanel.as:4041` — reads `.exp` from `GameData.d[133][boxId]` to show Ma Năng upgrade cost.
- `MonsterHeartPanel.as:4073` — reads `.goldNum` to show gold upgrade cost alternative.
- `MonsterHeartPanel.as:4712` — reads `.line` string and splits on `"|"` to determine which combination lines are currently active for the container.
- `MonsterHeartPanel.as:4751` — reads `.num` to get the capacity divisor in the combination bonus formula.
- `MonsterHeartPanel.as:4831–4846` — reads `.exp` and `.num` for the upgrade progress display (ratio shown as `(num/100 - 100)%`).

## Related tables

- Box index (first digit of `id`) links to display artefact name (self-contained in `name` field).
- `line` values reference `lineCombine` entries in [[TBL_CREATUREH_COMBINE]].
- The `id` key (box × 10 + level) is also the lookup key used from [[TBL_CREATUREH_POINT]] context (client constructs `box*10 + heartBoxLev[box]` to read the current container level's row).
- Hearts placed inside these containers are defined in [[TBL_CREATUREH_HEART]].
- Socket slot unlock costs are in [[TBL_CREATUREH_POINT]].
