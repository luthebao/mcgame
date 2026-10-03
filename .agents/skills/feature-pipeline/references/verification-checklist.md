# Verification Checklist (Phase 4)

Run this after the implementer agent reports done. The implementer's report is a claim, not evidence — every item below is independent verification by the orchestrator.

## 1. Build / vet / test

```bash
go build -o bin/gameserver ./cmd/gameserver
go vet ./...
go test ./internal/... 2>&1 | grep -E "^(ok|FAIL|---)" | sort | uniq -c
```

- Builds only ever target `bin/` (`go build -o bin/<name> ./<pkg>`); never bare `go build ./...` for binaries.
- **Baseline calibration**: this repo has known pre-existing test failures in `internal/application/pet`, `internal/presentation/rtmp/handlers/auth`, and `internal/presentation/rtmp/handlers/chat`. Compare the failure set before vs after the change; the deliverable is *zero new failures*. Never "fix" the baseline failures as a side effect — they are calibration, and touching them muddies the diff.
- If diagnostics (LSP) and `go build` disagree, `go build` wins. Stale diagnostics after multi-file changes are a known false alarm.

## 2. Contract spot-checks (read the code)

Open the contract-critical files and verify by reading, not by trusting the report:

- [ ] **Push ordering** matches the plan's §1 (e.g. completion push before next-grant push).
- [ ] **Payload field names** match the client contract exactly, including intentional typos (`onDelCharactorSlot`) and epoch-ms timestamps.
- [ ] **Fire-and-forget RPCs reply on every path** — success, gate failure, and error must each push something; a silent return hangs the client UI.
- [ ] **Consume-then-credit ordering** wherever items/currency are spent for a reward (never credit first).
- [ ] Dynamic entity pushes carry explicit coordinates (`posX`/`posY`).
- [ ] No inline comments crept into `.go` files; new files under the 300–400-line cap.

## 3. Migrations & SQL (when schema changed)

- [ ] Migration exists in `supabase/migrations/` and was captured via `supabase db diff -f <name>` (not hand-written; no `insert` statements).
- [ ] New Postgres functions follow conventions: `language sql` unless branching demands `plpgsql`, `security invoker`, `set search_path to ''`, every relation schema-qualified.
- [ ] Functions smoke-tested against real local data (`supabase db query` / `docker exec … psql`).

## 4. RPC logging (quietMethods)

- [ ] New RPC methods are **absent** from the `quietMethods` map in `internal/infrastructure/rtmp/dispatcher.go` (i.e. logged) while the feature is unconfirmed.
- [ ] Any previously-quiet method that was un-quieted for debugging is tracked for re-quieting.
- Quiet methods **only after the user confirms** the feature works on the wire, and always ask first — this is a CLAUDE.md rule.

## 5. Wire smoke test (user-driven)

The orchestrator prepares the script; the user executes it:

- **Flash client**: numbered player-visible steps from the plan's §4 (take → act → observe pushes → turn in).
- **Bot harness**: the owner's `vpt-headless` CLI (see `research-playbook.md` §External automation repo) pointed at the local server — it was built against the original server, so a passing bot run is strong contract evidence.
- Watch Docker logs during the run; new methods are un-quieted precisely so this is readable.

## 6. Record

- [ ] `docs/memory/<feature>.md` updated (or created + one-line link added to `docs/PROJECT_KNOWLEDGE_BASE.md` — index stays link-only).
- [ ] Plan doc amended where reality diverged; deferred items noted in the memory doc, not just the plan.
- [ ] Final user report leads with the outcome, then: what was verified and how, what remains (smoke test, quietMethods flip, deferred non-goals). Reply in the user's language; docs stay English.
- [ ] No `git commit` / `git push` — committing is the user's call, always.
