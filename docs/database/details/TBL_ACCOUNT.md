# TBL_ACCOUNT

| Property | Value |
|---|---|
| Table ID | 0 |
| Record count | 0 (runtime/instance table) |
| JSON | `docs/database/game_data/TBL_ACCOUNT.json` |
| Client constant | `GamePredef.TBL_ACCOUNT = 0` |

## Purpose

Account-level runtime record received from the server after authentication. Holds the account's unique identifier, email/login credential, and account-level metadata (e.g. account level). No static rows exist in the client data dump — this is a live record pushed by the server on login. Indexed by `email` (`TBL_INDEX_ARRAY[TBL_ACCOUNT] = "email"` — `GamePredef.as:8316`).

Classification: **runtime / account-scoped instance data**.

## Key reference

Fields confirmed from `CallBack.as:onLogin()` and `GamePredef.as` index configuration:

| Key | Type | Function |
|---|---|---|
| `id` | int | Account unique ID. Stored as `_core.guid = _arg_1.id` in `CallBack.as:onLogin():7029`. |
| `email` | string | Account login email. Used as the secondary index key (`TBL_INDEX_ARRAY[TBL_ACCOUNT] = "email"`). |
| `lv` | int | Account level. Stored as `_core.acountLv = _arg_1.lv` in `CallBack.as:onLogin():7030`. |

No further field-level reads of TBL_ACCOUNT data were found in the exported `.as` files beyond these three. The account record is primarily used server-side; the client consumes only `id` and `lv` from the login callback payload.

## Client usage

- `GamePredef.as:493` — constant definition `TBL_ACCOUNT = 0`.
- `GamePredef.as:8316` — `TBL_INDEX_ARRAY[TBL_ACCOUNT] = "email"`.
- `CallBack.as:onLogin():7029–7030` — `_core.guid = _arg_1.id`, `_core.acountLv = _arg_1.lv`.

No UI panels or logic files reference `GamePredef.TBL_ACCOUNT` or `d[0]` directly outside of `GamePredef.as`.

## Related tables

- Account owns one or more characters → [[TBL_CHARACTOR]].
