# TBL_TITLE

| Property | Value |
|---|---|
| Table ID | 59 |
| Record count | 472 |
| JSON | `docs/database/game_data/TBL_TITLE.json` |
| Client constant | `GamePredef.TBL_TITLE = 59` |

## Purpose

Defines all player titles ("danh hiệu") that can be earned and equipped by characters. Each record holds the display name, visual style (color + bracket glyphs), a buff-string encoding the stat bonuses granted while active, a tooltip description, and classification/ranking metadata. The client secondary-indexes this table by `k` (`TBL_INDEX_ARRAY[TBL_TITLE] = "k"`) to bucket titles by kind (permanent, active/event, VIP).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Used as argument to `getGameData(GamePredef.TBL_TITLE, id)`. |
| `n` | string | Display name of the title (Vietnamese). Rendered above the character nameplate (`CharactorView.as:142`, `CharactorInfoPanel.as:1433`), in tooltip header (`ToolTipUtil.as:36`), and in title-select list (`TitleSelectPanel.as:415`, `TitleSelectPanel.as:595`). |
| `i` | string | Description shown in the title tooltip (`ToolTipUtil.as:37`, `TipTitle.as:307`). Contains `\n` for line breaks. |
| `a` | string | Visual style: pipe-delimited `"color\|openBracket\|closeBracket"` (e.g. `"0xd7e4bc|≮|≯"`). Parsed in `CharactorView.as:166` — `[0]` is the uint text color, `[1]` is the prefix glyph, `[2]` is the suffix glyph wrapping the title name on the nameplate. |
| `b` | int | Buff ID referencing [[TBL_BUFF]]. Passed to `BuffParser.parseBuff2()` in `ToolTipUtil.as:38` and `TitleSelectPanel.as:522/691` to generate the stat-bonus text. `Core.as:992` iterates titles to find one whose `b` equals a given buff ID (`getTitleByBuffId`). |
| `k` | int | Kind/category flag. Values: `1` = permanent (`TITLE_KIND_FOREVER`), `2` = active/event (`TITLE_KIND_ACTIVE`), `3` = VIP (`TITLE_KIND_VIP`). Used as the secondary index key (`TBL_INDEX_ARRAY[TBL_TITLE] = "k"`). `CharactorView.as:570` queries `gameDataIndex[TBL_TITLE][TITLE_KIND_ACTIVE]`. |
| `l` | int | Level/rank within a title series (inferred from data — no direct client label found). Values 1–14; most titles have `l=1`. For ranked series (e.g. arena titles), `l` indicates rank order (1=3rd place, 2=2nd, 3=1st). |
| `s` | int | Exclusivity or source flag. `-1` = standard (no special source restriction), `0` = locked/unavailable, `1` = ranked/exclusive title (typically from PvP events). (inferred from data — no client usage of this field name found; `-1`×302, `1`×154, `0`×16.) |
| `t` | int | Title group/series ID. All titles sharing the same `t` form a series (e.g. teacher ranks all share `t=1`, arena titles share `t=260`). `Core.as:2041` checks `_local_3.k == _arg_2` (title kind match by `k`); `t` groups related titles together. (inferred from data — no direct client read of this field found by name.) |

## Value distributions / sentinels

- `k`: `1`×215 (permanent), `2`×251 (active/event), `3`×6 (VIP).
- `s`: `-1`×302, `1`×154, `0`×16.
- `l`: `1`×379 (most titles are single-rank); up to `14` for multi-rank series.
- `a` color palette samples: `0xd7e4bc` (pale green, teacher series), `0xFA5B05` (orange, arena), `0x00CCFF` (cyan, wealth), `0x00f0ff` (aqua).
- `t` most frequent values: `360`×14, `454`×12, `353`×10 — these are large event series.

## Client usage

- `ToolTipUtil.as:32–38` — primary tooltip lookup: fetches title by `id`, assigns `n` → name, `i` → description, `b` → `parseBuff2` for stat display.
- `CharactorView.as:139–166` — `setTitle(id)` fetches record, stores `n` → `_titlePrefix`, `a` → `_titleStyle`; `_titleStyle.split("|")` yields `[color, openBracket, closeBracket]` applied to the nameplate text field.
- `CharactorView.as:570` — indexes by `k == TITLE_KIND_ACTIVE` to find active-type titles.
- `Core.as:990/987–992` — iterates `GameData.d[TBL_TITLE]` in `getTitleByBuffId(_arg_1)` to find title whose `b == buffId`.
- `Core.as:2038–2041` — `checkTitleType(id, kind)` verifies `_local_3.k == _arg_2`.
- `TitleSelectPanel.as:391/548/586` — reads individual title records; `t` stored in `player.t` (active title ID); `i` and `b` used for the selection UI detail pane.
- `CharactorPanel.as:5784` — fetches player's current title via `player.t`.
- `CharactorInfoPanel.as:1430–1433` — shows title name `n` in another player's info panel.
- `CallBack.as:10045` — retrieves title by `i` field on server push.
- `LongBuffCanvas.as:316–317` — matches title via `getTitleByBuffId` for long-buff banner display.

## Related tables

- `b` → [[TBL_BUFF]] (buff ID; `BuffParser.parseBuff2` decodes stat bonuses).
- `t` groups form series; no explicit FK to another table.
- Player's active title ID stored as `player.t` → [[TBL_CHARACTOR_TITLE]] tracks which titles a character owns.
