# TBL_SKILL

| Property | Value |
|---|---|
| Table ID | 52 |
| Record count | 4914 |
| JSON | `docs/database/game_data/TBL_SKILL.json` |
| Client constant | `GamePredef.TBL_SKILL = 52` |

## Purpose

Defines every skill template in the game: combat and life skills for player characters, pet skills, guild skills, magic-weapon (artifact) skills, and training skills. The client builds a primary lookup `GameData.d[52][skill_id]` and three secondary indexes: by `codeName` (alias chain for evolving skills), by `reqClass` (class-restricted skill roster), and by `useEnv` (skill-environment bucket used to fill the 7 tabs in SkillManager). The constant `LINK_TYPE_ARRAY[52] = "SK"` means skill hyperlinks in chat resolve through this table.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up as `GameData.d[52][id]`. |
| `name` | string | Vietnamese display name shown in skill tooltip (`TipSkill.as:287`) and skill manager slots. |
| `description` | string | Multi-line skill effect description, may contain `\\n` line breaks (`TipSkill.as:287`). |
| `info` | string | Extended tooltip text shown below the main description (`TipSkill.as:288`). Empty string (`""`) on most records. |
| `codeName` | string | Unique string key (e.g. `"SKILL701735"`). Used as the secondary-index key so clients resolve skill-level chains: `gameDataIndex[52][codeName]` returns all levels of the same skill group (`UserBarCanvas.as:2442`). |
| `iconCode` | int | 13-digit icon asset code; passed to `ResManager.getIconUrl(iconCode)` to load the skill icon (`PortraitCanvas.as:732`, `LongBuffCanvas.as:402`). |
| `level` | int | Upgrade level of this skill entry within its `codeName` chain (1 = base). Tooltip: `Language.TIPSKILL_S[0].replace("{level}", level)` (`TipSkill.as:285`). |
| `kind` | int | Skill category. Maps to `SKILL_KIND_NAME[kind]` for tooltip display (`TipSkill.as:295`). Values: `1` = Chủ động (Active, 3443 records), `2` = Bị động (Passive, 1031), `3` = Trạng thái (Status/Buff, 246), `4` = Chức năng (Functional, 57), `5` = Luyện (Training/Ring, 130), `0` = unset (7). `kind == 2` disables the learn button for pets (`PetManagerPanel.as:8028`). |
| `type` | int | Skill sub-type within kind. Used with `SKILL_TYPE_NAME[type]` for tooltip (`TipSkill.as:295`). Values: `1`=Cận chiến (Close), `2`=Tầm xa (Remote), `3`=Ma pháp (Magic), `4`=Ma pháp (Magic bullet), `5`=Ma pháp (Recover), `6`=Trạng thái (State-add, 1041 records), `7`=Trạng thái (State-del), `8`=Đặc biệt (Func hurt), `9`=Đặc biệt (Func recover), `10`=Hỗ trợ (Defender), `11`=Khác (Other, 971), `13`–`24` = life skill sub-types (Fishing, Plant, Herb, Cook 17, Pharmacy 18, Hidden Weapon 19, Sew 20, Cookbook 21). |
| `useEnv` | int | Skill environment / UI tab bucket. `autoClick` maps this directly to the tab index (`SkillManager.as:430`). Values: `0`=battle character skills list 1 (2809), `1`=battle character skills list 2, `2`=character combat (mounted?) list, `3`=training skills (`addTrainingSkill` RPC, `SkillUseSlot.as:465`), `4`=guild skills (`addGuildSkill`/`improveGuildSkill` RPC, `SkillUseSlot.as:437`), `5`=magic-weapon/artifact skills (`addMagicWeaponSkill` RPC, `SkillUseSlot.as:451`), `6`=life skills (cooking, herb, etc., `SkillUseSlot.as:465`), `-1`=not assignable to hotbar (834). |
| `targetType` | int | Battle targeting mode. References `Battle.SKILL_TARGET_TYPE_*` constants (`Battle.as:27–37`). Values: `1`=self, `2`=self player only (409), `3`=self pet, `4`=any enemy (2492 records — largest group), `5`=enemy player, `6`=enemy creature, `7`=enemy non-boss, `8`=team, `9`=team player, `10`=team pet, `11`=all (409), `12`=player, `0`=unset. Used in `BattleCreatureView.as:634` to resolve target list and in auto-battle (`Battle.as:118`). |
| `targetNum` | int | Maximum number of targets the skill hits (shown in tooltip if `kind == 1` and `targetNum >= 1`, `TipSkill.as:297`). |
| `areaAttack` | int | Area-of-effect pattern. Maps to `GamePredef.SKILL_AREA_TYPE[areaAttack]` for display (`TipSkill.as:302`). Values: `-1`=none/unset (3318), `1`=Hàng dọc (vertical column, 88), `2`=Hàng ngang (horizontal row, 575), `3`=Chữ thập (cross, 70), `4`=Ngẫu nhiên (random, 863). Used by `BattleCreatureView.as:112` to compute target list. |
| `attackNum` | int | Number of hits per attack. `0` = no direct attack (buff/passive only). |
| `multiAttack` | int | Multi-attack flag. `0`=single (3960), `1`=multi-hit (945), `2`=special (2). |
| `element` | int | Elemental alignment. Maps to `GamePredef.ELEMENT_NAME[element]` and `ELEMENT_COLOR[element]` for display (`TipCre.as:2347`). Values: `-1`=unset/neutral (4298), `0`=Vô, `1`=Quang (Light), `2`=Ám (Dark), `3`=Phong (Wind), `4`=Địa (Thunder), `5`=Thủy (Water), `6`=Hỏa (Fire). |
| `buffId` | int | Foreign key → TBL_BUFF. `-1` = no buff. The client fetches `getData(TBL_BUFF, buffId)` to display buff info in the tooltip (`TipSkill.as:363`). |
| `buffRate` | int | Percent chance (0–100) to apply the buff (`TipSkill.as:378`, `Language.TIPSKILL_S[9].replace("{buffRate}", buffRate)`). |
| `buffRound` | int | Number of battle rounds the buff lasts (`TipSkill.as:373`, `Language.TIPSKILL_S[8].replace("{buffRound}", buffRound)`). |
| `reqLevel` | int | Minimum character level to learn or use the skill (`SkillUseSlot.as:593`, `SkillManager.as:1238`). |
| `reqClass` | string | Pipe-delimited list of class IDs that can learn this skill (e.g. `"|1|"`, `"|100|"`, `"|1|2|3|4|5|6|"`). The secondary index `gameDataIndex2[52]` buckets skills by class ID string. `@` suffix in a class ID (e.g. `"|1@|"`) marks alternative class requirements. Empty string = no class restriction (27 records). |
| `reqCL` | int | Required character-level stage (清灵/CL milestone). `0` = none. Special sentinel: `10` (`SKILL_REQUEST_CHAR_LEVEL`) means the player must have `expRe` (rebirth/reincarnation) status (`SkillManager.as:1240`, `SkillUseSlot.as:593`). |
| `expSkill` | int | Required skill-experience points (心法EXP) to unlock this skill level. Compared to `player.expSkill` (`SkillLearningPanel.as:541`, `SkillUseSlot.as:593`). |
| `price` | int | Silver coin (money) cost to learn. Compared to `player.money` or `player.moneyBind` (`SkillUseSlot.as:593`). |
| `gold` | int | Gold (premium currency) cost to learn. `-1` = no gold cost. Compared to `player.gold` (`SkillLearningPanel.as:541`). |
| `costGuildContrib` | int | Guild contribution cost to learn (guild skills). Shown in tooltip (`TipReqSkill.as:847`). `0` = no contribution required. |
| `guildDevExp` | int | Guild development EXP cost to unlock (for guild-managed skills). Shown in `TipDevSkill.as:147`. |
| `guildDevMoney` | int | Guild development money cost to unlock. Shown in `TipDevSkill.as:148`. |
| `creKind` | string | Required magic-weapon (creature/artifact) kind for the skill. Shown as "magic weapon level" requirement in tooltip (`TipReqSkill.as:848`). Format is `"kind"` or `"kind|subKind"` pipe pair. Empty string = no creature requirement. |
| `dexSkill` | int | Required dexterity (巧) stat to unlock the skill. `-1` = no requirement. Displayed as progress bar in `TipReqSkill.as:851`. |
| `exSid1` | int | Evolved skill variant 1 ID (FK → TBL_SKILL). `-1` = none. The client reads `exSid{n}` where `n` is the player's upgrade choice index (`SkillManager.as:1247–1250`). |
| `exSid2` | int | Evolved skill variant 2 ID. FK → TBL_SKILL. `-1` = none. |
| `exSid3` | int | Evolved skill variant 3 ID. FK → TBL_SKILL. `-1` = none. |
| `exStoneSid` | string | Stone-evolution alternate skill SID. When `exStoneSid > 0`, a confirmation dialog appears before changing pet-stone energy (`PetStonePanel.as:1386`). Empty string = none. |
| `restoreSid` | int | Skill ID to revert to (undo evolution). FK → TBL_SKILL. `-1` = not reversible. Checked in `UserBarCanvas.as:1036` and `PetPanel.as:2278`. |
| `restoreStoneSid` | string | Stone-specific revert skill SID. Empty string = none. |
| `scriptReqL` | string | Embedded ActionScript prerequisite expression evaluated at runtime (e.g. `require = (!petSkillLearned(pid, 5731));failMsg = "…";`). Empty string = no scripted prerequisite. Type: `script`. |
| `useHp` | float | HP cost per use. `< 1.0` = fraction of max HP; `>= 1.0` = flat HP. `0.000` = no HP cost. |
| `useMp` | float | MP cost per use. `< 1.0` = fraction of max MP; `>= 1.0` = flat MP (`TipSkill.as:313–320`). Compared to `player.currentMp` for availability highlight (`TipSkill.as:342`). |
| `useSp` | float | SP/stamina cost per use. Same fractional encoding as `useMp` (`TipSkill.as:326–335`). |
| `useItemId` | int | Required consumable item ID (FK → TBL_ITEM_TEMPLATE). `-1` = none. Used by `LifeSkillPanel.as:994` for crafting skill ingredient binding. |
| `useItemNum` | int | Quantity of `useItemId` consumed per use. `-1` = none. |
| `useItemType` | int | Item type category of the required ingredient. `-1` = none; `0` = special; non-negative values reference item type codes. |
| `isTest` | int | Development/availability flag. `-1` = normal live skill (4639), `1` = test/hidden (71), `2` = deprecated/removed from learn panel (204). `(inferred from data and SkillManager filter logic — no explicit isTest branch found in reviewed client code)` |

## Value distributions / sentinels

- `kind`: `1`×3443 (active), `2`×1031 (passive), `3`×246 (buff), `5`×130 (training/ring), `4`×57 (functional), `0`×7.
- `type`: `6`×1041 (state-add), `11`×971 (other), `3`×813 (magic), `1`×836 (close-combat), `5`×366 (magic-recover), `2`×118 (remote), and life-skill types 13–24.
- `targetType`: `4`×2492 (enemy, dominant), `2`×1143 (self-player), `8`×683 (team), `11`×409 (all), `1`×45 (self).
- `useEnv`: `0`×2809, `1`×614, `-1`×834, `6`×195, `4`×130, `3`×120, `5`×142, `2`×70.
- `element`: `-1`×4298 (no element), then scattered `1`–`6` elemental skills.
- `isTest`: `-1`×4639 (live), `2`×204 (retired), `1`×71 (test).
- `areaAttack`: `-1`×3318 (no AoE), `4`×863, `2`×575, `3`×70, `1`×88.

## Client usage

- `TipSkill.as` — tooltip rendering: `name`, `level`, `description`, `info`, `kind`, `type`, `targetNum`, `areaAttack`, `buffId`, `buffRate`, `buffRound`, `useMp`, `useSp`, `useEnv`.
- `TipReqSkill.as` — learn-requirement tooltip: `reqLevel`, `expSkill`, `price`, `gold`, `costGuildContrib`, `creKind`, `dexSkill`, `useEnv` (determines tab state "guild"/"artifact"/"life").
- `TipDevSkill.as` — guild skill learn: `guildDevExp`, `guildDevMoney`.
- `SkillManager.as:430–1357` — skill panel tab routing by `useEnv`; secondary index `reqClass` for per-class roster; `exSid{n}` chain resolution for evolved skills; `codeName` for duplicate detection.
- `SkillUseSlot.as:293–619` — hotbar slot: `codeName`, `level`, `reqLevel`, `expSkill`, `price`, `useEnv` (determines which RPC to call: `skillLearnByClient` / `addGuildSkill` / `addMagicWeaponSkill` / `addTrainingSkill`), `creKind`.
- `UserBarCanvas.as:2439–2727` — auto-skill configuration: `codeName`, `reqClass`, `exSid{n}`, `restoreSid`, `targetType`.
- `LongBuffCanvas.as:289–534` — long-running buff icons: `codeName`, `iconCode`.
- `PortraitCanvas.as:732` — skill icon rendering: `iconCode`.
- `BattleCreatureView.as:112` — combat target resolution: `targetNum`, `areaAttack`.
- `Battle.as:118–458` — auto-battle AI: `targetType`, `useEnv`.
- `PetPanel.as:2278`, `PetStonePanel.as:1386` — pet skill evolutions: `restoreSid`, `exStoneSid`.
- `LifeSkillPanel.as:994–2608` — life-skill crafting: `useItemId`, `useItemType`, `useItemNum`.
- `SmallGame.as:35` — minigame icon matching: `iconCode`.
- Secondary index: `gameDataIndex[52]` keyed by `codeName` (skill-level chain lookup), `gameDataIndex2[52]` keyed by `reqClass` (class-filtered roster), `gameDataIndex3[52]` keyed by `useEnv` (environment bucket).

## Related tables

- `buffId` → [[TBL_BUFF]] (status effect applied by this skill).
- `exSid1` / `exSid2` / `exSid3` / `restoreSid` → [[TBL_SKILL]] (self-referential evolution chain).
- `useItemId` → [[TBL_ITEM_TEMPLATE]] (crafting ingredient for life skills).
- `reqClass` → [[TBL_PLAYER_CLASS]] (class eligibility).
- `type` categorised by → [[TBL_SKILL_TYPE]], `kind` categorised by → [[TBL_SKILL_KIND]].
- Pet skill roster membership via → [[TBL_SKILL_POOL]] (`si` = skill `id`, `pi` = pool/class).
- Character-owned skill instances in → [[TBL_CHARACTOR_SKILL]].
