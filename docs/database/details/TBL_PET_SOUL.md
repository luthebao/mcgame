# TBL_PET_SOUL

| Property | Value |
|---|---|
| Table ID | 94 |
| Record count | 840 |
| JSON | `docs/database/game_data/TBL_PET_SOUL.json` |
| Client constant | `GamePredef.TBL_PET_SOUL = 94` |

## Purpose

Defines every Pet Soul (Linh Hồn Thú) gem that can be socketed into pet soul slots. Each record is one soul gem at a specific upgrade level, carrying a single stat bonus (`propType`/`propVal`), an XP cost to advance to the next level, and quality metadata (`color`, `chip`, `type`) that controls which pets can equip it and how it is rendered.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up as `GameData.d[94][id]`. |
| `name` | string | Vietnamese display name (e.g. `"Sức Sống"`). Shown in `TipSoul.as:201` as `"{name} Lv{level}"`. |
| `desc` | string | Vietnamese effect description (e.g. `"Tăng giới hạn HP  2000"`). Rendered in tooltip by `TipSoul.as:211` and `217`. |
| `level` | int | Current upgrade level of this soul gem (1–10). Used for next-level look-up chain in `TipSoul.as:212`. |
| `exp` | int | Base XP value this soul contributes at current level. Used in total-exp display: `TipSoul.as:204,208,210`. |
| `upExp` | int | XP required to upgrade to the next level. Shown as the denominator of the progress bar: `TipSoul.as:210`. |
| `propType` | int | Stat type modified (maps into `TIP_MONSTER_H`/`Language.TIPPROP_S` arrays). 30+ distinct values seen. |
| `propVal` | int | Magnitude of the stat bonus granted by this soul. |
| `iconCode` | int | 13-digit icon asset code; passed to `ResManager.getIconUrl(iconCode)` in `TipSoul`, `PetSoulCanvas`, `PetSoulIcon`. |
| `color` | int | Soul quality tier (0–4). Drives nameplate colour via `GamePredef.CODE_SOUL_COLOR[color]` (`PetSoulCanvas.as:299,300`) and `GamePredef.MSG_ITEM_COLOR[color]` (`TipSoul.as:228`). |
| `type` | int | Slot-type restriction: `-1` = generic (fits any pet, 798 records); `1` = special slot (42 records). `(inferred from data — no client usage found beyond the value itself)` |
| `chip` | int | Soul Chip currency cost to embed/exchange this soul. Player's current chip balance is `_core.player.soulChip`; on equip callbacks the server returns the new balance via `_arg_1.chip` which is assigned to `soulChip` (`CallBack.as:3524,4152,9180,10766`). Values: `0`, `1`, `5`, `6`. |
| `reqChip` | int | Minimum chip count the player must hold to socket this soul. Checked in `RendererSoulItem.as:180,219`. Shown in tooltip via `Language.PET_SOUL_S[28].replace("{num}", soulObj.reqChip)` (`RendererSoulItem.as:191`). |
| `price` | int | Silver/gold price (unused in observed client display paths; always `0` in current data). `(inferred from data — no client usage found)` |

## Value distributions / sentinels

- `type`: `-1` × 798 (generic), `1` × 42 (special).
- `color`: `0` × 100, `1` × 100, `2` × 100, `3` × 250, `4` × 290 — higher tiers are more numerous.
- `chip`: `0` × 300, `1` × 250, `5` × 270, `6` × 20.
- `propType`: 30 distinct values; most common stat groups appear in batches of 50 or 20.

## Client usage

- `TipSoul.as:201,204,208,210–212,217,228` — tooltip renders `name`, `level`, `exp`, `upExp`, `desc`, `color`.
- `PetSoulCanvas.as:216,299–300` — quality branch on `color > 1`; sets nameplate style via `CODE_SOUL_COLOR[color]`.
- `RendererSoulItem.as:180,191,219` — checks `reqChip` against `player.soulChip`; shows cost tooltip.
- `SoulExchangePanel.as:180` — copies `reqChip` into exchange VO.
- `CallBack.as:3524,4152,9180,10766` — receives updated `chip` balance from server after soul operations.
- `LinkEventUtil.as:157–158` — hyperlink dispatch for `TBL_PET_SOUL` type items in chat.
- `ToolTipUtil.as:94,230,277–278` — tooltip type routing for soul items.
- Secondary index: `TBL_INDEX_ARRAY[94] = "name"`, secondary: `TBL_INDEX_ARRAY2[94] = "type"` (`GamePredef.as:8390,8475`).

## Related tables

- Soul gems equip into pet soul slots on per-character pet instances (`TBL_PET` runtime).
- `propType` maps to a shared stat-enum used across many tables (TBL_BUFF, TBL_SKILL, equipment sublimation, etc.).
- `iconCode` resolved via the same `ResManager.getIconUrl` path as item/equipment icons.
