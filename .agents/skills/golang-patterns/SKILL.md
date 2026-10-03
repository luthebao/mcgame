---
name: golang-patterns
description: This skill should be used when writing, reviewing, or refactoring Go code, or designing Go packages and modules. Triggers on "write Go code", "review this Go function", "refactor this package", "is this idiomatic Go", questions about error handling, goroutines and channels, interface design, struct composition, project layout, or Go performance tuning.
version: 2.0.0
origin: ECC
---

# Go Development Patterns

Idiomatic Go patterns and best practices for building robust, efficient, and maintainable applications. Apply these when writing new Go code, reviewing or refactoring existing code, and designing packages or modules.

> **Repository override (mcgame-server):** root `CLAUDE.md` wins over generic guidance here. In this repo: build only with `go build -o bin/<name> ./<pkg>` (never bare `go build ./...`), no inline comments in `.go` files (file-level notes only), and split files over 300–400 lines.

## Core Principles

1. **Simplicity over cleverness.** Code should be obvious and easy to read — return early, handle errors first, keep the happy path unindented. No nested closures where a plain function works.
2. **Make the zero value useful.** Design types so they work without initialization (`bytes.Buffer`, `sync.Mutex`). A struct wrapping a bare `map` needs a constructor — prefer designs that don't.
3. **Accept interfaces, return structs.** Take `io.Reader`-style interface parameters; return concrete types so callers keep full access to the implementation.
4. **Errors are values.** Wrap with `fmt.Errorf("operation %s: %w", input, err)`, check with `errors.Is`/`errors.As`, never discard with `_` unless the ignore is deliberate and safe.
5. **Don't communicate by sharing memory.** Coordinate goroutines with channels and `context.Context`; every goroutine needs a guaranteed exit path.

## Reference Guide

Load detailed patterns and code examples as needed:

| Topic | Reference | Load When |
|-------|-----------|-----------|
| Error handling | `references/error-handling.md` | Wrapping, custom error types, `errors.Is`/`As`, sentinel errors |
| Concurrency | `references/concurrency.md` | Worker pools, context cancellation, errgroup, graceful shutdown, goroutine leaks |
| Interfaces & composition | `references/interfaces-and-composition.md` | Interface design, consumer-side interfaces, functional options, embedding |
| Performance | `references/performance.md` | Slice preallocation, `sync.Pool`, `strings.Builder` |
| Project layout & tooling | `references/project-layout.md` | Package structure, naming, dependency injection, go tooling, linter config |

## Quick Reference: Go Idioms

| Idiom | Description |
|-------|-------------|
| Accept interfaces, return structs | Functions accept interface params, return concrete types |
| Errors are values | Treat errors as first-class values, not exceptions |
| Don't communicate by sharing memory | Use channels for coordination between goroutines |
| Make the zero value useful | Types should work without explicit initialization |
| A little copying is better than a little dependency | Avoid unnecessary external dependencies |
| Clear is better than clever | Prioritize readability over cleverness |
| gofmt is no one's favorite but everyone's friend | Always format with gofmt/goimports |
| Return early | Handle errors first, keep happy path unindented |

## Anti-Patterns to Avoid

- **Naked returns** in functions longer than a few lines — the reader can't tell what is returned.
- **`panic` for control flow** — return errors; reserve panic for unrecoverable programmer mistakes.
- **Context in structs** — `context.Context` is always the first function parameter, never a struct field.
- **Mixed receiver types** — pick value or pointer receivers per type and stay consistent.
- **Package-level mutable state** — inject dependencies through constructors instead of `init()` + globals.
- **Goroutines without lifecycle** — every `go` statement needs a clear owner, exit condition, and error path.

**Remember**: Go code should be boring in the best way — predictable, consistent, and easy to understand. When in doubt, keep it simple.
