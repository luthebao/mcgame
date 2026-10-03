# TBL_MAIL

| Property | Value |
|---|---|
| Table ID | 32 |
| Record count | 0 (runtime table) |
| JSON | `docs/database/game_data/TBL_MAIL.json` |
| Client constant | `GamePredef.TBL_MAIL = 32` |

## Purpose

A runtime table holding the current player's received mail items. No static rows exist; all rows are pushed by the server on login and via callbacks when new mail arrives. The client indexes by `receiverId` (`TBL_INDEX_ARRAY[TBL_MAIL] = "receiverId"`, `GameData.as:8348`) to filter the inbox for the logged-in character. Mail is displayed in `MailPanel.as` and `MailManagerPanel.as`; RPCs `takeMail` (claim attachment), `setReadDate` (mark read), `deleteMail`, and `addMail` (send) operate on these rows.

## Key reference

Fields confirmed from `MailPanel.as` and `MailManagerPanel.as` client usage (runtime objects, not static schema):

| Key | Type | Function |
|---|---|---|
| `id` | int | Mail message ID. Used in `takeMail(id)`, `setReadDate(id)`, `deleteMail(id)` RPCs (`MailPanel.as:400, 876, 912`). |
| `receiverId` | int | Recipient character ID (primary index key, `GameData.as:8348`). Checked against `core.player.id` at `MailPanel.as:790`. |
| `senderId` | int/string | Sender's character ID. `"0"` or `0` = system mail (`MailPanel.as:793, MailManagerPanel.as:1168`). |
| `sn` | string | Sender name (display). Shown in the mail list (`MailPanel.as:797, MailManagerPanel.as:1173`). |
| `subject` | string | Mail subject line (`MailPanel.as:798, MailManagerPanel.as:1175`). |
| `text` | string | Mail body (HTML-formatted text) (`MailPanel.as:799`). |
| `money` | int | Attached silver/money. Displayed in `presentMoney` field (`MailPanel.as:801`). |
| `gold` | int | Attached gold/premium currency. Displayed in `presentGold` field (`MailPanel.as:802`). |
| `codMoney` | int | Cash-on-delivery amount in money. `0` = no COD (`MailPanel.as:803`). |
| `codGold` | int | Cash-on-delivery amount in gold (`MailPanel.as:804`). |
| `codFlag` | int | COD active flag: `1` = COD required to claim attachment (`MailPanel.as:809`). |
| `itemType` | int | Template table ID of the attached item (`29`=item, `19`=equip, `-1`=no item). `MailPanel.as:813`, `MailManagerPanel.as:949, 960`. |
| `itemId` | int | Template/instance ID of the attached item. `MailPanel.as:814`. |
| `stackNum` | int | Quantity of the attached item. `-1` = no item attached. `MailPanel.as:815`. |
| `readDate` | int | Timestamp (ms) when the mail was read. `-1` = unread. Used to compute expiry countdown (`MailManagerPanel.as:947, 975`). |

## Client usage

- `MailPanel.as:358–931` — single-mail viewer. Reads all fields listed above. Sends `takeMail`, `setReadDate`, `deleteMail` RPCs.
- `MailManagerPanel.as:619–1204` — inbox list view. Filters by `senderId > 0` vs system, reads `id`, `senderName`/`sn`, `subject`, `readDate`, `itemType`, `itemId`, `stackNum`, `money`, `gold`.
- `RendererImage.as:75` — checks `mailData.itemType == -1` (no attachment icon).
- `GameData.as:8348` — registers primary index `receiverId` on slot 32.
- `GameData.as:8436` — secondary index `null` (no secondary grouping).

## Related tables

- `receiverId` / `senderId` → character IDs (live session, not a static table).
- `itemType` + `itemId` → [[TBL_ITEM_TEMPLATE]] (when `itemType=29`) or [[TBL_EQUIPT_TEMPLATE]] (when `itemType=19`).
