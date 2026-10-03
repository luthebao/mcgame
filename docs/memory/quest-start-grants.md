# Quest Accept-Time Item Grants

## Mechanism

When a player accepts certain story quests, the Flash UI implies the giving NPC also hands over a quest-progress item (e.g. quest 162 narration says *"here is a sample, take it to..."*). The server grants that item at `TakeQuest` / `TakeBuildQuest` time via `handlers/quest/lifecycle.go::grantQuestStartItems`.

## Catalog source (added 2026-05-06)

`data.data_tbl_quest` has two new nullable columns:

- `start_grant_item INTEGER` — item template id to grant on accept.
- `start_grant_qty INTEGER` — quantity (defaults to 1 in resolver if NULL).

Migration: `supabase/migrations/20260505185430_add_quest_start_grant_columns.sql`. Seed re-exported to `supabase/seeds/data_tbl_quest.sql`.

The 3 known entries are populated:

| quest_id | start_grant_item | start_grant_qty | Vietnamese name              |
|----------|------------------|-----------------|------------------------------|
| 160      | 335              | 1               | Ủy Thác Của Vệ Sĩ            |
| 162      | 515              | 1               | Thực Phẩm Có Độc             |
| 164      | 517              | 1               | Canh Giải Độc                |

## Resolution order

`Handler.resolveQuestStartGrants(questID)` in `handlers/quest/lifecycle.go`:

1. If `gameDataManager.GetQuest(questID).StartGrantItem != nil` and value > 0, return `[{templateID, qty}]` (qty defaults to 1 if `StartGrantQty` is null/zero).
2. Otherwise fall back to the hardcoded `questStartItemGrants` map (kept for tests + catalog-less envs).
3. Otherwise no grant.

The hardcoded map is intentionally kept as a safety net; it shadows nothing in production because the catalog column takes precedence.

## How to add a new accept-time grant

1. Identify the quest in `data.data_tbl_quest` whose narrative implies an NPC-given item.
2. Run a one-line UPDATE on the local Supabase DB: `UPDATE data.data_tbl_quest SET start_grant_item=<itemID>, start_grant_qty=<qty> WHERE id=<questID>;`
3. Re-export the seed: `pg_dump … data.data_tbl_quest > supabase/seeds/data_tbl_quest.sql` (then re-add the `SET session_replication_role = replica;` header per project convention).
4. No Go change required.

## Known follow-up

Per the original Track D research, additional story quests likely have implicit accept-time grants but identifying them requires a Vietnamese-fluent reviewer to walk start_text + Flash `Quest*.as` accept logic. The infrastructure here unblocks that audit — entries are now data, not code.

## File pointers

- `internal/presentation/rtmp/handlers/quest/lifecycle.go` — `resolveQuestStartGrants`, `grantQuestStartItems`.
- `internal/gamedata/models/quest.go` — `QuestTemplate.StartGrantItem`, `StartGrantQty`.
- `supabase/migrations/20260505185430_add_quest_start_grant_columns.sql`.
- `supabase/seeds/data_tbl_quest.sql`.
