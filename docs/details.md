# MCGame Server — Full State Report

**Last generated:** 2026-05-16

**Scope.** Cross-referenced the Flash client's complete RPC surface (`docs/client`) against the Go server's actual handler registrations (`internal/presentation/rtmp/handlers/*`), the dispatcher's `quietMethods` table, the stub/effect-stub fallbacks, the security-research findings, and the recent plan/research backlog.

**Overall coverage.**

- Client wire surface: **~878 distinct outbound RPC method names** referenced in `.as`, plus ~250 inbound callbacks.
- Server registered handlers: **~525 unique RPCs** across **33 handler packages** (260+ .go handler files).
- Silent stub handlers (no-op fallbacks): **24** in `handlers/stub/handler.go`.
- Item-effect type stubs: **15** item types (`phase4Stubs`) return "chưa được hỗ trợ".
- Game data templates: 84 activity ids, full TBL_* surface seeded; daily-act award catalog seeded (`data.daily_act_award_rewards`, 5 tiers); VIP shop schema persisted (`20260511005538_vip_shop_schema.sql`); **schedule-boss registry seeded** (`data_tbl_schedule_boss`, 150 rows: 48 ground + 23 flying + 79 daily_only); **boss-loot tables persisted** (`boss_loot_schema` + per-tier lookup).
- Repository SQL: **fully migrated to schema-qualified Postgres functions** (4 batches: repo / inventory / social / complex). Inline `SELECT/INSERT/UPDATE/DELETE` strings in Go are now the exception (single-column lookups only); rule codified in `CLAUDE.md`.

---

## ✅ Fully implemented (production-shaped, code present)

| Area | Server packages / files | Status |
|---|---|---|
| **Auth / login / character** | `application/auth`, `domain/auth`, `handlers/auth` (17 RPCs) | Done — login, char create/select, dual-device G/F, force-kick, line switch, secondary password helper exists |
| **Scene / movement / world** | `application/scene`, `handlers/scene` (18) | Done — sceneLogin, sceneChange, toMovable/toSafe, createNpcs/Boss/Chars, transport, position sync (`udcp`/`udcr`), cbom |
| **Item / equipment / inventory** | `application/item`, `handlers/item` (76 RPCs) | Done — bag/bank/temp/quest/pet bag, equipOn/Off, sort, transport scrolls, repair, item-effect registry, social pranks, radar |
| **Equipment modifications** | `handlers/item/{change_*,star,resolve,jewel,gem,hole,maker}.go` | Done — change soul/element/bind/prefix/level, star upgrade (0–10), equResolve, hole drilling, jewel inlay, signature set bonus, sublimation, Ky Linh, pet stones |
| **Crafting / production** | `handlers/item/{craft,maker,mix}.go` | Done — `getMakeColor`, `newMake`, materialMixOne/All, prefix rules, random elements, orange notice |
| **Combat** | `application/combat`, `domain/combat`, `handlers/combat` (20) | Done — turn-based, group battle, skill range, animation effects, damage formula with combo/counter, revive, timeout finalization, watcher cleanup; `BattleTypeStarInstance=5` wired, `EndBattle` handles star-instance scoring + `setStarPoint` push |
| **NPC / quest** | `application/quest`, `handlers/npc` (13) + `handlers/quest` (10) | Done — `clickNpc`, healing, quest take/finish/cancel, callboard, type-10/20 quest battles, prereq, multi-boss story battles |
| **Pet system** | `application/pet`, `handlers/pet` (35) | Done — slot/skill-slot opening, follow scene, guard, skill book, eligibility, equipment, bind/skill-delete, bag summon, stat refresh, attribute points, life meter |
| **Pet arena** | `application/petarena`, `handlers/petarena` (18) | Done — Elo, fights, season rewards, replay |
| **Group / party** | `application/group`, `handlers/group` (25) | Done — invite/join/leave/kick, leader transfer, AFK, leader-position, transport follow-through, mList linked-list rules |
| **Guild** | `application/guild`, `handlers/guild` (31 RPCs) | Done — create/join/leave/kick, guild book, guild info, contribution, rank, war registration, notice update (note: `getGuildInfo`/`getGuildList` still routed through stub handler) |
| **Shop / VIP / PM** | `application/shop`, `handlers/shop` (19) | Done — `getShopConfig`, NPC direct shop, **VIP shop now DB-backed** (`vipshop_repository.go`, postgres-persisted rotation/discount/refresh; 4h shared + per-char personal refresh, gold-only debit, `onUPP`+`onAddItem`+`onAddCharactorSlot` callbacks; see `docs/memory/vip-shop.md`), PM persistence, daily PM exp, `doPmOperation` (rights 2,3,4,7,10) |
| **Activity panels** | `application/activity`, `handlers/activity` (41) | Done — DB-backed `startedActList` (84 ids), Send Combine, Boss Daily, premium VIP, daily/feast/award, onboarding |
| **Daily Act Panel** | `application/activity/daily_act_service.go`, `domain/dailyact`, `handlers/activity/daily_act.go` (1 RPC) | Done — `getDailyPanelAwardState`, `getCharDiaryData`, `getTodayOnlineTime`, `getDailyActAward` (5 tiers); `updateDiaryData` push pipeline (`DailyActService.IncrementTask`); login task wired (id=29); `player.character_daily_act` table + 5 schema-qualified PG functions; see `docs/memory/daily-act.md` |
| **War Sprite (Chiến Hồn Bạo Nộ)** | `application/warsprite`, `handlers/warsprite` (6), `domain/warsprite` | Done — two-tab panel (Thăng Cấp + Tiến Hóa), 16 sprite slots, currencies 229/230 (Dũng Khí / Ý Chí Thạch), stored in `character_stat_features` (`feature_key='war_sprite'`), `updateWSPPanel` push on every upgrade; `getSpWarData`, `addWarSprite/Gold`, `addBattleSprite/Gold`, `getWSPBuffList`; see `docs/memory/warsprite.md` |
| **Admin Activity Broadcast** | `infrastructure/adminhttp/activity_broadcast.go` | Done — `POST /api/admin/activities/broadcast` pushes activity flag updates (`onUpdateRunActList`) or full list refresh to all online players on activity row create/update/delete |
| **Level-Up Pusher** | `application/activity/level_up_pusher.go` | Done — listens on event bus, refreshes `startedActList`/diary on level-up |
| **Schedule boss respawn** | `application/scheduleboss/{service,scheduler,bootstrap}.go`, `domain/scheduleboss/{types,cooldown,repository}.go`, `infrastructure/persistence/postgres/scheduleboss_{config,state}_repository.go`, `infrastructure/scheduleboss/payload.go`, `cmd/seed-schedule-bosses` | Done — three-kind registry (`ground` / `flying` / `daily_only`); ground cooldown = `2h + ⌊lvl/10⌋·15m`, flying cooldown = `4h + ⌊lvl/10⌋·30m`; PG-function repos (`20260514035429_scheduleboss_functions`); RTMP payload broadcast; seed generator pulls from `activity.xml` (ground) + `data_tbl_npc.layer=3` (flying) + `BossDailyConfigs` (daily_only). See `docs/memory/schedule-boss.md`. |
| **Boss loot tables** | `application/bossloot/service.go`, `domain/bossloot/{types,repository}.go`, `infrastructure/persistence/postgres/boss_loot_repository.go`, `application/combat/{boss_loot.go,currency_drops.go,rewards.go}`, admin UI under `dashboard/src/app/dashboard/boss-loot/` and `/loot/` | Done — per-NID drop tables with tier filter (`20260515063431_boss_loot_schema` + `_functions` + `_lookup_with_tier`); currency drops + item-quantity ranges (`creature_loot_qty_range`); admin pages (boss-loot, loot, item-options, lines) with service-role grant migration. See `docs/memory/boss-loot.md`. |
| **Runtime config store** | `infrastructure/config/store/{store,listener,types}.go`, `dashboard/src/services/{game-config,gateway-config}.service.ts`, `dashboard/src/app/dashboard/game-config/`, `dashboard/src/app/api/game-config/[group]/` | Done — hot-reloadable game-config tables (`20260514045440_runtime_config_tables`) with admin UI for editing groups + lines; gateway-config + game-config admin services. See `docs/memory/gateway-config-runtime.md`. |
| **Postgres-function repo migration** | `supabase/migrations/20260514041150_batch1_repo_functions.sql` (+ batches 2/3/4) | Done — converted achievement / activity / buff / character / farm / gamedata / guild / item / magic-estate / npc / pet / quest / relationship / scene-item / skill / title repos to schema-qualified `select schema.fn(...)` calls. Patterns documented in `CLAUDE.md` (returns `setof`, returns `boolean` with `with upd as … select exists`, `jsonb_to_recordset` bulk insert, `p_table::regclass` dynamic). |
| **Line server (DB-backed)** | `infrastructure/rtmp/db_line_provider.go`, `infrastructure/rtmp/connection_handler.go`, `infrastructure/rtmp/server.go` | Done — replaces the deleted `internal/infrastructure/grpc/lineserver_*` and `internal/application/lineserver` packages. Connection handler resolves line via DB lookup; `static_line_provider` removed. Connect-handshake error path now uses the `Failed` code for connection failures. |
| **Character leveling / stats refactor** | `domain/stats/{bonus,effective,legacy,maps,profile,propid,scale}.go`, `domain/character/{character,effective}.go`, `domain/character/character_leveling_test.go`, `application/character/service_test.go` | Done — extracted stats package, `NormalizeAttributePoints` for character progression, `Final*` field sync (memory: `feedback_final_fields_require_sync.md`), backfill snippet under `supabase/snippets/backfill_attribute_points.sql`. |
| **Combat — permille turn builder** | `domain/combat/{turn_builder_permille,resolve,resolve_test,battle,turn_builder,turn_processor}.go`, `application/combat/{effective_test,encounter,npc_stats,rewards,service}.go`, `application/combat/combat_test.go` | Done — permille-based resolution path with explicit test coverage; encounter/rewards/effective overhauls; group-battle scoring tweaks; pet-property permille script (`cmd/scripts/pet_property_permille`). |
| **Achievement** | `application/achievement`, `handlers/achievement` | Done — login snapshot, `getAchieveAward`, title-rewards |
| **Title** | `application/title`, `handlers/title` (3) | Done — title→buff plumbing now resolved via `buildTitleBuffPayload` |
| **Magic Weapon** | `application/magicweapon` (9 files), `handlers/magicweapon` (17) | Done — main + sub MW, slots 15-20, upgrade, repair, resolve, trans, succinct, prop reset, skill grant on equip, stage tier |
| **Buff system** | `application/buff`, `handlers/buff` | Done — `player.character_buffs`, initLongBuff/upLongBuff/delBuff, PM right 3 wired |
| **Farm / life skill** | `application/farm`, `application/skill`, `handlers/farm` (15) | Done — magic estate (Fazenda), Trồng Trọt as life skill, vigor cost, visual stages, plant rules, harvest |
| **Trade** | `application/trade`, `handlers/trade` (7) | Done — newTrade, addItem, lock, confirm, set money, stop |
| **Dress / costume** | `application/dress`, `handlers/dress` (17) | Done — activate, fake/hide costumes, recipes/chips, dress book, transform suppression, recieveGoods |
| **PK / PvP** | `application/pk`, `handlers/pk` (7) | Done — `PVPStartClient` with APVP gating, distance check, pk room flow, cross-PK |
| **Skill** | `application/skill`, `handlers/combat/life_skill.go` | Done — normal + life skills (PlantDex sync, level inference) |
| **Social** | `application/social`, `handlers/social` (10) | Done — relationships, blacklist, teacher-student, brotherhood, friend search |
| **Chat** | `handlers/chat` (6) | Done — say, whisper, p2p, GM channel, panel, headline, link formatter for EQ/IT anchors |
| **Marriage** | `application/marriage`, `handlers/marriage` (6) | Partial → see below (DB propose/accept now wired; no scene ceremony) |
| **Magic Crystal** | `application/magiccrystal`, `handlers/magiccrystal` (5) | Done — 16 slots, catalog-driven Activate/LevelUp/AddPower/Recovery costs + `magiccystalrec/pre/limit` consumption + stat-bonus aggregation (see `docs/memory/magic-crystal.md`) |
| **Star (zodiac upgrade)** | `application/star`, `handlers/star` (6 RPCs) | Done — `beginStarLvUp`, `finishStarLvUp`, `cancelStarLvUp`, `speedUpStarLvUp` (item-consume + instant finish), `addStarAddition` (Bernoulli roll, silver cost, server-push `onAddStarAddition`+`onUPP`), `pmStarExchage` (speed-item exchange); `StarPnt` currency 240; stat-bonus aggregation in `statfeature.applyStarsBonus`; see `docs/memory/star-system.md` |
| **Star Instance (Tinh Giới Thập Nhị Cung)** | `application/starinstance`, `handlers/starinstance` (3 RPCs) | Done — 12×12 PvE boss-fight grid; `getWarMap`, `clickWarMap`, `addWarMapTime`; 5 free daily attempts + gold top-up, lifetime best scores, party-aware attempt deduction, `starPnt` award on win; reuses `player.character_feature_states` JSONB (no new migration); see `docs/memory/star-instance-system.md` |
| **Heiyaoshi (constellation panel)** | `application/heiyaoshi` (5 files), `handlers/heiyaoshi` (4 RPCs) | Done — `initHeiyaoshiPanelData`, `lightHeiyaoshiPoint`, `activateHeiyaoshiPoint`, `resetHeiyaoshi`; catalog-driven constellation points, stat-feature integration |
| **Admin dashboard** | `internal/infrastructure/adminhttp/` (14 player_action files) | Done — sessions API, send-item, get_inventory, get_pets, update/delete pet, set_attributes/currency/resources/life_skills/progression, kick, transport, set_gm_level, dress panel |
| **Daily Sign-In** | `application/dailysignin`, `handlers/dailysignin` | Done — initData, doSignin, getAward, retroactive, upActCrit, consumeLimit push |
| **Auth password hardening (F1, F1.5)** | `domain/auth/account.go`, `application/auth/service.go` | Done — `subtle.ConstantTimeCompare` on primary + secondary password; legacy MD5 rows rehashed to bcrypt(MD5) on first successful login |
| **Database / cache** | postgres repositories (~30), Supabase migrations (24+: includes `schedule_boss_schema`, `scheduleboss_functions`, four `batchN_*_functions`, `runtime_config_tables`, `boss_loot_schema/_functions/_lookup_with_tier`, `creature_loot_qty_range`, `boss_loot_grant_service_role`), Redis 3-tier, write-behind contract on `Cached*Repository.Update` | Done — character table split (8 sub-tables), DB-function workflow now project-wide (rule codified in CLAUDE.md), write-behind quest repo |
| **Resource hash tooling** | `cmd/scripts/restore_resources`, `cmd/scripts/crawl-res` | Done — 6698/9673 hashed assets restored |
| **Monitoring** | Grafana, Prometheus, exporters, Go runtime metrics | Done |
| **Group/role guarantees** | `gmLevel >= 5` chat gate, `isGOSU` privilege flag absent (clean) | Done |

---

## 🟡 Partial — code exists but the feature is incomplete

| Area | Specifically what's missing | Where |
|---|---|---|
| **Marriage (ceremony)** | Propose/accept persists `MarriageRecord` via `marriage_repository`; couple rank shipped. Gap: no in-scene wedding ceremony, no ring-tier upgrade flow, no intimacy gain hooks | `application/marriage/service.go`, no scene ceremony |
| ~~**Magic Crystal (economy)**~~ | ✅ Resolved 2026-05-07 — 16-slot catalog, real cost validation, real `magiccystalrec/pre/limit` consumption + refund, stat-bonus aggregation | `application/magiccrystal/service.go`, `application/magiccrystal/catalog.go`, `application/statfeature/magic_crystal.go` |
| **Tutor / student NPC flow** | Repository now handles `RelationshipTypeTutor` correctly. Gap: `npc_func_other.go:389` `handleNpcTutor` still returns `nil, nil` | `handlers/npc/npc_func_other.go:388-393` |
| ~~**Star progression — final 2 RPCs**~~ | ✅ Resolved 2026-05-12 — all 6 star RPCs now implemented; `speedUpStarLvUp`, `addStarAddition`, `pmStarExchage` shipped in `304cb238` alongside new `starinstance` package | `handlers/star/`, `handlers/starinstance/` |
| **Stat-feature foundation** | `Stone Seal`, `PRS / Pet Real Soul`, `Medal`, `Monster Heart` listed as "state-ready" but no client-facing flow. (`Active Pet`, `Contract Pet` catalogued but have no client RPCs — internal-only.) `war_sprite` shipped 2026-05-11; `magic_crystal` + `heiyaoshi` + `stars` already shipped. | `data.data_tbl_stat_feature` catalog |
| **Achievement claim rewards** | Side rewards still unstructured (free-text `desc`); only title-style rewards (`is_award==2`) auto-grant | `application/achievement/service.go` |
| **Quest accept-time handoff** | Only 3 hand-off allowlist entries (quest 160→item 335, quest 162→item 515, quest 164→item 517); broader allowlist needed | `handlers/quest/lifecycle.go:19-23` |
| **Pet guard currency** | `petGuardOut`/`petGuardIn` currency fields mapped on `Character`; placement works; `UpgradePetGuardSid` accepts gold only — token-based path (`PetGuardCostTypeToken`) returns `ErrInvalidInput` | `application/pet/pet_guard.go:145-149` |
| **Pet bag summon (524)** | Contract-pet path is wired (`ContractPets`/`ContractPetsWithQuality` used by box/award/cre_book effect handlers). Gap: type **524** *Phong Ấn / Sách Hợp Đồng Thú* still routed through `phase4Stubs` | `application/item/service.go:150-169` (524) |
| **Item effects (type stubs)** | 15 item types return "chưa được hỗ trợ": **510** MW repair, **511** MW skill reset, **514** MW trans, **515** fishing tool, **517** temp bag, **518** wing enhance, **519** MW prop reset, **521** fairy skill item, **522** Vòng 8, **523** sublime, **524** restraint, **525** custom, **527** qiling store, **551** star add, **552** star speed | `application/item/service.go:150-169`, `effect_stub.go` |
| **Send Combine purchase state** | `sendCombineBuy` map in handler is in-memory; resets on process restart | `handlers/activity/handler.go:59`, `send_combine_buy.go` |
| **Admin domain coverage** | `chivalry`, `reputation`, `move_points`, `max_move_points`, `activity_points`, `max_activity_points`, `vigor`, `max_vigor` exist in `character_table_split.sql` but unmapped in `Character` struct (note: `awaken_*`, `soul_*`, `pet_guard_*`, `apt_*` are now mapped) | `domain/character/character.go` |
| **Quest reward equipment shuffle** | Done; but `template-pool prop shuffle` only on quest rewards + newMake; broader hooks pending | |
| **dispatcher.go quietMethods (active dev)** | 18 methods still verbose: `gdc`, `getCharLeaderClient`, `battleUpdateCmd`, 8 dailysignin methods (`initDailySignInActData`, `initDailySignInActConsumeLimit`, `dailySignInActDoSignin`, `dailySignInActGetAward`, `dailySignInActRetroactive`, `dailySignInUpActCrit`, `getSignInData`, `signinNow`), `getDailyActAward`; plus 6 new star/starinstance RPCs (`speedUpStarLvUp`, `addStarAddition`, `pmStarExchage`, `getWarMap`, `clickWarMap`, `addWarMapTime`) — add to quietMethods after user QA confirms | `infrastructure/rtmp/dispatcher.go` |

---

## 🔴 Not started — client expects, server has nothing or only silent no-ops

### Stubbed RPCs in `handlers/stub/handler.go` (return `nil, nil`)

```text
getRepeatSysMsg   getHeadline       closeAuction      getCharStateClient
fixFlyState       addMail           getMail           auctionSearch
submitAddict      callGm            shopClosePanel    getLimitTimeShop
product           uc                gtg               ex
gg                getGuildInfo      getGuildList      getRankList
getDailyOnlineAct getActivityInfo   inInstanceMap     onlineReport
```

### Entire feature areas the client expects but server has nothing for

| Feature | Client RPCs (sample) | Status |
|---|---|---|
| **Auction house** | `auctionSearch`, `addAuction`, `addAuctionMoreByPM`, `cancelAuction`, `closeAuction`, `auctionBid`, `auctionBidMax`, `recieveGoods` | Stubbed |
| **Mail system** | `addMail`, `getMail`, `delMail`, `delMails`, `takeMail`, `showMailP`, `closeMail` | Stubbed |
| **GM call / customer support** | `callGm`, `chatGM` (chat side exists, GM side stubbed) | Stubbed |
| **Anti-addiction** | `submitAddict`, `setAddictFlagFromClient`, `getAddictQuestion` | Stubbed |
| **Rank lists** | `getRankList`, `getGuildList`, `getRankList`, `getGuildWarRank`, `crossContentionLookBattleInfo` | Stubbed |
| **World boss** | `wbAutoBattle`, `wbStrongBattle`, `wbLeaveMap`, `canEnterWbMap`, `takeWbAward`, `wbReliveNow`, `wbBattleCheck` | Not registered |
| **Bloody battle** | `enterBloodyBattle`, `bbGoldRelive`, `bbNormalRelive`, `bbLeaveScene`, `bbTransToSafe`, `getBloodyBattleInfo`, `getBBPersonalScore` | Not registered |
| **Cross-server contention** | `crossContentionFight`, `crossContentionGetScoreAward`, etc. (~12 RPCs) | Not registered |
| **Cross-PK / team-PK** | `teamCrossPKEnroll`, `teamCrossPKBetOne`, `teamCrossPKMobai`, … (~10 RPCs) | Not registered |
| **MCZD (Monster Challenge Zone)** | `startFightMCZD`, `getMCZDConf`, `getMCZDData`, `MCZDAddMoreTime`, `replayMCZDFight` | Not registered |
| **Rune system** | `runeSet`, `runeRemove`, `runeMove`, `runeResolve`, `runeUpLvl`, `exchangeRune`, `arrangeRuneBag`, `getRuneBagData` | Not registered |
| **Talent stone** | `fillTalentStone`, `takeOffTalentStone`, `upTalentStone`, `breakTalentStone`, `upTalentSlotLv`, `initTalentPanelData`, `arrangeTalentBag`, `resetTalentSlot`, `moveStoneBagToBag` | Not registered |
| **Stone seal** | `stoneSealGetData`, `stoneSealSetStone`, `stoneSealRemoveStone`, `stoneSealBore`, `stoneSealSwapStone`, `stoneSealSuccinct` | Not registered |
| **Medal** | `arrangeMedalBag`, `breakMedal`, `upMedal`, `moveMedal`, `levelUpEMedal`, `levelUpEMedalByGold` | Not registered |
| **Awakening / soul tree / magic array** | `awakening`, `reduceAwakenPoint`, `addAwakenPoint`, `addSoulTreeLvl`, `getMagicArrayData` | Not registered (state-ready in stat-feature catalog) |
| **Soul training** | `preySoul`, `putSoulToBag`, `moveSoul`, `exchangeSoul`, `soulLevelUp`, `trainSoul`, `lockSoul` | Not registered |
| **PRS chip** | `swapPRSChip`, `swapPRSChipTimes`, `movePRSChip`, `exchangePRSChip`, `freePRSCollect`, `goldPRSCollect` | Not registered |
| **Star progression** | `beginStarLvUp`, `cancelStarLvUp`, `finishStarLvUp`, `speedUpStarLvUp`, `addStarAddition`, `pmStarExchage` shipped; `getWarMap`, `clickWarMap`, `addWarMapTime` (star instance) also done | DONE — see `handlers/star/`, `handlers/starinstance/` |
| **Wing system** | `addWingFeather`, `addWingHole`, `addWingStar`, `newWingAdvanced`, `wingSeniorJoin`, `wingJoin`, `changeWingColor`, `changeWingBind`, `changeWingPrefix`, `changeWingRes` | Not registered (item type 518 also stubbed) |
| **Mount system** | `beginMounting`, `checkHaveMount` | Not registered (only `initMountTimer` seeded with empty data) |
| **Decoration / housing** | `initDecoratePanel`, `activeDecoShow`, `addDecoHoleLevel`, `addDecoHoleLevelTenTimes` | Not registered |
| **Maze dungeon** | `mazeConfirm`, `mazeLeave`, `mazeDrop`, `mazeSkip`, `mazeRecover`, `getMazeData`, `enterMaze`, `mazeBuyRecoverNum`, `mazeBuySkipNum` | Not registered |
| **Trials dungeon** | `trialsStart`, `trialsOut`, `trialsPanelInit`, `trialsAwardTake`, `trialsTimerAward`, `trialsFirstKillAwardTake` | Not registered (compat starter only) |
| **Auto-task / sweep** | `autoTaskStart`, `autoTaskCancel`, `autoTaskComplete`, `autoTaskSweepCancel`, `taskSweepSure`, `taskFinishByGold` | Not registered |
| **Lottery / lucky draw** | `lotteryByClient`, `lottoBagSort`, `getLotteryData`, `luckDrawByClient`, `getLuckDrawData`, … | Not registered |
| **Daily sign in** | `dailySignInActDoSignin`, `dailySignInActGetAward`, `dailySignInActRetroactive`, `signinNow`, `getSignInData` | DONE — see `handlers/dailysignin/` |
| **Triple Town minigame** | `tripleTownEnter`, `tripleTownChangeTurn`, `tripleTownTakeAward`, `tripleTownSyncTrunInfo`, `tripleSyncRankList` | Not registered |
| **Hide-and-seek / two-same / magic-power / speed minigames** | `hideAndSeek`, `TwoSame`, `magicPower`, `speed` | Not registered |
| **Summer games** | `summerGameDiabetes`, `summerGameHorseRace`, `summerGameMonopoly`, `summerGameWasteland` | Not registered |
| **DOTA mode** | `dotaPlayerVSNPC`, `dotaGotoMap`, `dotaGetLossAward`, `dotaGetPanelData`, `dotaGetRankAward`, `dotaGetWinAward` | Not registered |
| **Secret treasure hunt** | `canEnterTreasureHunt`, `SecretTreasureHuntGo`, `SecretTreasureHuntGoXY`, `autoPlaySecretTreasureHunt`, `STHForHelp`, `setSTHIfCheck`, `autoSecretTeasureHuntComplete` (note typo) | Not registered |
| **Mystery treasure** | `makeMysTre`, `mysTreObjResolve` | Not registered |
| **Find back / recover companions** | `findBackXuanShangFree`, `findBackXuanShangByBanner`, `findBackXueYuan`, `findBackXiuXing`, `findBackPanJun`, `findBackFeiMo`, `findBackChongWu` | Not registered |
| **PVP rooms** | `createPVPRoom`, `initPVPRoom`, `leavePVPRoom`, `addPVPGroup`, `leftPVPGroup`, `PVPKickByLeader`, `updatePVPGroupLimit`, `updatePVPGroupPass`, `readyOrStartPVP`, `assassinate` | Partial — `pkInvite/Resp/Action/Leave/Ready/Surrender` exist, but room mgmt RPCs missing |
| **Special PvP** | `replayMCZDFight`, `crossPKLookReplay`, `crossPKMobai`, `crossPKMobaiGetScore`, `crossPKTransport` | Not registered |
| **Verification / CAPTCHA** | `verifyAuthentication` | Not registered |
| **VIP succinct** | `succinctMWByVip`, `onSureSuccinctMW` | succinctMW done, succinctMWByVip not |
| **Recipe transforms** | `transformRecipe`, `transformAllRecipe`, `freeExtractRecipe`, `goldExtractRecipe`, `ssdExtractRecipe`, `tenExtractRecipe`, `largessdExtractRecipe`, `exchangeRecipe`, `lookFormula` | Likely partial in dress system — needs verification |
| **Building / guild war** | `clickBuild`, `execBuildFunc`, `getGuildWarRank`, `onShowGwRegList`, `onUpdateGWScore` | Not registered |
| **Cooking / medicine** | `newCook`, `newMedicine` (separate from `newMake`) | Not registered |
| **Misc** | `XCDSMoveBox`, `XCDSRefresh`, `XCDSStartNewRound`, `XCDSOpenShop`, `XCDSGetAward` (only `XCDSGetRank` is registered) | Not registered |

### Security work outstanding (per `docs/research/2026-05-02_*` and `CLAUDE.md` Security Rules)

| Finding | State | Code reference |
|---|---|---|
| **F1** Constant-time password compare | FIXED ✅ — `subtle.ConstantTimeCompare` on primary + secondary | `domain/auth/account.go:66,74` |
| **F1.5** Bcrypt rehash on legacy MD5 success | FIXED ✅ — rehash branch added in `auth.Service.Login` | `application/auth/service.go:163-179` |
| **F4** Default secondary password (`MD5("123456")`) | STILL PRESENT — constant + assignment unchanged | `domain/auth/account.go:16,48` |
| **F7** Login lockout (5/15min, 30min ban) | NOT IMPLEMENTED — 0 hits for `lockout|RecordFailure|FailedLogin` | n/a |
| **F7** Session token table + HMAC | NOT IMPLEMENTED — 0 hits for `session_token` | n/a |
| **F7** Per-session login nonce | NOT IMPLEMENTED | n/a |
| **F6** `isGOSU` privilege flag | CLEAN ✅ — 0 matches in `internal/` | n/a |
| Secondary password helper | EXISTS but not constant-time | `internal/presentation/rtmp/utils/secondary_password.go` |
| Audit channel for GM commands / failed auth | PARTIAL — admin player-action logs old/new but no failed-auth audit row | `adminhttp/player_action_ops.go` |
| SQL safety on stub-when-replaced | PENDING — `auctionSearch`, `addMail`, `addAuction`, `auctionBid`, `findStudent`, `findTeacher`, `addRelationByName`, `addGuild`, `changeGuildName`, `updateGuildNotice`, `wisper`, `chatGM`, `callGm` all need parameterized queries + hostile-input regression tests in the same PR when implemented |

---

## Recently shipped (last 30 commits, in order)

`111ccbea` **Schedule-boss seeder (multi-source)** — `cmd/seed-schedule-bosses` now emits 150 rows from three sources: `activity.xml` (48 ground), `data.data_tbl_npc.layer=3 AND type=10` (23 flying, `pos_map_id<>200` to drop virtual encounter maps), and `BossDailyConfigs ⨝ data_tbl_npc` (79 daily_only; `tier='mythic'` when `IsSuper=1`, `daily_boss_id=nid`). Documented in `docs/memory/schedule-boss.md`. · `a2eb32d9` **Schedule-boss structure refactor** · `1b59a366` admin-dashboard TS CSS/SASS module declarations · `a0b01101` **Boss-loot admin UI** — pages/services/APIs for boss-loot, loot, item-options, lines + reward distribution policies (`docs/memory/boss-loot.md`) · `0f13d530` connection error → `Failed` code · `0f36dfb6`/`7c224af4`/`217b53ed` structure refactors · `16099ad9` wire-contract trace for client login flow (`docs/research/2026-05-14_03_CLIENT_LOGIN_FLOW_RESEARCH.md`) · `20397dd5` **RTMP infra + DB config refactor** — drops `infrastructure/grpc/lineserver_*`, `application/lineserver`, `domain/lineserver`, `persistence/memory/lineserver_repository`; introduces `db_line_provider`; runtime-config store under `infrastructure/config/store` · `303af24e` **CLAUDE.md DB-function patterns** — codified schema-qualified function workflow + `returns setof` / `returns boolean` / `jsonb_to_recordset` / `p_table::regclass` recipes · `486bf102` **Postgres-function repository migration (batches 1–4)** — achievement / activity / buff / character / farm / gamedata / guild / item / magic-estate / npc / pet / quest / relationship / scene-item / skill / title now route through schema-qualified PG functions · `86c83ccd` **Schedule boss respawn system** — domain + scheduler + bootstrap + Postgres repos + RTMP payload broadcast; ground/flying cooldown formulas · `738c45ea` world-boss + daily-entry mapping research and design doc · `f8530469` `Final*` attribute sync + tests · `7fbdd72b` `NormalizeAttributePoints` + character progression logic · `304cb238` **Zodiac star upgrade system + Star Instance** — `speedUpStarLvUp` (item-consume + instant finish), `addStarAddition` (Bernoulli probability, silver cost, `onAddStarAddition` push), `pmStarExchage` (speed-item exchange); new `starinstance` package (`getWarMap`, `clickWarMap`, `addWarMapTime`) — 12×12 PvE boss-fight grid, `starPnt` currency 240, party-aware, reuses JSONB feature state; `BattleTypeStarInstance=5` in combat; stat-bonus aggregation (`applyStarsBonus`); 11 unit tests in starinstance · `2823cfe7` **VIP shop refactor** — Postgres-backed rotation/discount/refresh, gold-only currency, comprehensive tests, agent-instruction consolidation · `6d28774a` **Daily Activity Panel** (`DailyActPanel` — 4 RPCs + `updateDiaryData` push, `player.character_daily_act` table) + daily sign-in lucky-tier / crit-reset fixes · `73bdccb2` **War Sprite system** (`warSprite` + `battleSprite` 16-slot stat-feature panel, 6 RPCs, `updateWSPPanel` push) + **admin activity broadcast** (`POST /api/admin/activities/broadcast`) · `ff62a36c` currency↔feature mapping reference doc · `a7dd548f` state-report refresh · `9e3bd6a8` Heiyaoshi constellation panel system (4 RPCs) · `097de367` build runtime desktop/mobile base on air-sdk · `7b3d0a01` magic crystal, star subsystem, currency overhaul, partial-feature fixes · `b314e8cc` daily sign-in initial · `c6aad32e` Pet system + UseItem refactor + **password hardening (F1, F1.5)** + daily sign-in · `b94b2ae6` PVP gating + magic weapon + quest + combat encounters · `bcdb5469` client-side `PVPStartClient` gating · `d9063b59` MW + quest improvements + combat encounter refactor · `0c5d6878` PVP distance check & out-of-range feedback · `25219916` character-name-by-id + social notifications · `8b4133d9` chat panel fallback names · `a89acb22` admin server init + TransportPlayer · `bc0e85dd` (squash) Nginx caching, ngrok, RTMP edge proxy, item handling, achievement, char creation/progression, bag/bank routing, guild book/transport, skill+combat+group, boss daily · `06f4bdc7` Phase 4 useItem item-effect registry origin · `44103dfa` Trồng Trọt as life skill · `73dba6f8` VIP shop with PM · plus the cache write-behind fix from plan `2026-04-27_1`.

Security progress: F1 + F1.5 shipped in `c6aad32e`. F4 (default secondary password) and F7 (lockout / session token / nonce) still outstanding.

---

## Bottom line

**~43 feature areas fully implemented** (the entire core MMO loop: auth → scene → combat → inventory → equipment → quest → pet → magic weapon → shop/VIP/PM → group → guild → trade → admin dashboard → daily sign-in → heiyaoshi constellation panel → war sprite panel → daily activity panel → admin activity broadcast → DB-backed VIP shop → zodiac star upgrade (all 6 RPCs) → star instance PvE grid → **schedule-boss respawn registry → boss-loot tables + admin UI → runtime config store + admin UI → DB-backed line server → character/stats refactor → permille combat resolution → project-wide Postgres-function repos**, plus F1/F1.5 password hardening). The server can run a complete play session. Handler packages: **33 total**; application packages: **~38 total** (scheduleboss + bossloot added; lineserver removed); **~525 unique RPCs registered**, 260+ .go handler files.

**~11 feature areas partial** — marriage ceremony, NPC tutor flow, achievement side rewards, several stat-feature systems left at "state-ready" (`Stone Seal`, `PRS`, `Medal`, `Monster Heart`), pet-guard token currency, type-524 contract pet box, send-combine persistence, admin character-domain gaps (8 unmapped fields), quest accept-time allowlist, daily-act diary wiring (only task 29 hooked so far; tasks 1–28, 30 still unwired by their owning features).

**~28 feature areas not started** — auction, mail, GM call, world boss, bloody battle, cross-server contention/team-PK, MCZD, runes, talent stones, stone seal, medal, awakening, soul training, wing system, mount, decoration, maze dungeon, trials, auto-task, lottery/lucky-draw, triple town, summer games, DOTA, treasure hunt, find-back, PVP-room mgmt, building, cooking/medicine, plus the remaining P0/P1 security hardening (F4 default secondary password, F7 lockout + session tokens).

**Priority queue per security rules:** any handler that replaces an `auctionSearch`/`addMail`/`addAuction`/`auctionBid`/`findStudent`/`findTeacher`/`addRelationByName`/`addGuild`/`changeGuildName`/`updateGuildNotice`/`wisper`/`chatGM`/`callGm` stub MUST land with parameterized queries + the SQLi sentinel regression test pack in the same PR.
