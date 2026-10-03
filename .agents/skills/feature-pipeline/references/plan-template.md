# Plan Document Template

File: `docs/plans/<YYYY-MM-DD>_<INDEX>_<PLAN_NAME>.md`. Index restarts per day (`01`, `02`, …). English only.

Gold-standard examples in this repo: `docs/plans/2026-07-05_01_LOOP_BOSS_SUMMON.md` (compact, table-driven) and `docs/plans/2026-07-04_01_QUEST_LOOP_SYSTEM.md` (full-system).

A good plan is **self-contained**: the `mcgame-plan-implementer` agent starts with fresh context and must be able to execute from the plan plus the files it cites, without re-deriving research.

## Skeleton

```markdown
# <Feature Name> — Implementation Plan

**Date**: <YYYY-MM-DD> · **Status**: Draft | Approved
**Goal**: one paragraph — what becomes possible end-to-end, and what is broken today.

Research base (all verified <date>):
- <links to research docs, agent memory files, docs/memory entries — each with one line on what it proves>

## 1. Confirmed mechanics

<The wire facts that BIND the implementation. Facts only — no "should", no design.>

- Exact RPC names + argument shapes; callback names + payload keys; required push ordering.
- ID pairing tables (quest ↔ item ↔ NPC ↔ creature ↔ map) as markdown tables.
- Negative facts too: "no client-side position gating", "item is NOT consumed".
- Known pitfalls inline (ID collisions, shadowed handlers) so the implementer can't step on them.

## 2. Design

### 2.1 Single source of truth
<The one data table/registry in code that everything derives from — show the actual Go snippet.>

### 2.2 <subsystem sections as needed>
<State ownership decisions explicitly: DB vs in-memory, and why losing the state is safe (or not).>

### 2.x Touch points

| Touch point | Change |
|---|---|
| `path/to/file.go` `FuncName` | precise, testable description of the change |

<One row per file. The implementer should never have to guess which file to open.>

## 3. Non-goals

<Scope fence. Each deferred item gets a WHY-it-is-safe-to-defer. This section is what
prevents the implementer from gold-plating and the reviewer from flagging "missing" work.>

## 4. Verification

1. Unit tests: <list the specific gate/branch cases worth a test>.
2. Build `bin/<name>`, `go vet`, full `go test` vs the known baseline failures (pet/auth/chat).
3. Manual/Flash smoke script: <numbered player-visible steps>.
4. Docs to update: `docs/memory/<feature>.md` (+ index line in `docs/PROJECT_KNOWLEDGE_BASE.md` if new).
```

## Per-section guidance

- **Status** starts `Draft`. Flip to `Approved` only after the user confirms — implementation must not start on a Draft.
- **§1 Confirmed mechanics** is the contract firewall. If a fact is uncertain, either verify it (two-source rule) before writing the plan, or move it to Non-goals. Never let a guess into §1.
- **§2 Design** decisions to always state explicitly:
  - Where state lives (new table + migration vs existing columns vs in-memory) and the restart story.
  - New Go files with their package placement per the repo layout (`internal/application/<feature>/`, `internal/presentation/rtmp/handlers/<feature>/`), respecting the 300–400-line file cap.
  - How new capabilities are injected into handlers (narrow interfaces, mirroring existing wiring).
- **Migrations**: if schema changes are needed, the plan says so and names the intended `supabase db diff -f <name>` capture; it never contains hand-written SQL DDL for migrations. Postgres functions get drafted in the plan or a cited `.sql` file following the CLAUDE.md function conventions.
- **§4 Verification** must be executable by someone who didn't write the plan: exact commands, exact player steps.

## Plan hygiene

- Plans go stale: if the implementer finds reality diverged (a stub already filled, a file moved), the correction is applied in code and the plan doc is amended in the same wave — plans are read later as history.
- Addenda: for follow-up scope on an existing plan, append a numbered section (e.g. `§11 Addendum — <topic>`) instead of writing a near-duplicate new plan.
- After implementation ships, the plan's load-bearing outcomes get distilled into `docs/memory/<feature>.md`; the plan itself is not the living reference.
