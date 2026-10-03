# Research Playbook

Techniques and pitfalls for Phase 1 (Analyze) of the feature pipeline. Everything here was learned the hard way on real features (quest loops, loop-boss summon, login parity).

## Client contract tracing

The decompiled client lives in `docs/client` (read-only, never edit `.as`).

Entry points, in order of usefulness:

1. **`CallBack.as` / `CallBackGlobal.as`** — the complete server-push surface. Every `on*` handler here is a callback the server may send; its body shows exactly which payload keys the client reads and in what order UI updates fire. Inferring a payload from the handler body is the single most reliable contract source.
2. **RPC call sites** — grep for `call("` / method-name strings to find what the client *sends*: argument count, types, and whether the client awaits a response object or treats the call as fire-and-forget (fire-and-forget RPCs must still get a push reply on every server path, including errors).
3. **`Language.as`** — Vietnamese UI strings map feature names to code. Grep the on-screen string first, then trace the constant's usages to find the owning panel class.
4. **Panel / manager classes** — show client-side gating (or its absence). Absence matters: e.g. order-item use had *no* client-side position gating, so the server must not invent one.

Contract rules that always hold:

- RPC and callback names are preserved **exactly**, including original typos (`chooseCharactor`, `onDelCharactorSlot`).
- Numeric fields the client feeds into `Date` are epoch **milliseconds**.
- Client-pushed entity payloads need explicit coordinates (`posX`/`posY`) when the entity is dynamic — there is no GameData fallback for entities not in a map roster.
- Push **ordering** is part of the contract (e.g. `onFinishLoopQuest` must precede the next `onAddChaQuest`). When ordering matters and the client code doesn't prove it, get a live-log capture from the original server and treat it as ground truth.

Delegate client tracing to the `flash-client-researcher` agent; it persists stable findings in `.claude/agent-memory/flash-client-researcher/` — check that cache before re-researching.

## Seed archaeology

Game-data templates live in `supabase/seeds/` (one table per file) and in the live DB as `data_tbl_*` tables. Original design intent often survives *only* here: tag columns, placeholder coordinates, script residue in description text.

- Prefer Supabase MCP `execute_sql` over grepping raw seed files — SQL exposes named columns.
- When grepping seed files anyway, use **position-aware regexes**. Raw seed rows are positional; a bare `grep 1143` happily matches an `id` column where `nid` was intended, or a creature id where an NPC id was intended. Anchor on the preceding delimiter pattern or count columns.
- Mine low-signal columns deliberately: tag/`at` columns (e.g. `ZhiAn`/`ChuMo` NPC tags), placeholder values (`pos_map_id=200` = "never actually placed"), and quest/item **description text** — flavor text frequently narrates the intended mechanic ("go to X and use the item").
- Cross-check ID pairings numerically: quest → require rows (kind enum) → creature/item/NPC templates. Build a pairing table in the research doc; it becomes the plan's single source of truth.

## Server-side survey

- Spawn `Explore` for broad sweeps ("where is X handled, what's stubbed"); read the pinpointed files yourself for anything contract-critical.
- Look for **dead or shadowed code** before extending it: handler registration is last-write-wins, so an apparently relevant handler may be shadowed by a later registration (e.g. `scene.ClickBoss` shadowed by `combat.HitNpc`). Extend the live path, not the corpse.
- Check `docs/memory/rpc-reference.md` and per-feature memory docs before grepping from scratch.

## External automation repo

`github.com/luthebao/vpthelper-rust` (the `golang/` folder, `vpt-headless` CLI) is the owner's bot built against the **original** server. It is both a contract oracle (its request/response handling encodes original behavior) and the wire-verification harness for Phase 4.

## Known pitfalls

- **ID collisions across domains**: the same numeric id means different things in different tables (e.g. item 2263 vs an unrelated Boss-Daily wild-boss id in `internal/domain/activity/boss_config.go`). Never cross-wire on numeric equality alone; confirm the domain.
- **Scale mismatches**: `ItemTemplate.color` (0–4) and equipment `ColorCode` (0–5) are different scales — see the CLAUDE.md table before touching quality display.
- **Stale LSP diagnostics**: after multi-file refactors, diagnostics report phantom undefined symbols. `go build` is the arbiter.
- **zsh**: never start an `echo` argument with `=` (zsh treats leading-`=` words specially and errors).
- **Oversized API/dir listings**: save to a scratchpad file and parse with a script instead of paging through tool output.
- **History-backed vs progress-backed state**: `quest_history` is all-time; deriving "completed today" from it silently breaks daily re-takes. When a fact is date-scoped, make the data source date-scoped too — and make test fakes mirror the *real* data source, or the bug hides behind the fake.
