# TBL_GUILD_MEMBER

| Property | Value |
|---|---|
| Table ID | 25 |
| Record count | 0 |
| JSON | `docs/database/game_data/TBL_GUILD_MEMBER.json` |
| Client constant | `GamePredef.TBL_GUILD_MEMBER = 25` |

## Purpose

Runtime per-membership record linking a character to a guild. Each row represents one character's membership (or pending application). The client indexes by `gid` (primary) and `cid` (secondary) so guild members can be looked up either by guild or by character. The authenticated player's own membership row is cached as `selfGuildMemberData` and also as `_core.player.gData`.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key — membership row ID (called `tableId` when projected into the UI grid). Used to identify the row in delete/update callbacks (`GuildPanel.as:2086`, `2947`, `4554`). |
| `gid` | int | Guild ID — foreign key to [[TBL_GUILD]]. Primary index key (`TBL_INDEX_ARRAY[TBL_GUILD_MEMBER] = "gid"`). Also keyed for member-count bookkeeping (`GuildPanel.as:1709`, `2942`, `4550`). |
| `cid` | int | Character ID of the member — secondary index (`TBL_INDEX_ARRAY2[TBL_GUILD_MEMBER] = "cid"`). Used to find `selfGuildMemberData` (`GuildPanel.as:4032`). |
| `rank` | int | Rank level within the guild: `1` = guild master, `2`–`5` = officer/member tiers, `6` = lowest/new, `-1` = pending applicant. Drives all permission checks (`GuildPanel.as:1664`, `1756`, `1878`, etc.). |
| `note` | pipe-list | Packed character snapshot: `"name|classId|exp"`. Parsed on the client with `split("|")` to derive display name, class, and level (`GuildPanel.as:2066`, `2086–2094`, `2519`). |
| `normalContrib` | int | Cumulative normal contribution points for the member. Displayed in the contribution column and mutated by contribution callbacks (`GuildPanel.as:1688`, `4904`). |
| `donateContrib` | int | Cumulative donation contribution points. Displayed and mutated similarly (`GuildPanel.as:1689`, `4896`). |
| `status` | bool(0/1) | Online presence flag, pushed by the server. Drives "online/offline" label in the member grid (`GuildPanel.as:2063`, `2520`). |

## Value distributions / sentinels

Not applicable — empty export; all rows are live-server instances.

## Client usage

- `GuildPanel.as:4028–4056` — `onInitGuildList` packet's `memberList` array is iterated; the player's own row is extracted as `selfGuildMemberData`.
- `GuildPanel.as:2046–2113` — `updateMemberList()` iterates `memberList`, decodes `note`, resolves online status and rank name, builds the `memberGrid` data provider.
- `GuildPanel.as:2512–2537` — `updateApplyList()` builds the pending-applicants grid from members with `rank == -1`.
- `CallBack.as:1347–1361` — `onAddGuildMember(_arg_1)` adds a new member (fields: `cid`, `rank`, `note`) and shows a system message.
- `CallBack.as:5841–5844` — `onUpdateGuildMember` propagates rank/note changes.
- `GuildPanel.as:1688–1689` — `selfGuildMemberData.normalContrib` and `.donateContrib` displayed directly.

## Related tables

- `gid` → [[TBL_GUILD]] (parent guild).
- `cid` → [[TBL_CHARACTOR]] (character).
- Rank permission set defined in [[TBL_GUILD_RANK]] (matched by `rank` value).
- `note[1]` (classId) → [[TBL_CLASS]] for display name lookup.
