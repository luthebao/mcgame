# TBL_DECO_RUNE

| Property | Value |
|---|---|
| Table ID | 119 |
| Record count | 1520 |
| JSON | `docs/database/game_data/TBL_DECO_RUNE.json` |
| Client constant | `GamePredef.TBL_DECO_RUNE = 119` |

## Purpose

Defines every level of every Phù Văn (Decorative Rune) gem in the Decorate system. Each record represents a named rune at a specific quality tier and level, carrying one stat bonus and XP progression data. Runes are socketed into Hồn Khí holes on decorative equipment and can be leveled up by feeding them XP. The table has a secondary index: `TBL_INDEX_ARRAY[TBL_DECO_RUNE] = "canExchange"` (`GameData.as:8400`), enabling fast lookup of exchangeable runes.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up as `GameData.d[119][runeId]`. Also used via secondary index `gameDataIndex[119]` keyed by `canExchange`. |
| `name` | string | Vietnamese display name (e.g., `"Phù Văn Sinh Mệnh Lục"`). Displayed in `TipDecoRune.as:261` via `runeName.text`. |
| `level` | int | Rune level (1–20). Displayed as `"Lv {num}"` in `TipDecoRune.as:262`. |
| `qulity` | int | Quality tier (2–5). Controls name color in tooltip (`TipDecoRune.QUL_COLOR`: `2`=`#FFFFFF` white, `3`=`#0000FF` blue, `4`=`#9900FF` purple, `5`=`#FF6633` orange, `6`=`#FF0000` red). Note: `qulity` is a typo in the original schema — must match exactly. |
| `kind` | int | Rune category: `1`=Nhân vật (character rune), `2`=Pet (pet rune). Displayed as `Language.DECORATE_PANEL[80][kind-1]` in `TipDecoRune.as:265`. |
| `type` | int | Property type ID — which stat this rune boosts. Same enum as `propType` in other tables (e.g., `1`=Hp, `4`=Công vlý, `8`=Chính xác, `34`=%, `58`=%). Used in `TipDecoRune.as:266–293` to pick display format (flat vs. `/10000` vs. `/100%`). |
| `propNum` | int | Stat bonus amount at this level. Displayed via `Language.TIPPROP_S[type]` + formatted value in `TipDecoRune.as:274,284,292`. |
| `per` | int | Display format flag: `0`=flat value, `1`=percentage display. When `per=1` and `type` is in {1,4,5,6,7,11}, value is shown as `propNum/10000 + "%"` instead of flat (`TipDecoRune.as:258,284`). |
| `exp` | int | Accumulated XP this rune has at this level (cumulative, not per-level). Displayed as `"Exp phân giải: {num}"` (decompose XP refund) in `TipDecoRune.as:264`. |
| `upExp` | int | XP required to level this rune from `level` to `level+1`. Displayed as `"Exp thăng cấp: {num}"` in `TipDecoRune.as:263`. |
| `nextId` | int | ID of the next-level record for this rune. `0` at max level. Used in `TipDecoRune.as:305–349` to show "after upgrade" stat preview. |
| `canExchange` | bool(0/1) | Whether this rune can be exchanged (using chip fragments). `0` for most runes (1444 records), `1` for higher-quality runes (76 records — quality 4 and 5). Indexed via `TBL_INDEX_ARRAY`. |
| `chipId` | int | ID in [[TBL_RUNE_CHIP]] of the chip fragment needed for exchange. `0` when `canExchange=0`. Referenced in `DecoratePanel.as:9149,9163` when building chip bag data. |
| `iconCode` | int | Icon asset code. Passed to `ResManager.getIconUrl(iconCode)` for rendering. 13-digit code encoding atlas/sprite position. |

## Value distributions / sentinels

- `qulity`: `2`×380, `3`×380, `4`×380, `5`×380. Four quality tiers, equal counts.
- `kind`: `1`×760 (character), `2`×760 (pet). Equal split.
- `type`: 19 distinct values (1, 4, 5, 6, 7, 8, 9, 11, 13, 14, 31, 32, 34, 58, 59, 60, 61, 62, 63), 80 records each. Mirrors the `propType` in [[TBL_DECO_HOLE]] partially.
- `canExchange`: `0`×1444, `1`×76. Only qulity 4 and 5 runes are exchangeable.
- `per`: `0`×480, `1`×1040. Percentage types dominate.
- `level`: 1–20 (inferred from data pattern; each named rune has 20 level rows, same `name` and `type` across levels).

## Client usage

- `TipDecoRune.as:253–294` — primary tooltip render: reads `name`, `qulity`, `level`, `type`, `propNum`, `per`, `upExp`, `exp`, `kind`, `nextId`.
- `TipDecoRune.as:305–349` — follows `nextId` to display next-level stat preview ("Hiệu quả sau").
- `DecoratePanel.as:4939` — loads rune data from `GameData.d[GamePredef.TBL_DECO_RUNE][runeId]` for slot display; sets `upLvlSlot.type = GamePredef.TBL_DECO_RUNE`.
- `DecoratePanel.as:5226,5234` — populates `RuneSlot` components with rune template data and type marker.
- `DecoratePanel.as:8910,8917` — reads rune `propType`/`propNum` as an alternate key pattern.
- `DecoratePanel.as:9154` — uses secondary index `gameDataIndex[GamePredef.TBL_DECO_RUNE][canExchange]` for fast exchange filter.
- `TipRuneChip.as:190` — looks up `rid` (from [[TBL_RUNE_CHIP]]) to fetch the target rune name and quality for chip tooltip.
- `RuneItemRenderer.as:43–77` — reads `kind`, `qulity` for rendering slot previews.

## Related tables

- `chipId` → [[TBL_RUNE_CHIP]] (exchange chip fragment for this rune).
- `nextId` self-references [[TBL_DECO_RUNE]] for upgrade chain.
- Socketed into holes defined by [[TBL_DECO_HOLE]].
- Parent decorative piece defined in [[TBL_DECO_SHOW]].
