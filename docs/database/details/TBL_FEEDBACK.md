# TBL_FEEDBACK

| Property | Value |
|---|---|
| Table ID | 22 |
| Record count | 0 |
| JSON | `docs/database/game_data/TBL_FEEDBACK.json` |
| Client constant | `GamePredef.TBL_FEEDBACK = 22` |

## Purpose

Runtime table for player-submitted feedback or bug reports. Indexed by `guid` (the character's globally-unique session/account identifier, mirroring `TBL_INDEX_ARRAY[TBL_CHARACTOR] = "guid"`), which suggests one active feedback ticket per character session.

Empty export; no static rows. Client constant present.

## Key reference

| Key | Type | Function |
|---|---|---|
| `guid` | string | Globally unique character/session identifier (primary index). The same field indexes `TBL_CHARACTOR`. `_core.guid` is set from the login response (`CallBack.as:7030`) and used in `restoreChar` (`CharSelectCanvas.as:1002`). No field-level read/write of a feedback record body was recovered from static analysis. |

No further field-level client usage found. The table constant is registered and the index key is `guid`, but no UI panel, callback, or remote-call handler was identified that reads or writes individual feedback record fields beyond the index.

## Client usage

- `GamePredef.as:8338` — `TBL_INDEX_ARRAY[TBL_FEEDBACK] = "guid"` (index registration only; no UI or logic code reads `GameData.d[22]`).
- `CallBack.as:7030` — `_core.guid = _arg_1.id` (populates the session GUID on login; this is the value used as the index key).
- `CharSelectCanvas.as:1002` — `_core.remote.restoreChar(_core.guid, selectedChar.cid)` (sends GUID to server for character restoration; not a feedback RPC).

No `onFeedback`, `sendFeedback`, `addFeedback`, or `getFeedback` callbacks were found in `CallBack.as` or any panel.

## Related tables

- `guid` → [[TBL_CHARACTOR]] (same index field; feedback row is scoped to one character session).
