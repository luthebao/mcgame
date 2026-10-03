# TBL_CHARACTOR

| Property | Value |
|---|---|
| Table ID | 2 |
| Record count | 0 (runtime/instance table) |
| JSON | `docs/database/game_data/TBL_CHARACTOR.json` |
| Client constant | `GamePredef.TBL_CHARACTOR = 2` |

## Purpose

Per-character runtime record for the logged-in player and any other characters visible in the scene. This is not a static template table — it holds live instance data (stats, position, cosmetics, progression) received from the server on login and scene entry. The JSON export is empty because no static rows exist in the client data dump. The client indexes by `guid` (`TBL_INDEX_ARRAY[TBL_CHARACTOR] = "guid"`) and also by `name` (`TBL_INDEX_ARRAY2[TBL_CHARACTOR] = "name"`) and by `ti` (`TBL_INDEX_ARRAY3[TBL_CHARACTOR] = "ti"`).

Classification: **runtime / character-scoped instance data**.

## Key reference

Fields confirmed from `Creature.as`, `Charactor.as`, `Player.as`, and `CallBack.as`:

| Key | Type | Function |
|---|---|---|
| `id` | int | Character instance ID (server-assigned). Stored as `_core.cid` on login (`CallBack.as:207`). Used in link encoding (`LinkEncode.encode(TBL_CHARACTOR, id, name)`). |
| `guid` | int | Account-scoped unique ID for this character slot. Secondary index key (`TBL_INDEX_ARRAY[TBL_CHARACTOR] = "guid"`). |
| `name` | string | Character display name. Secondary index (`TBL_INDEX_ARRAY2[TBL_CHARACTOR] = "name"`). |
| `classId` | int | Class (1–6) → [[TBL_CLASS]]. |
| `gender` | int | `0` = male, `1` = female (`GamePredef.GENDER_MALE`). |
| `level` | int | Character level. |
| `exp` | float | Current experience points. Accessed via `Charactor.get exp()`. |
| `expRe` | float | Rested/bonus XP. Converted to `levelRe` via `expReToLevelRe()` on load. |
| `resCode` | int | Visual resource code for this character's body sprite. |
| `posX` | int | Current X position on the map. |
| `posY` | int | Current Y position. |
| `posMapId` | int | Current map ID → [[TBL_MAP]]. |
| `posDir` | int | Facing direction. |
| `hp` | int | Current HP. |
| `hpMax` | int | Maximum HP. |
| `mp` | int | Current MP. |
| `mpMax` | int | Maximum MP. |
| `sp` | int | Current SP (stamina/spirit points). |
| `spMax` | int | Maximum SP. |
| `attStrength` | int | Effective strength (`Player.as:106`). |
| `attAgility` | int | Effective agility (`Player.as:126`). |
| `attStamina` | int | Effective stamina (`Player.as:59`). |
| `attIntelligence` | int | Effective intelligence (`Player.as:33`). |
| `attEnergy` | int | Effective energy (`Player.as:60`). |
| `pk` | int | PK flag / kill count. |
| `t` | int | Active title ID → [[TBL_TITLE]]. Stored as `player.t`. |
| `ti` | float | Title-related index (`TBL_INDEX_ARRAY3[TBL_CHARACTOR] = "ti"` — `Player.as:127`). |
| `vipT` | int | VIP tier level (`Player.as:39`). |
| `gmLevel` | float | GM authority level. `Player.as:34`. |
| `star` | int | Star/ascension rank (`Charactor.as:37`). |
| `gold` | float | Character gold (currency). `Player.as:319`. |
| `goldBind` | float | Bound gold. `Player.as:550`. |
| `money` | float | Cash-currency (premium). `Player.as:446`. |
| `ep` | object | Blood-bag / energy-pack data, set via `_core.setBloodBag(_local_3.ep)` on login. |
| `showPetId` | int | ID of the currently displayed follow-pet. |
| `maxActPoint` | int | Maximum action points cap. |
| `maxVigor` | int | Maximum vigor cap. |
| `expRe` | float | Rested XP accumulator. |
| `decoInfo` | object | Decoration cosmetic info object (optional, `Charactor.as:188`). |
| `prsUseId` | float | Prestige/persona use ID (optional, `Charactor.as:190`). |
| `inBattleServer` | bool | Whether character is in the cross-server battle instance (`CallBack.as:254`). |
| `offlineTime` | uint | Timestamp of last logout (`Player.as:162`). |
| `createTime` | float | Account/character creation timestamp (`Player.as:101`). |

Additional runtime-only fields attached after login (not in the wire DTO but stored on the player object): `property` (derived stats object), `equipActiveList`, `skillList`, `guild`, `gData`, `achieveLog`, `achieveReqLog`, `qn`, `cpid`, `starsData`.

## Client usage

- `CallBack.as:onChooseCharactor(...)` — main login handler; maps `_arg_1.cData` onto `player` via `createPlayer()`.
- `Core.as:createPlayer(_arg_1)` — constructs the `Player` object from the cData DTO; `_local_2.data = _arg_1`.
- `GamePredef.as:8318` — `TBL_INDEX_ARRAY[TBL_CHARACTOR] = "guid"`.
- `GamePredef.as:8406` — `TBL_INDEX_ARRAY2[TBL_CHARACTOR] = "name"`.
- `GamePredef.as:8481` — `TBL_INDEX_ARRAY3[TBL_CHARACTOR] = "ti"`.
- `BattleServer.as:37` — listed in `_RECREATE_INDEX_ARRAY` alongside `TBL_CHARACTOR_SLOT`, `TBL_EQUIPT_INSTANCE`, `TBL_ITEM_INSTANCE`, `TBL_PET` — all re-indexed when entering cross-battle.
- Used as the `sourceIdType` in link-encoding throughout chat, IM, and event panels for clickable character name hyperlinks.

## Related tables

- `classId` → [[TBL_CLASS]].
- `posMapId` → [[TBL_MAP]].
- `t` (active title) → [[TBL_TITLE]].
- Slot inventory → [[TBL_CHARACTOR_SLOT]].
- UI settings → [[TBL_CHARACTOR_INTERFACE]].
- Title ownership → [[TBL_CHARACTOR_TITLE]].
