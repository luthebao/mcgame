# TBL_FEAST

| Property | Value |
|---|---|
| Table ID | 67 |
| Record count | 32 |
| JSON | `docs/database/game_data/TBL_FEAST.json` |
| Client constant | `GamePredef.TBL_FEAST = 67` |

## Purpose

Defines seasonal festival / holiday events (lễ hội / lễ tết). Each row represents one real-world calendar event (e.g. Tết Tây, Tết Nguyên Đán, Valentine). The client fetches the current active festival via `remote.call("getCurrentFeast")` and looks up the matching row to display the festival name (`na`), description (`inf`), and gift item (`aw`) in the Active Events panel (`GameIntroPanel`). Players can claim a festival gift via `remote.call("takeFeastGift")`. A warn-icon notification (`WARN_TYPE_FEASTIVAL`) is also driven by this table.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Returned by the server in the `getCurrentFeast` response; used to look up the row: `GameData.d[GamePredef.TBL_FEAST][_arg_1.id]` (`GameIntroPanel.as:3891`). |
| `na` | string | Festival display name (Vietnamese). Shown in the panel header: `Language.ACTIVEPANEL_S[4].replace("{festv.na}", _local_2.na)` (`GameIntroPanel.as:3907`). Examples: `"Tết Tây"`, `"Tết Nguyên Đán"`, `"Lễ Tình Nhân"`. |
| `inf` | string | Festival description text shown in the panel body (`ta_festDesc.text = _local_2.inf`, `GameIntroPanel.as:3903`). |
| `aw` | int | Item template ID of the festival gift reward. Passed to the item slot as `festSlot.giid = _local_2.aw` (`GameIntroPanel.as:3900`) when `_arg_1.data.aw` is truthy. Foreign key → TBL_ITEM_TEMPLATE or TBL_EQUIPT_TEMPLATE. |
| `at` | pipe-list | Active time specification: `"hour_start-hour_end\|month_start-month_end\|day_of_month_start-day_of_month_end\|day_of_week_start-day_of_week_end"` (four pipe-separated `start-end` range segments). Determines when the festival is active. Example: `"0-23\|0-6\|1-1\|0-0"` = all hours, Jan–Jul, 1st of month, Sunday. `(inferred from data — no client-side parsing of `at` found; activation is determined server-side)` |

## Value distributions / sentinels

- `at`: 32 distinct patterns; all follow the 4-segment pipe format `"h1-h2|m1-m2|d1-d2|dow1-dow2"`. Consistent pattern implies server-side scheduling from this field.
- `aw`: item IDs ranging from 192 to 1515 (gift items vary per festival).

## Client usage

- `GameIntroPanel.as:3891–3907` — `onGetFestToday` callback: looks up `GameData.d[TBL_FEAST][id]`, reads `inf` (description), `aw` (gift item), `na` (name).
- `GameIntroPanel.as:3943` — sends `getCurrentFeast` RPC to request the active festival.
- `GameIntroPanel.as:6627` — sends `takeFeastGift` RPC when player clicks the gift button.
- `CallBack.as:553/557` — `onEndFeastivalDay`: removes the `WARN_TYPE_FEASTIVAL` notification icon when the festival ends.
- `CallBack.as:5681–5690` — on login/update: if `_arg_2.type == "feastival"`, creates a `WARN_TYPE_FEASTIVAL` warn-icon entry (the `id` in the warn object links back to this table).
- `AwardWarnCanvas.as:217/220/281` — renders the festival notification icon; uses `Language.GAMEPREDEF_S[521]` with `{feastival}` placeholder for the tooltip.

## Related tables

- `aw` → [[TBL_ITEM_TEMPLATE]] or [[TBL_EQUIPT_TEMPLATE]] (festival gift item).
