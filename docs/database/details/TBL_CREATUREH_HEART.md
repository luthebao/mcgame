# TBL_CREATUREH_HEART

| Property | Value |
|---|---|
| Table ID | 131 |
| Record count | 1938 |
| JSON | `docs/database/game_data/TBL_CREATUREH_HEART.json` |
| Client constant | `GamePredef.TBL_CREATUREH_HEART = 131` |

## Purpose

Defines every "Ma Tâm" (Monster Heart / Soul Seal) item — a creature-derived soul mark that players socket into heart containers. Each record is one heart item with a creature origin, a stat bonus type, a quality tier, and a combat-class category. The client loads this table as `GameData.d[131][id]` and renders items through `MonsterHeartPanel.as` and `TipMonsterHeart.as`.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key (1–1938). Looked up directly as `GameData.d[131][id]`. |
| `name` | string | Vietnamese display name including creature of origin in parentheses, e.g. `"Dải Lụa Sắc Nhọn (Dây Rong)"`. Shown by `TipMonsterHeart.as:372` in tooltip. |
| `desc` | string | Flavor description of the heart's origin creature. Rendered as `htmlText` in the tooltip (`TipMonsterHeart.as:374`, field `monDesc`). |
| `iconCode` | int (as string) | Asset code passed to `ResManager.getIconUrl(iconCode)` to load the heart's icon sprite (`TipMonsterHeart.as:368`). |
| `color` | int | Quality/rarity tier 0–5. `color + 1` determines the display level shown as `"Lv<n>"` and the name colour via `GamePredef.MSG_ITEM_COLOR[color]` (`TipMonsterHeart.as:369–373`). Slot styling applied via `setStyleName(color)` (`MonsterHeartPanel.as:3978,4477`). |
| `type` | int | Combat class of the heart: `1`=Người, `2`=Thú, `3`=TV (thực vật/plant), `4`=Máy, `5`=Ma, `6`=Long (dragon), `7`=BOSS. Rendered via `TipMonsterHeart.MONHEART_TYPE` constant (`TipMonsterHeart.as:375`). Determines which socket slots can accept this heart (`MonsterHeartPanel.as:4490`). |
| `propType` | int | Stat bonus type ID. Indexed against `Language.TIP_MONSTER_H` to get the label (e.g. `1`=HP+, `4`=Công VL+, `9`=Né+, etc. — see Language.as:8581–8604). When `propType` is in {59, 60, 62, 63}, `propnum` is divided by 100 as a percentage; for all other types it is divided by 10000 as an absolute value (`TipMonsterHeart.as:376–405`). |
| `propnum` | int | Raw stat bonus magnitude. Divided by 10000 for most stat types, or by 100 for percentage types (`TipMonsterHeart.as:398,404`). |
| `exp` | int | Heart "grade" level 1–6. Higher grade hearts give more `heartTalent` output and dissolve for more experience. Perfectly distributed (323 records per grade). Also controls display ordering/grouping in the upgrade UI (`MonsterHeartPanel.as:2767`). |
| `heartTalent` | int | Talent point value of this heart. Divided by 10000 when displaying the talent contribution ratio. Ranges 10000–30000 in the data. No direct client-side field read recovered from static analysis — value is used via runtime monsterHeartData objects. `(inferred from data — no client usage found for static field read)` |

## Value distributions / sentinels

- `color`: perfectly uniform, 323 records each for values `0`, `1`, `2`, `3`, `4`, `5` — six rarity tiers.
- `exp`: perfectly uniform, 323 records each for values `1`, `2`, `3`, `4`, `5`, `6` — six upgrade grades.
- `type`: `1`×336, `2`×426, `3`×234, `4`×234, `5`×504, `6`×150, `7`×54 — Ma (ghost) type is most numerous, BOSS rarest.
- `propType`: 25 distinct values; dominant ones are `13`×186, `1`×180, `72`×180, `32`×108. Values ≥58 are percentage-type bonuses per `TipMonsterHeart.as:400–405`.
- `heartTalent`: ranges from 10000 to 30000 in steps of 1000. Not strictly correlated with `exp` (the group_by analysis shows exp groups share a single heartTalent value per group, but overall it varies across hearts).

## Client usage

- `TipMonsterHeart.as:368–405` (`setTemp`) — primary tooltip renderer; reads `iconCode`, `color`, `name`, `desc`, `type`, `propType`, `propnum`.
- `MonsterHeartPanel.as:2756,2813,3976,4475,5316,5326` — loads HEART records into UI slot components (`slotData`, `giid`, `type = TBL_CREATUREH_HEART`).
- `MonsterHeartPanel.as:3978,4477` — applies slot colour styling from `color` field.
- `MonsterHeartPanel.as:2767` — shows dissolve EXP gain using the `exp` field.
- `MonsterHeartPanel.as:5317` — computes next-tier heart id as `(color + 1)` for upgrade preview.
- `Slot.as:590,1535` — dispatches tooltip as `TBL_CREATUREH_HEART` type slot.
- `Core.as:2091` — heart slot data lookup in the game-object resolution switch.

## Related tables

- `propType` → `Language.TIP_MONSTER_H[]` (stat label string array in Language.as).
- `type` → `TipMonsterHeart.MONHEART_TYPE` constant (combat-class name map).
- `id` → referenced by [[TBL_CREATUREH_POINT]].`combine` (lists which heart IDs are allowed in each socket slot).
- `id` → referenced by [[TBL_CREATUREH_POINT]].`linkLine` (which heart lines connect the sockets).
- Heart items are placed in heart containers defined by [[TBL_CREATUREH_CONTAIN]].
- Combined bonus results (from multi-heart combos) defined in [[TBL_CREATUREH_COMBINE]].
