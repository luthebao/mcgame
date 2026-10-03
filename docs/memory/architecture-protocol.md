# Architecture & Protocol

## Client-Server Communication

The game is a Flash/AS3 MMO client communicating via RTMP/AMF0. Protocol stack: Transport=TCP, Application=RTMP, Encoding=AMF0, Encryption=RTMPE (optional). Default port 1935.

AMF0 Data Types used: Number (0x00, 64-bit double), Boolean (0x01), String (0x02, UTF-8), Object (0x03, key-value), Null (0x05), Undefined (0x06), Array (0x08, ECMA associative), Strict Array (0x0A, dense).

Core client classes: `Core.as` (singleton game core), `Battle.as` (turn-based battle logic), `BattleServer.as` (cross-server), `Group.as` (party), `GameScene.as` (scene management), `Player.as` (extends Charactor), `Pet.as`, `Npc.as`, `Creature.as`, `RemoteObj.as` (AMF0 RPC wrapper using NetConnection), `RemoteNc.as`, `DataManager.as`, `GameData.as`, `GamePredef.as`.

Networking uses AMF0 encoding (`ObjectEncoding.AMF0`). Connection flow: connect via rtmp(e|te), send auth params `[type, user, pass, time, by_session, server_id, line_id, cid]`. Connection types: `"LBS"` (Leave Battle Server), `"EBS"` (Enter Battle Server), `"CPK"` (Cross-server PK). Client-side rate limiting uses `RPCConfig.RPC_DELAY` and `RPCConfig.RPC_DENY_MAX`.

The Flash client uses null Responders for all battle RPC calls, meaning it never reads RPC return values -- all server-to-client communication must use callbacks.

Server implementation flow: Receive RTMP Chunk -> Decode AMF0 -> Extract Method & Args -> Dispatch to Handler -> Execute Logic -> Encode Response -> Send RTMP Response.

## Server Connection Configuration

Configured in `com/qeedoo/game/predef/GamePredef.as`. Default connection: `rtmpe://localhost:1935/tcn/`. Protocol constants: `SERVER_PROTOCOL_LOGIN = "http://"`, `SERVER_PROTOCAL_LOGIC = "rtmpe://"` (encrypted RTMP), `SERVER_PROTOCAL_LOGIC2 = "rtmpte://"` (encrypted RTMP over TLS). Application names: `tcn` (global), `scene` (scene). Resource server: `http://s.lezi.com/mc/`.

## Channel (Line) Isolation

Each channel/line is a separate game world. Each map within a channel is a room. Players on different channels cannot see each other.

Configuration (runtime-tunable, stored in the `gateway_config` DB table served by `internal/infrastructure/config/store`, not env or YAML): one row per line with fields: id, name, url (`rtmp://127.0.0.1:1935/scene/`), max (1000), auction (bool), guild (bool).

SceneManager data structure: `map[int]map[int]map[uint32]*Connection` (channelID -> mapID -> connections). All methods take `channelID` as first parameter: `AddToScene`, `RemoveFromScene`, `MoveToScene`, `BroadcastToScene`, `GetScenePlayerCount`, `GetConnectionRoom`, `IsConnectionInRoom`.

Connection has `currentChannelID int` field with `SetChannelID(int)` and `GetChannelID() int`. Channel ID is assigned when player selects a line in auth_handler.go.

## Creature Object Hierarchy

Mirrors the Flash client's `com.qeedoo.game.object` class hierarchy. Lives in `internal/domain/creature/`.

Class Hierarchy (Flash AS3 -> Go):

- `Creature.as` -> `creature.Creature`
  - `Charactor.as` -> `creature.Charactor` (spelling preserved from client)
    - `Player.as` -> `creature.Player`
    - `Npc.as` -> `creature.NPC`
    - `Building.as` -> `creature.Building`
  - `Pet.as` -> `creature.Pet`
- `SceneItem.as` -> `creature.SceneItem`

ObjectType constants: TypeAccount=0, TypeCharactor=2, TypeCreature=12, TypeNPC=35, TypePet=39, TypeBuilding=70, TypeSceneItem=49.

FlyingState: OnGround=0, TakingOff=1, InTheAir=2, PreLand=3, Landing=4, DoubleFly=5.

MountState: Off=0, On=1.

NPCType (29 types): Quest=1, Shop=2, Mail=3, Plan=4, Auction=5, Skill=6, Bank=7, Heal=8, Transport=9, Battle=10, ClassQuest=11, Mat=12, Callboard=13, Answer=14, Boss=15, Tutor=16, Guild=17, Build=18, FishPool=21, Plant=22, Herb=23, Gather=24, Walk=25, Synchro=26, Hula=27, Dota=28, TripleTown=29.

CharactorState: Normal=1, Running=2, Shopping=3, Trade=4, Battle=5, LevelUp=6, ChangingMap=7, Make=8, Bank=9, Mail=10, Auction=11, ChaPanel=12, Product=13, Watch=14, Busy=15, HangUp=16, Fishing=26, Harvest=27, Herb=28.

Adapters: `domain/character/creature_adapter.go` converts `Character.ToCreatureModel()` -> `creature.Player`. `domain/npc/creature_adapter.go` converts `NPC.ToCreatureModel()` -> `creature.NPC`.

## RTMPE v6 Protocol & Auth Fixes

Successfully implemented RTMPE v6 with HMAC-SHA256 digest validation (Schema 1), Diffie-Hellman 1024-bit key exchange (RFC 2409 Group 2), RC4 encryption with 1536-byte keystream skip.

Critical fix: Server initialized peer chunk size to 4096, but Flash client uses RTMP default of 128. This caused `0xC3` continuation headers to be interpreted as payload data. Fixed in `pkg/rtmp/chunk_streamer.go` by initializing `peerState` with `DefaultChunkSize (128)`.

Flash client sends connection credentials as an `ECMAArray` (keys "0","1","2",...) not a standard array. Fixed to detect and parse `amf0.ECMAArray`.

Trade lock payloads can also carry `petIds` as `amf0.ECMAArray`, and some clients may include a `length` entry alongside numeric indexes. Trade payload parsing now accepts that shape and orders only numeric keys.

Trade bag synchronization follows callback-level updates, not a full bag refresh. When a player locks a trade, the server should hide offered items with `onSetSlotSid(itemId, -1)`. If the trade stops or fails, those items should be restored with `onSetSlotSid(itemId, originalSid)`. On successful completion, received items can be pushed with `onAddCharactorSlot`.

Pet stat RPCs `getFinalPraDefPet` and `finalPraMagDefPet` are responder-based lookups, mirroring the character stat handlers. They should return `{key, value}` for the currently followed pet and must not emit `onRefreshPetProp`, or the Flash pet panel can enter a callback loop through `detailUpdateView(..., true)`.

Skill-bar RPC failures that surface at `internal/infrastructure/rtmp.(*Connection).OnUnknownCommandMessage` are not necessarily RTMP transport bugs. The function is the dispatch/logging site for custom RPCs, so method-specific `invalid arguments` errors still need to be traced back to the handler contract. Flash UI paths such as `skillSetUserBar` and `skillSetBattle` send slot ids as numeric strings derived from `slot.id.slice(1)`, so auth integer parsers must accept string values there.

Database NULL handling: PostgreSQL scans failed when `email`, `ban_reason`, `last_login` were NULL. Fixed by using pointer variables for nullable columns.

Legacy MD5 password support: Flash client sends MD5-hashed passwords (32-char hex). Enhanced `CheckPassword` to support both bcrypt (detected by prefix) and direct MD5 comparisons.

Connection rejection fix: (1) `ReplyConnect()` didn't handle `Rejected` case, so command name was empty instead of `_error`. (2) Auth ran in a goroutine after `OnConnect` returned success, so `_result` was already sent. (3) `Sched()` was async, so connection closed before error write completed. Fixes: Added `Rejected` to `_error` case, made auth synchronous during `OnConnect` (returns `ConnectionRejectError` on failure), added `SchedAndWait()` and `WriteSync()` methods.

Flash Client Error Codes: ERR_CLASSIFY (classifyAlert), ERR_CLASSIFY2-7 (classifyAlert2-7), ERR_LOGINED/ERR_LOGIN_FAILED/SERVER_NOT_READY/ERR_LOGIN_BANNED/ERR_IP_BAN/IN_CROSS_SERVER (close+alert).
