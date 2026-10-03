# TBL_PM_RIGHT

| Property | Value |
|---|---|
| Table ID | 95 |
| Record count | 35 |
| JSON | `docs/database/game_data/TBL_PM_RIGHT.json` |
| Client constant | `GamePredef.TBL_PM_RIGHT = 95` |

## Purpose

Defines VIP / premium membership privileges (quyền lợi VIP). Each row is one named privilege benefit. The nine `value1`–`value9` fields hold the numeric benefit amount for VIP tiers 1–9; the nine `vip1`–`vip9` fields are flag booleans indicating whether a given tier receives this privilege at all. The VIP Panel (`PmPanel`) reads this table sorted by `sortIndex`, filters rows by `vipN` for the current player's tier, and renders each active privilege with its localized description and — when `type` allows an action — an interactive claim button.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Used as the button `name` in `PmPanel.as:1691` and as the index into `btnDict` for tracking claim state. |
| `desc` | string | HTML-formatted privilege description shown in the VIP panel row. May contain `{num}` placeholder replaced at runtime with `value<N>` for the player's tier (`PmPanel.as:1674–1675`). |
| `desc2` | string | Plain-text short description (no formatting). Used as a simpler label or subtitle. |
| `type` | int | Privilege interaction type: `1` = one-time claim button, `2` = repeatable daily/periodic claim button (with count tracking), `3` = passive benefit (no button), `4` = special type with no cooldown display. `PmPanel.as:1681/1701–1716`. Distribution: `1`×2, `2`×6, `3`×26, `4`×1. |
| `sortIndex` | int | Display sort order. `PmPanel.as:1637` sorts `GameData.d[TBL_PM_RIGHT]` by `sortIndex` numerically before rendering. |
| `countConfig` | string | Pipe-separated triplet `"v1|v2|maxCount"` controlling claim-button logic for `type 1/2`: element `[2]` is the daily/period maximum. Empty string for passive (`type 3`) rows. Non-empty values: `"1|1|1"` (6 rows) and `"2|30|1"` (1 row). `PmPanel.as:751/762/1695/1699`. |
| `value1` | int | Benefit amount for VIP tier 1. |
| `value2` | int | Benefit amount for VIP tier 2. |
| `value3` | int | Benefit amount for VIP tier 3. |
| `value4` | int | Benefit amount for VIP tier 4. |
| `value5` | int | Benefit amount for VIP tier 5. |
| `value6` | int | Benefit amount for VIP tier 6. |
| `value7` | int | Benefit amount for VIP tier 7. |
| `value8` | int | Benefit amount for VIP tier 8. |
| `value9` | int | Benefit amount for VIP tier 9. |
| `vip1` | bool(0/1) | `1` = VIP tier 1 receives this privilege. Used as per-tier enable flag: `_local_3[i]["vip" + arg_1]` (`PmPanel.as:1659`). |
| `vip2` | bool(0/1) | Enable flag for VIP tier 2. |
| `vip3` | bool(0/1) | Enable flag for VIP tier 3. |
| `vip4` | bool(0/1) | Enable flag for VIP tier 4. |
| `vip5` | bool(0/1) | Enable flag for VIP tier 5. |
| `vip6` | bool(0/1) | Enable flag for VIP tier 6. |
| `vip7` | bool(0/1) | Enable flag for VIP tier 7. |
| `vip8` | bool(0/1) | Enable flag for VIP tier 8. |
| `vip9` | bool(0/1) | Enable flag for VIP tier 9. |

## Value distributions / sentinels

- `type`: `1`×2 (one-time claim), `2`×6 (daily claim), `3`×26 (passive), `4`×1 (special).
- `countConfig`: `""`×28 (passive/no-action rows), `"1|1|1"`×6 (daily with max=1), `"2|30|1"`×1 (monthly with max=1).
- `sortIndex`: ranges 1–18; each row has a unique sort position.

## Client usage

- `PmPanel.as:745/751–762` — looks up `countConfig` by `id` to configure claim-button state after a server push.
- `PmPanel.as:1636–1637` — loads full table and sorts by `sortIndex`.
- `PmPanel.as:1659` — filters rows by `vipN` flag for the player's current VIP level (`arg_1` = tier index 1–9).
- `PmPanel.as:1671–1675` — renders `desc` with `{num}` replaced by `valueN` for the current tier.
- `PmPanel.as:1681` — branches on `type`: skips button for `type 3`, adds claim button for `type 1/2/4`.
- `PmPanel.as:1685/1691` — assigns `id` as the button's `name` for tracking in `btnDict`.
- `PmPanel.as:1695–1716` — switch on `type`: drives `countConfig[2]` as the daily cap display for claim buttons.
- `EquiptFuncPanel.as`, `WingFuncPanel.as`, `PetFuncPanel.as`, `AuctionPanel.as`, `PmInfoPanel.as` — also reference `TBL_PM_RIGHT` for privilege-gating specific features (no direct field reads observed beyond `id`-based lookup).

## Related tables

None (self-contained privilege definition table).
