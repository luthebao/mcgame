# TBL_CREATUREH_COMBINE

| Property | Value |
|---|---|
| Table ID | 132 |
| Record count | 1710 |
| JSON | `docs/database/game_data/TBL_CREATUREH_COMBINE.json` |
| Client constant | `GamePredef.TBL_CREATUREH_COMBINE = 132` |

## Purpose

Defines heart combination bonus recipes: the bonus stat a player earns when a specific combination of heart types (by combat class) are placed together in a heart container. Each record represents one valid multi-heart placement pattern on a given line, identifying what stat bonus (`propType1` / `pNum1`) the combination yields and the maximum it can reach (`maxNum`). The client uses this table both for a recipe browser (paginated label list) and for live bonus calculation during heart socketing.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key, 5-digit encoded: leading digit = box index (1–5), next two digits = a group prefix tied to `lineCombine`, last two digits = variant index within that group. Looked up as `GameData.d[132][id]` for direct lookup, or via `_dm.gameDataIndex[TBL_CREATUREH_COMBINE]` (secondary index on `disPlay`) for UI browsing (`MonsterHeartPanel.as:3659`). |
| `name` | string | Vietnamese display name of the combination bonus, e.g. `"Mũi Tên Kỵ Sĩ"`. Shown in the combine recipe browser label (`MonsterHeartPanel.as:3663`, `4764`). |
| `disPlay` | int | Secondary index key. The client's `gameDataIndex[TBL_CREATUREH_COMBINE]` groups records by this value (from `GameData.as:8401`). `−1` for 1562/1710 records (not browseable in main list); positive integers (1–148) are the display group/page numbers. |
| `lineCombine` | int (as string) | Heart line index within the container where this combination is active. Parsed as a single integer or a pipe-list (in the data it appears as a single value like `"3"` or `"5"`). The client reads `lineCombine.split("|")` to get the affected line set (`MonsterHeartPanel.as:4748`). |
| `typeCombine` | pipe-list | Pipe-separated list of heart type IDs (1–7) that must be placed to trigger this combination. Each element maps to `MONHEART_TYPE` (e.g. `"1|1"` = two Người-type hearts). Displayed to the player as the required heart combo (`MonsterHeartPanel.as:3664–3675`). |
| `maxNum` | int | Maximum bonus magnitude the combination can reach (raw, divide by 10000 for display). Shown in the recipe browser's `showMax` label (`MonsterHeartPanel.as:3678–3679`). |
| `pidCombine` | pipe-list | Pipe-separated slot position indices (within the line) that must be filled to form this combination, e.g. `"1|2"`. `(inferred from data — no direct client field read found; position IDs used for slot targeting)` |
| `propType1` | int | Primary stat bonus type. Same ID space as `TBL_CREATUREH_HEART.propType`; displayed via `Language.TIP_MONSTER_H[propType1]` (`MonsterHeartPanel.as:3676–3677`, `4765,4790`). |
| `propType2` | int | Secondary stat type. Always `−1` in current data — reserved for multi-stat combos not yet implemented. |
| `propType3` | int | Tertiary stat type. Always `−1` in current data — reserved. |
| `pNum1` | int | Primary bonus value (raw). Used in the formula `ceil((talent / 10000) × (containerNum / 10000) × pNum1)` to compute the actual bonus at a player's current talent level (`MonsterHeartPanel.as:4766`). |
| `pNum2` | int | Secondary bonus value. Always `−1` in current data — reserved. |
| `pNum3` | int | Tertiary bonus value. Always `−1` in current data — reserved. |

## Value distributions / sentinels

- `disPlay`: `−1`×1562 (hidden/inactive entries), then exactly one record per integer from `1` to `148`. The 148 positive-`disPlay` records are the named combinations shown in the recipe browser UI.
- `propType2`, `propType3`: all `−1` across all 1710 records (unused slots).
- `pNum2`, `pNum3`: all `−1` across all 1710 records (unused slots).
- `typeCombine`: always a pipe-list of integers 1–7 (matching `MONHEART_TYPE`); length 2–7 elements, reflecting combos of 2–7 hearts of specific types.
- `lineCombine`: single integer values `3`, `5`, `6`, `8`, `9`, `10`, `12` in the data — these reference specific positional lines inside a heart container.

## Client usage

- `MonsterHeartPanel.as:3659` (`labelDrawPage`) — secondary-index lookup by `disPlay` to page through the recipe browser. Reads `name`, `typeCombine`, `propType1`, `maxNum` from each result.
- `MonsterHeartPanel.as:4747–4790` — direct lookup `GameData.d[132][id]` using a constructed 5-digit key. Reads `lineCombine`, `name`, `propType1`, `pNum1` to compute and display active combination bonuses on a player's heart grid.
- `MonsterHeartPanel.as:4765–4790` — switch on `propType1` mirrors the same percentage vs. absolute display logic used in `TipMonsterHeart.as`.
- `GameData.as:8401` — `TBL_INDEX_ARRAY[TBL_CREATUREH_COMBINE] = "disPlay"` establishes the secondary index.

## Related tables

- `propType1` → `Language.TIP_MONSTER_H[]` (stat label strings).
- `typeCombine` values → `TipMonsterHeart.MONHEART_TYPE` (heart type name map).
- `id` prefix (first digit) → [[TBL_CREATUREH_CONTAIN]] box index (1–5 boxes).
- `lineCombine` → line positions within [[TBL_CREATUREH_CONTAIN]] heart container grid.
- [[TBL_CREATUREH_POINT]].`combine` field contains pipe-lists of COMBINE `id` values — each POINT slot lists which COMBINE recipes apply to it.
