---
name: feature-pipeline
description: "This skill should be used when the user asks to \"analyze, plan and implement\" a feature, \"add a new feature end-to-end\", \"research then implement\", \"implement all about <system> into the server\", or Vietnamese equivalents like \"phân tích và triển khai tính năng\", \"lên kế hoạch rồi cài đặt\". Orchestrates the full mcgame-server pipeline: flash-client research + seed archaeology → approved plan doc → delegated implementation → independent verification → memory update."
argument-hint: "Describe the feature to build, any known client RPCs/callbacks, and constraints."
user-invocable: true
---

# Feature Pipeline (Analyze → Plan → Implement → Verify)

End-to-end orchestration for shipping a new feature into the mcgame-server Go backend while preserving the Flash client wire contract. The pipeline has four phases; each produces a concrete artifact before the next begins. The orchestrating session owns synthesis and verification — subagents do the leg work.

**When NOT to use**: small bug fixes or single-file changes with a known cause — use the `mcgame-go-server` skill directly; pure client research with no implementation goal — spawn `flash-client-researcher` alone.

## Phase 0 — Load Context

Before any research:

1. Read `CLAUDE.md` (hard rules) and `docs/PROJECT_KNOWLEDGE_BASE.md` (index only).
2. Read every `docs/memory/<feature>.md` matching the feature area — these are authoritative per-feature knowledge and often already contain the wire contract.
3. Check `docs/plans/` and `docs/research/` for prior work on the same feature (naming: `<YYYY-MM-DD>_<INDEX>_<NAME>`). A prior plan may only need an addendum, not a rewrite.

## Phase 1 — Analyze

The decompiled Flash client is the authoritative wire contract; the server must conform to it, never the reverse.

Run independent research tracks **in parallel** (one message, multiple Agent calls):

- **Client contract** — spawn `flash-client-researcher` to trace RPC method names, argument shapes, callback payload keys, and push *ordering* through `docs/client` (entry points: `CallBack.as` / `CallBackGlobal.as`, `Language.as`). It caches stable findings in `.claude/agent-memory/flash-client-researcher/` — check there first.
- **Seed archaeology** — query game-data tables (`supabase/seeds/`, `data_tbl_*`) via Supabase MCP `execute_sql` to map template IDs, type/kind enums, and tag columns. Original design intent often survives only in seed data.
- **Server-side survey** — spawn an `Explore` agent to find existing partial implementations, stubs, and the handler/service packages the feature will touch.

Confirm every load-bearing fact from **two independent sources** (client code, seeds, live-log capture, existing server code) before it enters the plan. When push ordering is contract-critical and unverifiable from the client alone, ask the user for a live-log capture from the original server — treat that as ground truth.

Deliverable: substantial findings go to `docs/research/<YYYY-MM-DD>_<INDEX>_<FEATURE>_RESEARCH.md`; for small features, fold findings directly into the plan's "Confirmed mechanics" section.

Detailed techniques and known pitfalls: **`references/research-playbook.md`**.

## Phase 2 — Plan

Write `docs/plans/<YYYY-MM-DD>_<INDEX>_<PLAN_NAME>.md` using the skeleton in **`references/plan-template.md`**. Non-negotiable sections:

- **Confirmed mechanics** — the wire facts that bind the implementation (exact RPC names, payload shapes, push ordering, ID pairing tables). Facts, not intentions.
- **Design** — single-source-of-truth data tables in code, plus a touch-point table (file → change) so the implementer never guesses.
- **Non-goals** — explicit scope fence; list deferred items and *why* they are safe to defer.
- **Verification** — unit-test list, build/vet/test commands, manual smoke-test script.

Present a summary to the user in the user's language (docs stay in English) and wait for approval. Mark the plan `Status: Approved` only after the user confirms. Autonomous mode does not waive approval for scope changes.

## Phase 3 — Implement

Delegate to the `mcgame-plan-implementer` agent. The plan must be **self-contained** — the agent starts with fresh context and reads only what the plan points at. Implement in-parent only when the change is small enough that spawn overhead dominates.

While the agent runs:

- If it stalls or reports compile errors, verify with a real `go build -o bin/<name> ./<pkg>` before believing it — LSP diagnostics go stale and have repeatedly contradicted successful builds.
- Prod a stalled agent with SendMessage rather than respawning; its context is valuable.
- Expect the agent to correct stale plan premises (code moves between planning and implementation) — evaluate corrections on merit, then update the plan doc to match reality.

New RPC methods **stay logged** until the user confirms the feature works on the wire — the `quietMethods` workflow is detailed in `references/verification-checklist.md` §4.

## Phase 4 — Verify & Record

Never relay an implementer's report unverified. Independently:

1. `go build -o bin/gameserver ./cmd/gameserver` && `go vet ./...`
2. `go test` on every touched package, calibrated against the known baseline failures listed in `references/verification-checklist.md` §1 — never "fix" those.
3. Spot-check contract-critical code by reading it: push ordering, exact payload field names, fire-and-forget RPCs replying on every path, consume-then-credit ordering.
4. Wire smoke test is user-driven: Flash client walkthrough, or the owner's `vpt-headless` bot (see `references/research-playbook.md` §External automation repo) pointed at the local server.

Then record:

- Update `docs/memory/<feature>.md` (create + one-line link in `docs/PROJECT_KNOWLEDGE_BASE.md` if new).
- Final report to the user: lead with the outcome, list what remains (smoke test, quietMethods, deferred non-goals).

Full checklist: **`references/verification-checklist.md`**.

## Orchestration Style

- **Parallelize** independent research and implementation waves — multiple Agent calls in a single message.
- **Parent owns synthesis**: cross-agent contradictions are resolved by the orchestrator against primary sources, not by asking agents to agree.
- **Cheapest capable model** per CLAUDE.md's subagent table (Haiku mechanical / Sonnet scoped research / Opus planning-grade subtasks).
- **Two-source rule** for every fact that binds the wire contract.
- **Trust builds over diagnostics**; trust seeds and client code over memory and assumption.
- Reply to the user in the user's language; write all docs in English.

## Hard Rules Recap

`CLAUDE.md` is authoritative; these are the ones most often at risk in this pipeline:

- Never edit `.as` files. Never `git commit` / `git push`.
- `.go` files: no inline comments (file-level header only); split files >300–400 lines.
- Builds only via `go build -o bin/<name> ./<pkg>`.
- Migrations only via local Supabase CLI + `supabase db diff -f <name>`; long SQL through schema-qualified Postgres functions.

## Additional Resources

- **`references/research-playbook.md`** — client-tracing entry points, seed-archaeology queries, pitfalls (ID collisions, column-position greps, scale mismatches).
- **`references/plan-template.md`** — plan skeleton with per-section guidance; gold-standard example: `docs/plans/2026-07-05_01_LOOP_BOSS_SUMMON.md`.
- **`references/verification-checklist.md`** — build/test/spot-check checklist, baseline failure calibration, quietMethods workflow, memory-update steps.
