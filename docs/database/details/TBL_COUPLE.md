# TBL_COUPLE

| Property | Value |
|---|---|
| Table ID | 78 |
| Record count | 0 |
| JSON | `docs/database/game_data/TBL_COUPLE.json` |
| Client constant | `GamePredef.TBL_COUPLE = 78` |

## Purpose

Runtime table storing committed married couples. Each row records the two spouses, the marriage date, and the ceremony type. The client uses this to populate the couple info panel in `IMPanel` (the friend/relationship UI) and to drive the couple-rank leaderboard in `ActivePanel`. The player's current partner character ID is cached on `_core.player.cpid`.

## Key reference

| Key | Type | Function |
|---|---|---|
| `maleId` | int | Character ID of the male spouse. The client reads this for the partner depending on the logged-in player's gender (`IMPanel.as:1815`, `1820`). |
| `maleName` | string | Display name of the male spouse. Shown in the lover-info panel (`IMPanel.as:1820`). |
| `femaleId` | int | Character ID of the female spouse (`IMPanel.as:1814`). |
| `femaleName` | string | Display name of the female spouse (`IMPanel.as:1815`). |
| `time` | timestamp | Marriage timestamp. The first 10 characters (date portion) are extracted and displayed in the lover-info panel (`IMPanel.as:1835`). |
| `type` | int | Ceremony type: `1` = basic ceremony, `2` = standard wedding, `3` = grand wedding. Resolved to a display label from `Language.ACTIVEPANEL_S[42..44]` (`IMPanel.as:1829–1843`). |

## Value distributions / sentinels

Not applicable — empty export; all rows are live-server instances.

`type` sentinel meanings (from `Language.ACTIVEPANEL_S`):
- `1` → basic/civil ceremony (inferred)
- `2` → standard wedding
- `3` → grand wedding
- any other → `time` and `type` fields hidden from display (`IMPanel.as:1844–1848`)

## Client usage

- `CallBack.as:6356–6364` — `onInitCouple(_arg_1)` routes the record object to `IMPanel.initCP()`.
- `IMPanel.as:1796–1853` — `initCP(data)` reads `femaleId`/`femaleName`/`maleId`/`maleName` (branch on `_core.player.gender`), stores partner ID in `_core.player.cpid`, formats the lover-info text area with date and ceremony type.
- `ActivePanel.as:1471–1498`, `2602–2615` — couple-rank leaderboard uses `getCoupleRank` RPC; the raw data array (`coupleData`) is paginated but field names at the array element level are not extracted in this code path (display delegated to a grid template). Rank position is the only visible output.
- `WeddingBookPanel.as:737` — references `cname` and `pname` fields (couple name pair in the booking table — distinct from TBL_COUPLE, see [[TBL_WEDDING_BOOK]]).

## Related tables

- `maleId`, `femaleId` → [[TBL_CHARACTOR]] (both spouses).
- Created as a result of a successful [[TBL_MARRIAGE]] request/acceptance flow.
- Ceremony booking recorded in [[TBL_WEDDING_BOOK]].
