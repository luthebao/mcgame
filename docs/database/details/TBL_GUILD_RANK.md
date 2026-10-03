# TBL_GUILD_RANK

| Property | Value |
|---|---|
| Table ID | 26 |
| Record count | 0 |
| JSON | `docs/database/game_data/TBL_GUILD_RANK.json` |
| Client constant | `GamePredef.TBL_GUILD_RANK = 26` |

## Purpose

Runtime per-guild rank-definition table. Each row configures one rank tier within a specific guild — its display name and the six binary permission flags that govern what members at that rank can do. The client receives the full rank array in the `onInitGuildList` packet and caches it as `guildRank`; the player's own rank object is cached as `myRank`.

## Key reference

| Key | Type | Function |
|---|---|---|
| `gid` | int | Guild ID — foreign key to [[TBL_GUILD]]. Primary index (`TBL_INDEX_ARRAY[TBL_GUILD_RANK] = "gid"`). Groups all rank rows for a guild. |
| `rank` | int | Rank tier number. `1` = guild master (read-only, special cased), `2`–`5` = configurable officer/member ranks, `6` = default new-member rank. Matched against `TBL_GUILD_MEMBER.rank` (`GuildPanel.as:4146`, `2056`). |
| `name` | string | Display label for this rank (customisable by guild master). Shown next to each member in the grid and in the duty selection dropdown (`GuildPanel.as:1683`, `1765`, `1886`, `4155`). |
| `canAdd` | bool(0/1) | Permission: may invite/add new members. `myRank.canAdd == 1` gates the add-member flow (`GuildPanel.as:2502`, `2960`). |
| `canQuest` | bool(0/1) | Permission: may accept guild quests. (inferred from checkbox label — no isolated UI handler found) |
| `canSlot` | bool(0/1) | Permission: may access/modify guild warehouse slots. (inferred from checkbox label — no isolated UI handler found) |
| `canInfo` | bool(0/1) | Permission: may view detailed guild information (`myRank.canInfo == 1` gates `GuildPanel.as:1672`, `2761`). |
| `canDel` | bool(0/1) | Permission: may kick members. `myRank.canDel == 1` enables the kick context-menu option (`GuildPanel.as:1892`, `5193`). |
| `canDuty` | bool(0/1) | Permission: may change another member's rank. `myRank.canDuty == 1` enables rank-reassignment (`GuildPanel.as:1878`). |

## Value distributions / sentinels

Not applicable — empty export; all rows are live-server instances.

## Client usage

- `GuildPanel.as:4044` — `guildRank` populated from `onInitGuildList` packet's `guildRank` array.
- `GuildPanel.as:4140–4157` — `updateRankInfo()` iterates `guildRank`, sets permission checkboxes for ranks `2`–`5`, sets the name text fields.
- `GuildPanel.as:1664`, `1672`, `1683` — `myRank.rank`, `.canInfo`, `.name` used to render player's own rank UI.
- `GuildPanel.as:1878`, `1892`, `2502`, `2960` — `myRank.canDuty`, `.canDel`, `.canAdd` used as gate conditions before RPC dispatch.
- `GuildPanel.as:2052–2058` — member grid duty column resolved by matching `member.rank` against `guildRank` array.
- `CallBack.as:4275–4278` — `onAddGuildRank(_arg_1)` calls `_dm.addNewData(GamePredef.TBL_GUILD_RANK, _arg_1)` (`GuildPanel.as:3951`).

## Related tables

- `gid` → [[TBL_GUILD]] (parent guild).
- `rank` value matches `TBL_GUILD_MEMBER.rank` for display resolution.
