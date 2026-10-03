# TBL_MARRIAGE

| Property | Value |
|---|---|
| Table ID | 76 |
| Record count | 0 |
| JSON | `docs/database/game_data/TBL_MARRIAGE.json` |
| Client constant | `GamePredef.TBL_MARRIAGE = 76` |

## Purpose

Runtime table of marriage-seeking and marriage-request advertisements posted by characters. Each row is either a seeking post (`TYPE_MARRIAGE_SEEKING`) or a directed proposal (`TYPE_MARRIAGE_REQUEST`). The client displays these in `MarriageManagerPanel` as two separate grids and uses them to initiate marriage negotiations. The constant is also referenced in `LinkEventUtil.as` as a hyperlink target type (id `1007`).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key — row ID. Sent as argument to the `marriageReqFeedback` RPC when responding to a request (`MarriageFeedHBox.as:214`). |
| `cid` | int | Character ID of the posting character. Used to identify the post's owner and detect the player's own posts (`MarriageManagerPanel.as:801`, `812`). |
| `targetId` | int | Character ID of the target (meaningful for `TYPE_MARRIAGE_REQUEST` only — the character being proposed to). Checked to detect whether the logged-in player is the proposal target (`MarriageManagerPanel.as:818`). |
| `type` | int | Post type: `GamePredef.TYPE_MARRIAGE_SEEKING` (seeking post) or `GamePredef.TYPE_MARRIAGE_REQUEST` (directed proposal). Routes the record to the appropriate grid (`MarriageManagerPanel.as:799`, `810`). |
| `name` | string | Encoded display name of the posting character (`"firstName|serverTag"` split format). Name part extracted with `.split("|")[0]` (`MarriageManagerPanel.as:1247`). |
| `exp` | int | Raw experience of the posting character, converted to display level client-side via `_core.basic.expToLevel(exp)` (`MarriageManagerPanel.as:1169`, `1250`). |
| `gender` | int | Character gender. Used to validate opposite-gender constraint (`MarriageManagerPanel.as:774`) and derive sex label from `GamePredef.GENDER_NAME` (`MarriageManagerPanel.as:1168`, `1249`). |
| `classId` | int | Character class ID. Resolved to class name via `_core.getClassName(classId)` (`MarriageManagerPanel.as:1167`, `1248`). |
| `online` | bool(0/1) | Whether the posting character is currently online. Drives the "online/offline" status label (`MarriageManagerPanel.as:1170`, `1251`). |
| `addDate` | timestamp | Timestamp of the post. Displayed as a formatted date string in the request grid (`MarriageManagerPanel.as:1265`). |

## Value distributions / sentinels

Not applicable — empty export; all rows are live-server instances.

## Client usage

- `MarriageManagerPanel.as:794–820` — `onInitCharMarriageList` callback populates two `ArrayCollection`s: seeking posts (type = `TYPE_MARRIAGE_SEEKING`) and requests (type = `TYPE_MARRIAGE_REQUEST`), filtering by `cid` / `targetId`.
- `MarriageManagerPanel.as:1160–1180` — display projection: `level`, `sex`, `state`, `cClass` computed from raw fields.
- `MarriageManagerPanel.as:1245–1265` — refresh loop re-decodes `name` and `addDate` for both grids.
- `MarriageFeedHBox.as:214` — `marriageReqFeedback(id, response)` RPC uses the row `id`.
- `LinkEventUtil.as:140` — `TBL_MARRIAGE` (id 1007) used as a chat hyperlink type.
- `CallBack.as:6821–6827` — `onInitCharMarriageList` routes to `MarriageManagerPanel`.
- `CallBack.as:7198–7204` — `onInitMarriageSekList` routes updated seeking list.

## Related tables

- `cid` → [[TBL_CHARACTOR]] (posting character).
- `targetId` → [[TBL_CHARACTOR]] (proposal target, for request type).
- `classId` → [[TBL_CLASS]] (for display name).
- On mutual acceptance → creates a [[TBL_COUPLE]] record.
