# TBL_WEDDING_BOOK

| Property | Value |
|---|---|
| Table ID | 77 |
| Record count | 0 |
| JSON | `docs/database/game_data/TBL_WEDDING_BOOK.json` |
| Client constant | `GamePredef.TBL_WEDDING_BOOK = 77` |

## Purpose

Runtime table of wedding ceremony bookings. Each row reserves a ceremony time-slot on a specific server line (channel), identifying the couple and controlling guest access policy. The `WeddingBookPanel` displays the booking list, lets eligible couples submit new bookings, and prevents double-booking.

## Key reference

| Key | Type | Function |
|---|---|---|
| `cid` | int | Character ID of the groom (male spouse). Used to detect the logged-in player's own booking (`WeddingBookPanel.as:731`). |
| `pid` | int | Character ID of the bride (female spouse). Used together with `cid` to identify the couple's row (`WeddingBookPanel.as:731`). |
| `cname` | string | Display name of the groom. Combined with `pname` into a `"name1,name2"` string for the grid column (`WeddingBookPanel.as:737`). |
| `pname` | string | Display name of the bride (`WeddingBookPanel.as:737`). |
| `date` | timestamp | Unix epoch ms of the booked ceremony time. Parsed into a `Date` object for display formatting and pre-fill of the time-picker (`WeddingBookPanel.as:738`, `514–516`). |
| `line` | int | Server line / channel ID for the ceremony. Resolved to a line name via `_core._lineList` (`WeddingBookPanel.as:742–744`, `507`). |
| `flag` | int | Guest entry policy: `GamePredef.FLAG_PEOPLE_ENTER_INVITATION` (invite-only) or `GamePredef.FLAG_PEOPLE_ENTER_FREE` (open). Drives the access radio buttons (`WeddingBookPanel.as:312`, `315–316`, `517`). |

## Value distributions / sentinels

Not applicable — empty export; all rows are live-server instances.

`flag` values:
- `GamePredef.FLAG_PEOPLE_ENTER_FREE` — open guest entry
- `GamePredef.FLAG_PEOPLE_ENTER_INVITATION` — invitation-only

## Client usage

- `WeddingBookPanel.as:720–760` — main data-load function iterates the server-sent array; detects own booking by `cid`/`pid` match; computes `couples`, `time` (formatted), and `lineName` fields; populates the booking grid.
- `WeddingBookPanel.as:441–451` — grid column data fields: `lineName` (line name string), `time` (formatted date string), `couples` (computed `"cname,pname"`).
- `WeddingBookPanel.as:300–320` — booking submission RPC payload built from `line`, `hour`, `minute`, `flag`.
- `WeddingBookPanel.as:507`, `514–516` — pre-fill time picker from existing `date` and `line` when own booking detected.

## Related tables

- `cid` → [[TBL_CHARACTOR]] (groom).
- `pid` → [[TBL_CHARACTOR]] (bride).
- Booking is associated with an existing [[TBL_COUPLE]] record.
- `line` resolved via the client's live line list (not a static game-data table).
