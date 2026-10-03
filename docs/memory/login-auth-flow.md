# Login & Auth Flow

## Server Deployment Modes

Three deployment modes configured via `MCGAME_GATEWAY_MODE`: **monolith** (single server with all features, default for local dev), **main** (registry + auth gateway with gRPC), **line** (game server for a single channel, connects to main via gRPC heartbeat). Monolith mode handles login+gameplay on `tcn/` app (also supports `master/test/`). Flow: RTMP Connect -> auto-send onLineList -> getLineInfo RPC -> onCharList callback -> chooseCharactor RPC -> onEnterGame/onInitSlot/onInitSkill/onInitPet/onInitQuest callbacks -> sceneLogin/createNpcs/createChars RPCs -> game session active.

## Production Design (Full)

Two server connections. Global Server (`rtmpe://host:port/tcn/`) for auth and line list with "G" auth type. Game Server (`rtmpe://host:port/scene/`) for gameplay with "L" auth type.

All Auth Types: "L"=Line login, "G"=Global login, "F"=Force login, "LBS"=Leave Battle Server, "EBS"=Enter Battle Server, "CPK"=Cross-server PK.

## Connection Handling

`OnConnect` stores AppName, TCUrl, Protocol. For `tcn` or `master/test/` apps, auto-sends `onLineList` callback after 500ms delay. `onLineList` params: version string (must match client `Version.VERSION`), info object with `lastLogInfo`, `loginTimes`, `forceRefresh`.

Global Connection Args (6 fields): authType ("G"/"F"), user, pass (MD5), time, by_session ("false"/"sdo"/etc.), checksum (MD5 of msg_button+msg_chanel).

Game Server Connection Args (6 fields): authType ("L"), user, pass (MD5), time, by_session, lineId.

Line status constants: ON=10, OFF=20, FULL=30, UNNONE=40.

## Character List & Selection

Client callback name: `onIcl` (not `onCharList`). Discovered by decompressing SWF (`CWS -> FWS` via Python zlib). `CallBack.as` (scene server callbacks) expects `onIcl`. `runCharListRetryLoop()` retries `onIcl` every 500ms up to 20 times.

onCharList response: charList array with fields `cid`, `name`, `level`, `classId`, `deleted`, `deleteTime`, `createTime`, `imgCode`, `portraitCode`. accountInfo with `acountLv` (VIP, typo intentional), `maxCharSlots` (default 6), `gold`.

Character DTO Field Name Corrections: Server `cid` -> client `id`, `level` -> `exp` (client converts via `expToLevel()`), `deleteTime` -> `delTime`, `imgCode` -> `iconCode`. Added `gender` field.

## chooseCharactor Payload

Rate limited 2100ms. Triggers server to load full character data. Sends sequence: onEnterGame (extensive player data DTO with ~60+ fields), then onInitSlot, onInitSkill, onInitPet, onInitQuest, onMapData.

onEnterGame playerData fields: id, name, guid, level, exp, expSkill, classId, imgCode, portraitCode, dressInfo, posX/posY/posMapId/dir, attStrength/Agility/Stamina/Intelligence/Energy/LastPoint, propHit/Dodge/Critical/Speed/Counter/Combo/Defy/ReduceHurt1/2, maxHp/currentHp/maxMp/currentMp/maxSp/currentSp, money/gold/goldBind/moneyBind, bp/reputation/achPnt/vigor/maxVigor/actpoint/maxActpoint, bagSlotNum/bankSlotNum, petMaxNum/activePetObject, guild{id,name,rank}, createTime/totalOnline, isHanged/mapSafe.

Settings object keys: am (music), he (hide effects), hm (hide models), sid1/sid2 (skill slots).

Pet guard login state belongs here too. `onChooseCharactor` should include:

- `cData.petguardout` and `cData.petguardin` as the two guard-upgrade currencies/items
- top-level `petGuardData` with `{lvData, petData}`

Current server support persists `petGuardData` and returns `petguardout` / `petguardin` as explicit zeroes until their currency flow is implemented.

## Force Login Auto-Kick

New login for the same account wins immediately, existing sessions are force-disconnected.

Local flow: `handleGlobalConnect` authenticates user -> `OnlineChecker.ForceDisconnectAccount(accountID, excludeConnID)` scans and closes matching sessions.

Cross-line flow: Main server checks online-account tracking from line-server heartbeats. Enqueues per-line pending force-disconnect commands. On heartbeat response, pending account IDs are returned in `force_disconnect_account_ids`. Line server invokes `rtmpServer.ForceDisconnectAccount(accountID, 0)`. Eventually consistent within heartbeat interval.

## Character Stats Payload Fix

Fixed `onChooseCharactor.cProp` to carry full stat shape. Added `BuildViewPropertiesFromBase(char)` in `internal/application/character/service.go` returning normalized map with `final*` fields from derived stats, `attLastPoint`/`lastPoint` from `AttrPoints`, defaults `spirituality` to `"0"`, includes compatibility fields (`ee`, `en`, `ef`).

## New Character Intro Dialog

`PANEL_GAMEINTRO` content (activity list) is embedded in the Flash client as `xmlActivity` inside `GameIntroPanel.as`. The server's role is: `chooseCharactor -> onChooseCharactor` triggers `PANEL_GAMEINTRO.visible = true` and `autoClick(8)`. `showDailyAct` controls `DAILY_ACTIVITY` auto-open for new characters. Implemented `getTodayAward`, `getCurrentFeast`, `getDailyPanelAwardState` with safe starter payloads.

New characters are created through `application/character.Service.Create`, which explicitly preserves starter `bagSlotNum = 1` and `bankSlotNum = 1` before persistence. That gives one regular bag page and one bank page at character creation, with 30 derived slots each.

## onChooseCharactor questLog and qn (M3, 2026-05-29)

`cData["questLog"]` must be set at login to the pipe-delimited completed-quest id string `|id1|id2|...|`. Without it every completed quest re-appears available (Flash `Player.canTakeQuest` reads `questLog.indexOf("|"+id+"|")`). Built by `questService.BuildQuestLogString(ctx, charID)` (`internal/application/quest/service.go`) — calls `questRepo.GetCompletedQuestIDs` internally.

Top-level `qn` is an **int** scalar (count of active quests — `len(activeQuests)`). It is NOT the `questDTOs` slice; Flash `Player.qn:int` cannot coerce an array. Active quest DTOs are not in `onChooseCharactor` at all; they are fetched fresh by `initQuestManager` (quest/manager.go) on demand. OQ1: exact semantics of `qn` (count vs flag vs slot-count) is unconfirmed — `len(activeQuests)` is a defensible default.

## Auth Handler RPCs

`onConnectAuth`, `sendCharList` (alias `icl`), `chooseCharactor`, `getLineInfo`, `showChaInfo`, `newChar`, `backToCharSelect`, `us`, `uif`, `getTodayOnlineTime`, `setBp`, `changeLine`, `saveGuideLog`, `setDeletePass`.

### Dual-Device Login (G vs F) & forceLogin

Flash global connect payload: `["G"|"F", user, MD5(pass), time, by_session, MD5(msg_button+msg_chanel)]` (`LoginCanvas.as:1357` normal, `LoginCanvas.as:657` force). Only `param[0]` distinguishes the two.

Server contract (`internal/infrastructure/rtmp/connection_handler.go` `handleGlobalConnect`):

- `"G"` (normal): if the account is online locally (`OnlineChecker.IsAccountOnline`) or on any remote line server (`LineServerOnlineChecker.IsAccountOnlineOnLineServers`), first send an `onStatus` callback `{level: "status", code: "NetConnection.Connect.Closed", application: "ERR_LOGINED"}` so `RemoteObj.nsHandler` sets `_lastCode = ERR_LOGINED` and calls `CallBackGlobal.close()` — the client shows the "already logged in" alert and the force-login button (`CallBackGlobal.as:313`, `_LoginCanvas_BasicGlowButton2/3`). Then return `ConnectionCloseError{Code: ErrLogined}` so the handshake completes with a Success-but-closed result and the socket is dropped. The existing session is kept intact.
- `"F"` (force): disconnect every existing local session for the account (`ForceDisconnectAccount`) and request remote line servers to do the same (`RequestForceDisconnectOnLineServers`). Then proceed with login. Client sends `"F"` when the user clicks the force-login button in `LoginCanvas.forceLoginClick()` and auto-retries with `"G"` after 19.8 s (`loginLater`, `LoginCanvas.as:1171`).
- `"C"` (change line): duplicate handling is skipped entirely.

### Kick returns to login screen

Scene-connection evictions send `onKickChar(n)` to set the kickCode, then close the socket after a delay. The socket close auto-triggers `CallBack.close()` via `RemoteObj.nsHandler` on `NetConnection.Connect.Closed`, which reads `kickCode` and fires the appropriate Alert bound to `onLogout`:

- `onKickChar(n)` (`CallBack.as:3072`) only writes `_core.remote.kickCode`. The alert + `_core.logout()` fires later when the socket close reaches the client, `RemoteObj.nsHandler` fires `NetConnection.Connect.Closed`, and `CallBack.close()` (`CallBack.as:9257-9294`) reads `kickCode` in the `Closed` branch.
- **Do not** also send `onKick` (`CallBack.as:7013`). It shows a duplicate, racing Alert on an independent path — the `close()` callback flow is sufficient on its own and carries the correct kickCode-based message.
- `appCode` is **not** consulted on the `Closed` branch of `CallBack.close()` — only `kickCode` is. Sending `onStatus` with an application field to a scene NC is a no-op for this path. appCode only matters in the `Rejected` branch, which `nsHandler` does not auto-invoke (so the server would have to call the client's `close` method directly via RPC — not currently done for scene kicks).

Implementations:

- `Server.ForceDisconnectAccount` (`internal/infrastructure/rtmp/server.go`) — used by the `"F"` login flow and remote line-server force-kick requests. Sends `onKickChar(1)` (`KICKED_BY_OTHER`), then waits 500 ms before closing so the kickCode write lands before TCP FIN.
- Admin GM kick (`internal/infrastructure/adminhttp/player_action_ops.go` `executeKick`) — sends `onRedMsg` (reason) + `onKickChar(2)` (`KICKED_BY_SYSTEM`), then 1 s delay before close.

Client flow once the socket drops: `CallBack.close()` reads `kickCode`, shows the corresponding Alert (`Language.CALLBACK_S[0]` / `[222]` / default `[3]`), and its OK-handler invokes `_core.logout()` which shows `ViewManager.FORE_L_R` (username/password screen) and hides stage/main UI. Not to be confused with `onBackToCharSelect` (keeps connection, stays on char-select) which the server uses only for voluntary returns initiated by the `backToCharSelect` RPC.

Full matrix of close handlers (scene + global): `docs/research/2026-04-18_03_CLIENT_DISCONNECT_CALLBACK_MATRIX.md`.

Full wire-contract trace (login args, success callbacks, all appCodes, notice channels): `docs/research/2026-05-14_03_CLIENT_LOGIN_FLOW_RESEARCH.md`.

References: `docs/research/2026-04-18_02_DUAL_LOGIN_FORCE_LOGIN_RESEARCH.md`, `docs/plans/2026-04-18_03_DUAL_LOGIN_FORCE_LOGIN_PLAN.md`.

## Secondary Password System

Implemented in `internal/presentation/rtmp/utils/secondary_password.go`. Provides password verification and caching utilities for operations requiring additional security confirmation. Defines `secondaryPasswordSender` interface for sending verification prompts to the client.

Auth handler exposes `setDeletePass` RPC for setting/managing the secondary password. Used for character deletion confirmation and sensitive operations.

## onChooseCharactor cData M6 scalars (2026-05-29)

Added `applyM6CDataScalars` in `login_cdata_blobs.go` emitting: `isFlying` (bool, from `appearance.FlyerEquipped`), `t` (string, active title id), `ct`/`cts` (pipe strings, title lists), `fairy` (nil, no domain model yet), `guid` (`"0"`), `ll` (`"0|0"` stub), `last` (ms-epoch string from `char.LastActive`), `brightCode` (`"0"`). `newGrade` changed from int `0` to string `"1"` per live capture.

`TitleDataProvider` interface added to auth `Handler`; wired to `*apptitle.Service` via `authHandler.SetTitleService(titleService)` in `cmd/gameserver/main.go`. Added `GetActiveTitle` delegating method to `apptitle.Service`.

`appearance.Apply` now emits `wp`, `flyerResCode`, `flyerFrontResCode`, `wingResCode`, `mountResCode` UNCONDITIONALLY (`"0"` / `0` when absent) — matches live snapshot which always includes these keys.

Open questions for M6: `fairy` object (no Go domain model — stub `nil`); `ll` exact decode (live `"109|297829205"` — unknown two-field semantics, stub `"0|0"`); `guid` exact meaning (guard-merit counter vs account id — stub `"0"` since no numeric account id in schema); `ct`/`cts` delivery path (also in `onTitleList` callback — both emitted for parity).

## Password Hardening (F1 + F1.5, 2026-05-03)

Constant-time compare: `Account.CheckPassword` legacy MD5 fallback and `Account.CheckSecondaryPassword` both use `crypto/subtle.ConstantTimeCompare` instead of `==`. Bcrypt branch unchanged (bcrypt is already constant-time internally).

Helper: `auth.IsBcryptHash(hash string) bool` — true when the stored hash starts with `$2`. Used both inside `CheckPassword` and by the service layer to decide whether to rehash.

Legacy MD5 → bcrypt rehash: on a successful legacy MD5 login, `auth.Service.Login` calls `rehashLegacyPassword(ctx, account)` which runs `bcrypt.GenerateFromPassword([]byte(account.PasswordHash), bcrypt.DefaultCost)` and persists via `accountRepo.Update`. The Flash client keeps sending `MD5(plaintext)`; after the first post-fix login, the stored value is `bcrypt(MD5(plaintext))` and the bcrypt branch wins on the next login.

Failure handling: bcrypt generation or `accountRepo.Update` errors are logged at warn level (`legacy MD5 rehash failed` / `legacy MD5 rehash persist failed`) but do not block login — the legacy hash already passed the constant-time check, and the next login retries the rehash. Successful rehash logs at info level (`legacy MD5 rehashed to bcrypt`).

Threat model after F1 + F1.5:

- Stolen `accounts` row no longer yields a working credential on its own once the account has logged in once post-fix; replaying the bcrypt hash as the password sends it through `bcrypt.CompareHashAndPassword(storedBcrypt, attemptedBcrypt)` which never matches.
- Timing-attack on the legacy fallback compare is closed.
- Per-session login nonce, login lockout, session-token replacement for "remember me" — still pending (F7).

F4 deferred: the default secondary password (`MD5("123456")` = `e10adc3949ba59abbe56e057f20f883e`) is intentionally retained for now. It is only exploitable through a hijacked session, so its removal is paired with F7 work (lockout / session tokens / audit) in a later pass. The 11 RPC handlers that gate on the secondary password (trade lifecycle, character leveling, magicweapon resolve/trans, shop misc, pet refresh/skill_delete/enhancement, item resolve/bag_manage, npc_click) keep their existing behavior.

PoC files under `cmd/secpoc/` (`f1_legacy_md5`, `f4_default_secondary`) are kept as regression demonstrators. The F1 PoC continues to print `Replay 1: true` because it tests `CheckPassword` against an in-memory leaked row directly and never goes through `auth.Service.Login` where the rehash runs — it shows that a leaked row still works *until* the next real login rewrites the column.

## Scene-Entry Outbound Callbacks (M2, 2026-05-29)

`SceneLogin` now emits the live chain: `onSceneLogin(mapId, copyId)` → `onMountOff(mountOffObj)` → `onClearWbView(true)` → `onCreateCharactor(selfCharObj)`, then `onScenePlayerEntered` to peers only. `onSceneEnter` is kept in `SceneChange`/admin teleport only.

`GetCharacterForClient` (scene/service.go) now emits the full scene-character field set: `exp`, `expRe`, `honor`, `colorCode:"1"`, `posDir`, `isFlying:false`, `doubleFly:false`, `broT:""`, `ct:""`, `decoInfo:{}`, `fairy:nil`, `inGroup:false`, `leagueIcon:nil`, `prsUseId:0`, `showPetId:-1`, `showPetObj:nil`. Also: `wp`/`flyerResCode`/`flyerFrontResCode` are now **strings** (matching live wire — `"2070360000016"`, `"0"`, etc.); `classId`/`gender`/`posX`/`posY`/`posMapId`/`posDir` emitted as strings; `vipT:-1`. `dressResCode` defaults to `-2` (no-dress sentinel, live shows -2). `mountResCode:0` and `wingResCode:0` emitted unconditionally.

`CreateChars` (scene/login.go) now emits a `map[string]interface{}` keyed by `strconv.FormatInt(cid, 10)` instead of a slice. Live `onCreateChars` is a cid-keyed object.

`buildMountOffObject` helper (scene/login.go) builds the onMountOff payload from `playerData` fields: `{cid, wp, ee, ef, en, star, isMountOn:false}`. Reads `wp`/`ee`/`ef`/`en`/`star` from the already-built playerData map.

`sendSceneConnectCallbacks` (auth/login.go) sends `onLogin{id:"0", lv:"0"}` + `updateAccount{email, password}` on scene (non-global) connections at OnConnectAuth boundary. `id:"0"` because our account domain uses UUID (no legacy numeric id).

`sendOnChooseCharactorCallback` (auth/login.go) now sends `onReadCharData(false)` before `onChooseCharactor`, and `initDecoShowTimer({})` + `initPRSShowTimer({})` after `sendLoginStateCallbacks`.

Tests: scene handler tests updated — `wp`/`flyerResCode`/`flyerFrontResCode` assertions changed from `int64` to `string`. New `TestSceneLogin_EmitsSceneLoginCallbackChain` test uses `h.sendCallbackFn` override to verify the 4-callback chain fires in order. SceneLogin now routes through `h.sendCallback(conn, ...)` for testability.

Known gap: `onLogin.id` is `"0"` (no numeric account id in our domain — account is UUID-only). `isFlying` is always `false` (deferred to M6 — no persisted fly state yet).

## onChooseCharactor Wire-Parity Fixes (M1, 2026-05-29)

Top-level payload corrections in `login.go buildOnChooseCharactorPayload`:
- `vipT` changed from `0` to `-1` (both top-level and cData — `-1` means no VIP expiry).
- `jewelOffRate` changed from `0` to `1` (the `sendLoginStateCallbacks` reads this to send `updateJewelOffPrice`; `0` would zero out jewel sell prices).
- `tempSoulData` changed from `nil` to `map[string]interface{}{}` (client iterates with `for in`).
- `submitQuestionEnable` changed from `true` to `false` (live server disables help-submit button).
- Added `ifShowJXHDCircleByASI: false` (JXHD event badge gate; was absent).
- `timeZone` gated behind `defaultServerTimeZone = -25200000` constant (UTC-7).
- `sph` gated behind `defaultServerSpeedHackThreshold = 400` constant (`0` disables anti-cheat validation).

cData corrections:
- Added `posDir` (string, `char.Direction`) alongside existing `dir` int — client uses `posDir` for snapshot position direction.
- Added `attStrength/attAgility/attStamina/attIntelligence/attEnergy/attLastPoint` as strings from char fields — previously only in cProp; cData copy is needed for `_core.player.attX` auto-assignment via `Creature.set data`.
- Added `cl` (string, `char.ClassRank`) — previously cProp-only; `_core.player.cl` was 0, class-rank label was wrong.
- Added `expRe` (string, `char.RebirthExp`) — critical: `Charactor.set data` calls `expReToLevelRe(expRe)` to derive `levelRe`; without it in cData, rebirth level is never set on login.
- Added `expBattle` (string `"0"`) — field exists in live; no domain column yet.
- Added `exPoint` (string, `char.ExPoint`) — accumulated exchange points; was cProp-only.
- Added `chival` (string `"0"`) — reputation field; no column in character domain (creature domain has `Chival int64` but character struct does not); placeholder until modeled.

activePetObject rename:
- `internal/application/statfeature/service.go` line 50: `result["activePetData"]` → `result["activePetObject"]`.
- `internal/application/statfeature/helpers.go` line 53: default key renamed.
- Client (`Player.set data`) copies `activePetObject` to `evolutionPetObject`; wrong key name `activePetData` meant PetHandbook/PetEvolution was always empty.

interfaceData skill-bar gap (OQ9, noted without fix):
- `defaultInterfaceData()` emits `sid1..sid4`/`st1..st4` only; `defaultInterfaceSettings()` in `settings.go` emits `sid1..sid8`/`st1..st8`. Live has `sid1..sid30`/`st1..st30`. Slots 9–30 are not emitted as defaults. Persisted settings from DB fill the gap for returning chars; new chars may miss skill-bar slots 9–30 from defaults. Not changed in M1 to avoid resetting existing bars.

## onChooseCharactor JSON-blob cData Keys (M4, 2026-05-29)

New cData keys added in `login_payload.go` + `login_cdata_blobs.go` (auth handler). Blob serializers live in owning feature packages to keep `login_payload.go` under 400 lines.

### Service serializers added
- `internal/application/magiccrystal/login_snapshot.go`: `Service.LoadLoginJSON(ctx, charID)` → `CrystalsToLoginJSON(crystals, resetTime)` — 16-slot + time map as JSON string.
- `internal/application/star/login_snapshot.go`: `Service.LoadStarFlagJSON(ctx, charID)` → `StarFlagLoginJSON(state)` — `{stars:{}, warMap:{}}` JSON string.
- `internal/application/pet/login_snapshot.go`: `GuardInfoLoginJSON(char)`, `PetTalentInfoLoginJSON()`, `PetPVEDataLoginJSON()`, `PetStoneBagLoginJSON()` — guard JSON string mirrors `petGuardData`, talent/pve/stone return empty stubs.
- `internal/application/statfeature/login_blobs.go`: `BuildLoginBlobs(featureStates, progression)` → `LoginBlobs` struct for medal/soul/prs/stoneseal/rune blobs. `Service.GetCharacterLoginBlobs(ctx, charID)` exposes this as a service method.

### Handler wiring
- `handler.go`: added `magicCrystalService *appmagiccrystal.Service`, `statFeatureService *appstatfeature.Service` fields + setters.
- `login_cdata_blobs.go`: `buildMCrystalInfoJSON`, `buildStarFlagJSON`, `buildLoginBlobs`, `applyM4CDataBlobs` — wires services + stubs.
- `main.go`: added `authHandler.SetMagicCrystalService(magicCrystalService)` + `authHandler.SetStatFeatureService(statFeatureService)` after existing `SetStarService`.

### Keys delivered in cData (live JSON string unless noted)
- `mCrystalInfo` (16 slots + time, backed by magiccrystal service)
- `starFlag` ({stars, warMap}, backed by star service)
- `guardInfo` (JSON string mirror of petGuardData, from char.PetGuardData)
- `petTalentInfo`, `petPVEData`, `petStoneBag` (stubs: `{"tal":{}}`, `{"p":{},...}`, `"[]"`)
- `medalInfo` (full JSON {medalExp, medalBag, petBuff, charBuff, checkFlag}, from FeatureMedal state)
- `medalExp` (scalar, mirrors medalInfo.medalExp)
- `soulBag` (JSON string, open/soulExp/chip/sid/data/soulData/petinfo from CharacterProgression)
- `runeInfo`, `stoneSealInfo`, `prsInfo`, `prsUseId` (backed from FeatureSoul/FeatureStoneSeal/FeaturePRS states; empty defaults when no state)
- `praBuffInfo`, `vipInfo`, `mountInfo`, `mysTreasure` (documented-shape stubs — no backing store; M8 will back them)
- `monsterHeartBag`, `lottoBag` (7-category / empty JSON stubs)
- `safeCBMids` (empty array `[]`)
- `honor`, `spirituality`, `worldCupPoint`, `worldCupGoldPoint` (from char fields)
- `pop`/"0"/"0"/"0" (`pop`/`popDay`/`popWeek`/`popMonth` — `pop` from `char.Pop`, windowed zeros)
- `reputation`, `vigor`, `ti`, `tl`, `tn`, `tp` (stubs: "0"/"100"/"-1"/"0"/"/"0")
- `tkyyhp`, `txkcp` (event counters, 0)
- `totalActpoint`, `totalBp` (stubs "0")
- `guideLog` (JSON string serialized from `char.GuideLog map[int]bool`)
- `exprb` (stub "0", rebirth-cycle exp, no domain field)
- `mountResCode` (0, no mounted state)

### Top-level payload changes
- `tBag`: was `nil`, now 9-key skeleton with `mx.curNum` path (`buildTBagSkeleton()`) — prevents `onAddMXTempDirect` NPE.
- `soulBagData`: was `nil`, now `{data:{}, open:0}` mirroring soulBag top level.
- `soulExp`, `soulChip`: now sourced from `loginBlobs` (from `CharacterProgression`) instead of hardcoded 0.
- `crystalSid`: now sourced from `loginBlobs.CrystalSid` (0 until soulBag sid is persisted).

### explorerMedalInfo removal
- `FeatureExplorerMedal` state key `"explorerMedalInfo"` removed from `BuildCharacterLoginState` output and `defaultCharacterLoginState`. The old `"0|0"` pipe string is replaced by `medalInfo` full JSON from `FeatureMedal`. The `applyExplorerMedalBonus` combat bonus still reads from `FeatureExplorerMedal` state — that is untouched.
- `service_test.go`: removed the `explorerMedalInfo` assertion line (now gone from login state).

### Stubs emitted (documented empty/default shapes, pending M8 backing)
- `petTalentInfo`, `petPVEData`, `petStoneBag` — no domain columns yet
- `praBuffInfo` — prayer-buff system not persisted
- `vipInfo` — VIP membership not persisted
- `mountInfo` — mount state not persisted  
- `mysTreasure` — mystery treasure system not implemented
- `monsterHeartBag` — monster heart bag not backed
- `lottoBag` — lotto bag not backed
- `prsInfo`/`prsUseId` — reads FeaturePRS state (may be populated if statfeature row exists, empty default otherwise)
- `stoneSealInfo` — reads FeatureStoneSeal state (empty default until persisted)
- `runeInfo` — reads FeatureSoul state (misnomer — rune is separate; will need FeatureRune key in M8)
- `pop`/`popDay`/`popWeek`/`popMonth` — `pop` from char.Pop; windowed counters stub "0"
- `reputation`, `honor` from char.Honor (field exists, defaults 0)
- `vigor` hardcoded "100" (no MaxVigor field on character domain)
