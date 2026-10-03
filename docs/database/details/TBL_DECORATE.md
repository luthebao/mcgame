# TBL_DECORATE

| Property | Value |
|---|---|
| Table ID | 121 |
| Record count | 0 (empty export) |
| JSON | `docs/database/game_data/TBL_DECORATE.json` |
| Client constant | `GamePredef.TBL_DECORATE = 121` |

## Purpose

Runtime/instance table for the Decorate system (trang trí / rune / mysterious treasure panels). The static JSON export is empty because rows are per-character or per-account state delivered from the server at runtime rather than design-time records. The client has an extensive `DecoratePanel` UI (`PanelLayer.as:6619/6651`) accessed via the `"initDecoratePanel"` RPC (`LinkEventUtil.as:487`), and the `Language.DECORATE_PANEL` string array drives labels across multiple sub-components (`RuneBag`, `RuneClickBag`, `RuneItemRenderer`, `MysTreBag`, `TipMysTreasure`, etc.). However, no `GameData.d[GamePredef.TBL_DECORATE]` or `GameData.d[121]` read was found anywhere in the exported client — the constant is declared but the table slot is never queried for static game-data.

## Client usage

- `GamePredef.TBL_DECORATE = 121` declared at `GamePredef.as:604`. No `GameData.d[121]` read found.
- `LinkEventUtil.as:482–487` — opening the decorate panel triggers `remote.call("initDecoratePanel", null, cid)` to fetch runtime data from the server.
- `PanelLayer.as:6619/6651/11748` — `DecoratePanel` class registered as `ViewManager.PANEL_DECORATE`.
- `Language.DECORATE_PANEL` string array referenced by: `RuneItemRenderer.as`, `TipRuneChip.as`, `MysTreBag.as`, `RuneSlot.as`, `MysTreItem.as`, `RuneBag.as`, `RuneClickBag.as`, `TipDecoRune.as`, `TipMysTreasure.as` — indicating a rich sub-system (rune chips, mysterious treasures, mystery bag) whose instance data comes from the server.

Empty export; no static rows. Client constant present at `GamePredef.TBL_DECORATE = 121` but no `GameData.d[TBL_DECORATE]` field-level usage recovered — all decorate data is fetched from the server dynamically via `"initDecoratePanel"` RPC.
