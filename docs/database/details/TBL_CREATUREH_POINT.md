# TBL_CREATUREH_POINT

| Property | Value |
|---|---|
| Table ID | 134 |
| Record count | 35 |
| JSON | `docs/database/game_data/TBL_CREATUREH_POINT.json` |
| Client constant | `GamePredef.TBL_CREATUREH_POINT = 134` |

## Purpose

Defines the seven socket slots (lỗ khảm) within each of the five heart containers and the cost to unlock each slot. Each slot has a permitted heart `type` filter, an item (usually a diamond/Kim Cương gem) plus a gold cost to open it, and a list of which [[TBL_CREATUREH_COMBINE]] recipes can fire through it. The client accesses slots as `GameData.d[134][box*10 + slot]` where slot is 1–7.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Composite primary key: `box * 10 + slot`. First digit = box index (1–5); second digit = slot number (1–7). E.g. id `11` = box 1 slot 1, id `57` = box 5 slot 7. 35 records total (5 boxes × 7 slots). |
| `itemId` | int | Item template ID of the unlock material (all records use `16` in current data, pointing to a Kim Cương / diamond gem in [[TBL_ITEM_TEMPLATE]]). Read at `MonsterHeartSlot.as:209` as `pointObj.itemId` to look up the item name. |
| `quality` | int | Quality tier of the `itemId` required to unlock this slot (0, 1, 6, 11, 16). Maps to `MonsterHeartPanel.JGZ_COLOR[quality]` for display (`MonsterHeartSlot.as:247`). Controls which colour of diamond is consumed. |
| `num` | int | Quantity of the item required to unlock this slot (`MonsterHeartSlot.as:208,237`). Shown in the tooltip via `Language.MONSTER_HEART[11]` placeholder `{num}`. `0` for the free/initial slot (slot 1 of each box always has `num=0`, `goldnum=0`). |
| `goldnum` | int | Gold cost alternative to unlock this slot (player may pay gold instead of item; both options shown via `Alert`) (`MonsterHeartSlot.as:206`). |
| `type` | int | Heart type restriction for this slot. `-1` = accepts all heart types ("Tất cả hệ" — displayed at `MonsterHeartPanel.as:4486`). Positive values 1–7 map to `TipMonsterHeart.MONHEART_TYPE` and restrict the slot to hearts of that combat class (`MonsterHeartPanel.as:4482,4490`). All 35 current records have `type = −1`. |
| `combine` | pipe-list | Pipe-separated list of [[TBL_CREATUREH_COMBINE]] `id` values that are applicable when a heart is placed in this slot. The combination engine checks these IDs to determine which bonuses activate (`MonsterHeartPanel.as:4747` — COMBINE records are retrieved using ids from this list). |
| `linkLine` | pipe-list | Pipe-separated line indices that this slot participates in for combination detection. These line numbers cross-reference `lineCombine` in [[TBL_CREATUREH_COMBINE]] and `line` in [[TBL_CREATUREH_CONTAIN]] (`MonsterHeartPanel.as:4748–4760`). |

## Value distributions / sentinels

- `id`: 35 records, `11–17`, `21–27`, `31–37`, `41–47`, `51–57`. Slot 1 of each box (`x1`) is the free starter slot (`num=0`, `goldnum=0`, `quality=0`).
- `type`: all 35 records are `−1` (universal — accepts any heart type). The `type > 0` restriction path exists in client code but is unused in current data.
- `quality`: `0`×4 (free slots, quality 0 items), `1`×4, `6`×5, `11`×13, `16`×9 — higher slots require progressively rarer gem tiers.
- `combine`: large pipe-lists of COMBINE IDs (4–5 digit prefixed IDs); the 5 boxes have distinct ID ranges in their combine lists (box 1 uses `1101–1429` range, box 2 `2201–2223`, box 3 `3101–3223`, etc.).
- `linkLine`: 2–4 pipe-separated line numbers per slot, drawn from the set `{1,2,3,4,5,6,7,8,9,12}`.

## Client usage

- `MonsterHeartSlot.as:205` — slot click handler: `pointObj = GameData.d[134][(box*10 + slotPos)]`, then reads `goldnum`, `quality`, `num`, `itemId` to build the unlock confirmation dialog.
- `MonsterHeartSlot.as:228` — sends RPC `"openHoleMonsterHeart"` with `(box, slotPos)` for gold unlock.
- `MonsterHeartSlot.as:242` — sends RPC `"openHoleMonsterHeartJingang"` with `(box, slotPos, itemKK)` for item unlock.
- `MonsterHeartPanel.as:4455` — iterates all 7 slots per box: `GameData.d[134][(box*10 + slot)]`, reads `quality`, `itemId`, `goldnum`, `num`, `type`.
- `MonsterHeartPanel.as:4482` — reads `.type` to show the allowed heart class in the slot tooltip.
- `MonsterHeartPanel.as:4747,4751` — during combine calculation: reads the COMBINE records referenced by `combine` list, then reads matching CONTAIN `num` for the bonus formula.

## Related tables

- `itemId` → [[TBL_ITEM_TEMPLATE]] (unlock material item definition).
- `combine` (pipe-list of IDs) → [[TBL_CREATUREH_COMBINE]] (which combination recipes apply to this slot).
- `linkLine` values → `lineCombine` field in [[TBL_CREATUREH_COMBINE]] and `line` field in [[TBL_CREATUREH_CONTAIN]].
- `type` value (when > 0) → [[TBL_CREATUREH_HEART]].`type` (restricts which heart items may be slotted).
- Box index (first digit of `id`) → [[TBL_CREATUREH_CONTAIN]] box rows.
