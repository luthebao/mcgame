# Marriage System

## Current scope (2026-05-05)

The marriage flow is more shipped than `docs/details.md` initially indicated. Concrete state:

- ✅ `player.marriages` table is populated with `partner1_id`, `partner2_id`, `ring_type`, `intimacy`, `wedding_date`, `wedding_venue`, `married_at`, `divorced_at`. `partner1_id` and `partner2_id` each have their own UNIQUE constraint, so a character can be in at most one marriage row in either column.
- ✅ Application service `internal/application/marriage/service.go` has full panel + request/respond flow:
  - `InitPanel` returns `seekingList` + `charMarriageList`.
  - `UpdateSeeking` writes a Redis seeking entry.
  - `CreateRequest` writes a Redis request entry; rejects if already married.
  - `RespondRequest(response=1)` calls `MarriageRepository.Create` which persists the marriage row.
  - `RespondRequest(response=2)` flags the request rejected.
  - `GetCoupleRank` paginates the couple ranking.
- ✅ 6 RPCs registered: `initMarriage`, `marriageSeeking`, `marriageRequest`, `marriageReqFeedback`, `cancelMarriageSekInfo`, `getCoupleRank`.

## Hardening landed in this session

Migration `supabase/migrations/20260505082932_marriage_audit_log_and_lock.sql`:

- New table `player.marriage_audit_log` with columns `id`, `marriage_id` (FK CASCADE), `event` (CHECK in `{married, divorced}`), `actor_id` (NULL for player-driven; future GM admin id), `partner1_id`, `partner2_id`, `payload jsonb`, `created_at`. Indexes on `marriage_id`, `partner1_id`, `partner2_id`.
- `player.create_marriage(...)` rewritten from a 3-line `LANGUAGE sql` function to `LANGUAGE plpgsql`:
  - Locks both partner rows with `PERFORM 1 FROM player.characters WHERE id IN (p_partner1_id, p_partner2_id) ORDER BY characters.id FOR UPDATE`. The `ORDER BY characters.id` is load-bearing — without it Postgres uses scan order, which permits a deadlock when `create_marriage(A,B)` and `create_marriage(B,A)` race and each transaction grabs one row before the other (fixed in follow-up migration `20260505104856_marriage_lock_order_by_id.sql`).
  - Inserts the marriage row.
  - Inserts an `event='married'` audit row in the same transaction with the partner pair and a payload of `{ring_type, intimacy}`.

The Go side is unchanged: the function signature `(bigint, bigint, integer, integer, timestamp) → (id, married_at)` is preserved.

## What is NOT yet wired

The original plan called for "transactional wedding flow" with divorce + wedding scheduling. After auditing the Flash client, those Flash-side RPCs do not exist as we expected:

- **No divorce RPC on the Flash side.** `MarriageManagerPanel.as` has no `divorce` / `breakUp` / `cancelMarriage` calls. Player-driven divorce is therefore not exposed by the client. If divorce is needed it must come through a GM admin endpoint (separate ticket) or from a future client patch.
- **Wedding scheduling is its own subsystem.** `WeddingBookPanel.as` calls `_core.remote.bookWeddingHall({line, hour, minute, flag})` and `_core.remote.cancelWeddingHall()`. Server has neither RPC. This needs a venue catalog + time-slot logic; out of scope for the marriage hardening track.
- **No `partner_id` column on `player.characters`.** `MarriageRepository.FindByPartner` works via the marriages table, so this denormalisation isn't load-bearing yet. Add it later if a marriage indicator is needed in `cData` payloads.
- **No `onUPP` / marriage-state push** to either partner on accept. The Flash side appears to refresh the panel via `initMarriage` rather than waiting for a server-pushed callback, so this is acceptable today; revisit if you observe missed UI updates.

## File pointers

- `supabase/migrations/20260505082932_marriage_audit_log_and_lock.sql`
- `internal/application/marriage/service.go`
- `internal/domain/marriage/repository.go`
- `internal/infrastructure/persistence/postgres/marriage_repository.go`
- `internal/presentation/rtmp/handlers/marriage/{handler.go, panel.go, requests.go}`

## Follow-up tickets

- Add `Divorce(ctx, marriageID, actorID)` to the domain repo, postgres impl with `event='divorced'` audit row, and wire a GM admin-only endpoint that calls it.
- Implement `bookWeddingHall` + `cancelWeddingHall` once the wedding venue catalog is decided. Persist scheduled events in `marriages.wedding_date` / `wedding_venue` (columns already exist).
- Optional: add a `partner_id` column on `player.characters` if a future feature needs an O(1) marriage indicator on the character row.
