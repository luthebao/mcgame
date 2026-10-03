# Social Relationships

## Schema

`player.friends` is the storage for all directional player↔player relationships except blocks. As of 2026-05-05 it carries a `type SMALLINT NOT NULL DEFAULT 0` column matching `internal/domain/social.RelationshipType*`:

| type | Constant                       |
|------|--------------------------------|
| 0    | `RelationshipTypeFriend`       |
| 1    | `RelationshipTypeBlack` *(blocks live in `player.blocks`)* |
| 2    | `RelationshipTypeEnemy`        |
| 3    | `RelationshipTypeCouple`       |
| 4    | `RelationshipTypeTutor`        |
| 5    | `RelationshipTypeBrother`      |

Blocks live in `player.blocks` (no type column — always blocks).

`UNIQUE(character_id, friend_id)` is shared across all types: a given pair can hold at most one relationship row regardless of type. Treat type as the *primary* relationship.

Migration: `supabase/migrations/20260505071855_add_relationship_type.sql`. Existing rows backfill to type=0 via the `DEFAULT 0` clause.

## DB functions

- `player.get_friend_relationships(p_character_id)` — typed friends only (filters `type = 0`).
- `player.get_typed_relationships(p_character_id, p_type smallint)` — generic typed lookup; used by the repo for Enemy/Couple/Tutor/Brother.

## Go layer

- `internal/infrastructure/persistence/postgres/relationship_repository.go`
  - `FindByCharacterAndType` now routes Enemy/Couple/Tutor/Brother to `findTypedRelationships`, which calls `get_typed_relationships`.
  - `FindFriends`/`FindBlacklist` unchanged.
- `RelationshipRepository.Create` still only handles `Friend` and `Black`. Inserting typed rows (e.g. tutor pairing) requires a new repo path (and a new SQL function or direct insert with type bound) — that landed as part of the larger handler work, not this track.

## What remains as follow-up

- `handlers/npc/npc_func_other.go:388` `handleNpcTutor` is still a stub. The full tutor request → accept → relationship create flow needs the Create path typed and an application service to mediate.
- No backfill migration is needed because the column defaults to 0 and all pre-existing rows were friends.

## Blacklist → onChooseCharactor "black" wire shape (M7)

Live shape: `[{id:"<rel_id>", name:"<name>", num:"0", otherId:"<other_char_id>", selfId:"<char_id>", type:"2"}]` — all fields are **strings**. The client-facing `type:"2"` is the IM blacklist enum (independent of Go's domain `RelationshipTypeBlack = 1`).

Added `Relationship.ToBlacklistDTO(selfID int64)` to `internal/domain/social/relationship.go` that returns the live string-typed shape.

Added `Service.GetBlacklistForLogin(ctx, charID)` to `internal/application/social/service.go` — calls `repo.FindBlacklist` and maps to wire DTOs.

Auth handler wiring: `BlacklistProvider` interface in `internal/presentation/rtmp/handlers/auth/handler.go`; `SetSocialService` setter; payload builder (`login_payload.go`) calls `GetBlacklistForLogin` and sets `payload["black"]`. Wired in `cmd/gameserver/main.go` via `authHandler.SetSocialService(socialService)`.

The `FindBlacklist` PG function only scans `ID, CharacterID, OtherID, OtherName, CreatedAt` — no `Intimacy` for blocks, so `num` is hardcoded `"0"`.

## onMinusMoneyNew + world-event emitters (M7)

`internal/presentation/rtmp/utils/currency_callbacks.go`: `SendMinusMoneyNew(conn, charID, []MinusMoneyEntry)` emitter. Emitted alongside (NOT replacing) `onAddMoney(-delta)` until client binding is confirmed. Known `type` values: 28 = stoneSealPoint, 35 = mysteryCrystal. Full vocabulary unknown (OQ7).

`internal/presentation/rtmp/utils/world_events.go`: `BroadcastSysEvent(server, SysEventParams)`, `BroadcastStageEffect(server, charID, effectId)`, `SendStageEffect(conn, charID, effectId)`. Wire these from quest-reward / battle-reward / rare-drop code paths when implementing those features.

## File pointers

- `supabase/migrations/20260505071855_add_relationship_type.sql`
- `internal/infrastructure/persistence/postgres/relationship_repository.go`
- `internal/domain/social/*.go`
- `internal/presentation/rtmp/handlers/npc/npc_func_other.go`
- `internal/presentation/rtmp/utils/currency_callbacks.go`
- `internal/presentation/rtmp/utils/world_events.go`
