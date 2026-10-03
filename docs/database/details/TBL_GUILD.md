# TBL_GUILD

| Property | Value |
|---|---|
| Table ID | 23 |
| Record count | 0 |
| JSON | `docs/database/game_data/TBL_GUILD.json` |
| Client constant | `GamePredef.TBL_GUILD = 23` |

## Purpose

Runtime instance table storing each guild's master record: identity, finances, capacity, and progression level. The client caches the authenticated player's guild as `myGuild` and as `_core.player.guild`; the primary lookup index is `cid` (leader character ID).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key — guild ID. Sent as argument to RPCs such as `guildLevelUp`, `addGuildBankSlotNum`, `addMaxGuildMemberNum`. (`GuildPanel.as:1713`, `2020`, `2727`, `4873`) |
| `cid` | int | Character ID of the guild master / leader. Used to test demise eligibility (`GuildPanel.as:1896`, `5199`) and re-assigned on leader transfer (`GuildPanel.as:5390`). Also serves as `TBL_INDEX_ARRAY` key. |
| `name` | string | Guild display name. Shown in panel header, guild list grid, and system broadcasts. Mutated locally on rename response (`GuildPanel.as:1680`, `2418`, `4924`). |
| `ln` | string | Leader name (pre-computed for display). Refreshed on leader transfer (`GuildPanel.as:1681`, `5391`). |
| `guildInfo` | string | Guild description / notice body. Shown in `myGuildInfo` rich text area (`GuildPanel.as:1682`). |
| `money` | int | Guild funds (gold). Displayed and mutated by contribution callbacks (`GuildPanel.as:1684`, `4890`). |
| `exp` | int | Guild experience points. Drives level-up eligibility (`GuildPanel.as:1685`, `4886`). |
| `level` | int | Guild level. Shown in panel; used to gate skill/slot upgrades (`GuildPanel.as:1698`). |
| `bagSlotNum` | int | Number of unlocked guild warehouse slots (tier 1–4). Displayed and used to bound the slot range in `GuildWarehousePanel.as:4338`. |
| `memLimit` | int | Maximum member count (expandable via `addMaxGuildMemberNum`). Shown in panel (`GuildPanel.as:1687`). |

## Value distributions / sentinels

Not applicable — empty export; all rows are live-server instances.

## Client usage

- `GuildPanel.as:1680–1713` — initial render of guild header (name, leader, info, money, exp, bagSlotNum, memLimit, level, id).
- `GuildPanel.as:4028–4044` — `onInitGuildList` assigns the server packet's `myGuild` sub-object to the local variable; also stored in `_core.player.guild`.
- `GuildPanel.as:5361`, `5390–5391` — `onUpdateGuild` callback updates `id`, `cid`, `ln` on leader-transfer.
- `GuildPanel.as:4886`, `4890` — `exp` and `money` mutated locally when guild-contribution callbacks arrive.
- `GuildWarehousePanel.as:4338` — `bagSlotNum` bounds the visible warehouse slot range.
- `CallBack.as:725–727` — `onInitGuildList` routes the entire guild packet to the panel.

## Related tables

- `id` → [[TBL_GUILD_MEMBER]] (`gid` FK), [[TBL_GUILD_RANK]] (`gid` FK), [[TBL_GUILD_SLOT]] (`gid` FK).
- `cid` references [[TBL_CHARACTOR]] (guild master character).
- [[TBL_GUILD_MAP]] is a sibling runtime table scoped to guild maps.
