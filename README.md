# MCGame Server

`mcgame` is a server that you can use to run the backend of a Flash MMO client on your own machine. It's written in Go 1.23, and runs as a Docker Compose stack.

The server speaks RTMPE v6 (HMAC-SHA256 + DH + RC4) with AMF0 over the wire, so an unmodified Flash client can connect to it. Game state is stored in a [Supabase](https://supabase.com) Postgres database and cached in Redis. An admin dashboard is included.

It runs as a monolith by default. It can also run as a `main` server (auth + registry) plus a `line` server (gameplay) connected over gRPC.

> [!IMPORTANT]
> This is an unofficial, independent project. It is not affiliated with the original game's developers or publishers. Read the [DISCLAIMER](./DISCLAIMER.md) before you use it.

## Get started

### Requirements

- [Docker](https://docs.docker.com/get-docker/) with the Compose v2 plugin
- GNU Make on macOS and Linux (on Windows use the Go tool below)
- [Supabase CLI](https://supabase.com/docs/guides/local-development/cli/getting-started), used to apply the migrations to the compose database
- To build and test the server on the host: Go 1.23
- To open the client: the Flash Player projector in [`docs/flashplayer/`](./docs/flashplayer/) (Windows or macOS)

#### Windows: no `make` needed

On macOS and Linux use `make`. On Windows use the bundled Go tool [`cmd/game`](./cmd/game/), which does the same as `make game <setup|up|down|reset>` natively, with no `make`, `sh`, `openssl` or `node`. Install these once (PowerShell):

```powershell
winget install GoLang.Go
winget install Docker.DockerDesktop
scoop install supabase   # Supabase CLI, see https://scoop.sh; or download supabase.exe from its GitHub releases
```

Then, from the repository root, build the tool once:

```powershell
go build -o bin/game.exe ./cmd/game
```

| macOS / Linux | Windows |
|---|---|
| `make game setup` | `bin\game setup` |
| `make game up` | `bin\game up` |
| `make game down` | `bin\game down` |
| `make game reset` | `bin\game reset` |

Commands chain (`bin\game down up`) and `-y` answers the questions, like `CONFIRM=1`. Prefer `make` on Windows anyway? Run it from WSL (`wsl --install`, then `sudo apt install -y make`) or Git Bash (`choco install make`), with the repository inside the WSL filesystem.

These ports must be free: `8000` (Supabase API gateway), `54322` (direct Postgres, `127.0.0.1` only), `54323` (Studio and MCP, `127.0.0.1` only), `6379` (Redis), `1935` (RTMP edge), `8888` (nginx edge, assets), `3000` (admin dashboard), `2112` (metrics).

### Initial install

Clone the repository, then run from the repository root:

```bash
make game setup   # one-time: writes docker/.env with fresh secrets
make game up      # database, migrations (+ seeds on a fresh database), then every service
```

On Windows, run `bin\game setup` and `bin\game up` instead (see above).

The first `up` builds the images, so it takes a few minutes. The stack is defined in [`docker/docker-compose.yml`](./docker/docker-compose.yml); see the [docker README](./docker/README.md) for every service, port and setting.

### Play the game

The client is a Flash SWF, so it needs a Flash runtime. The repository ships the standalone **Flash Player 32 debug projector** in [`docs/flashplayer/`](./docs/flashplayer/):

| OS      | File                                                                          |
|---------|-------------------------------------------------------------------------------|
| Windows | [`flashplayer_32_sa_debug.exe`](docs/flashplayer/flashplayer_32_sa_debug.exe) |
| macOS   | [`flashplayer_32_sa_debug.dmg`](docs/flashplayer/flashplayer_32_sa_debug.dmg) |

1. Start the stack with `make game up` (RTMP edge on `1935`, SWF and asset edge on `8888`).
2. Open the Flash Player projector. On Windows, run the `.exe`. On macOS, open the `.dmg` and launch the Flash Player app inside; if Gatekeeper blocks it, right-click → Open.
3. Choose `File` → `Open...` (`Ctrl+O` / `Cmd+O`) and enter the client URL:

   ```text
   http://localhost:8888/s/sv/GameLoaders.swf?isExpand=true
   ```

4. Log in with an account that exists in `public.accounts` (dev accounts come from `supabase/seeds/accounts.sql`), pick a line, then create or choose a character.

The client finds the server through `frontend/s/sv/profile/config.xml`, which points `<resource>` at `http://localhost:8888/s/` and `<logic>` at `127.0.0.1:1935/master/test/`. To play against another host, change those two values, and keep `crossdomain.xml` served at the host root.

If the game does not load, check that `8888` and `1935` are reachable (`docker compose ps` in `docker/`) and read the logs of the `mcgame-rtmp-edge` and `mcgame-server` containers. The debug projector also shows ActionScript errors in a dialog, which helps when you trace client-side issues.

### Upgrade

Pull the latest changes and run `up` again. It applies new migrations and rebuilds only what changed:

```bash
git pull
make game up
```

### Stop and uninstall

```bash
make game down    # stop every service, data stays
make game reset   # wipe the database and storage back to the migrations and seeds, then start
```

To remove the stack and all of its data:

```bash
docker compose --env-file docker/.env -f docker/docker-compose.yml --profile "*" down -v --remove-orphans
rm -rf docker/volumes/db/data docker/volumes/storage
```

## Next steps

- Browse the [docker README](./docker/README.md) for the services, ports, configuration and troubleshooting.
- Read how the server is organized in [Architecture](#architecture) and how to [add an RPC handler](#adding-a-new-rpc-handler).
- Read the per-feature knowledge in [`docs/PROJECT_KNOWLEDGE_BASE.md`](./docs/PROJECT_KNOWLEDGE_BASE.md).
- Read the current implementation state in [`docs/details.md`](./docs/details.md).
- Look through the feature plans and inventories in [`docs/plans/`](./docs/plans/).

## Build and test

```bash
go build -o bin/gameserver ./cmd/gameserver   # always -o bin/<name>, never bare ./...
make run                                      # host binary against the compose database (127.0.0.1:54322)

make test                                     # all tests
make test-race                                # race detector
go test ./internal/application/auth -run TestX
make vet
```

## Architecture

Clean architecture, four layers:

```text
cmd/gameserver/main.go              # dependency wiring
  └─ internal/presentation/         # RTMP / gRPC handlers
       └─ internal/application/     # use-case services
            └─ internal/domain/     # entities + repo interfaces
                 └─ internal/infrastructure/   # postgres, redis, rtmp, grpc
```

**Request flow:** Flash client → RTMPE → `pkg/rtmp/server_conn.go` → `OnUnknownCommandMessage` → `internal/infrastructure/rtmp/dispatcher.go` → handler → application service → repository → Postgres.

**Database:** a single Supabase Postgres with three schemas: `public` (auth), `player` (runtime state) and `data` (static templates). The `auth_database` and `database` configs may point at the same instance.

### Connection flow

| App      | Client handshake                                | Server response                              |
|----------|-------------------------------------------------|----------------------------------------------|
| `tcn/`   | `["G", user, pass, time, session, hash]`        | `onLineList` → client calls `getLineInfo`    |
| `scene/` | `["L", user, pass, time, session, lineId]`      | `onIcl` (char list) → `chooseCharactor` → `onChooseCharactor` → client calls `sceneLogin` |

Callback args must match the Flash signatures in `docs/client/system/CallBack.as` exactly.

### Configuration

Environment only, no config file. The defaults are in `internal/infrastructure/config/config.go` and are overridden by `MCGAME_*` environment variables (for example `MCGAME_RTMP_PORT=1935`). Under compose they come from `docker/.env` (`GAME_*`) through `docker/docker-compose.yml`; `make run` passes the compose database port and password.

### Dependencies

`pkg/rtmp` (forked go-rtmp with RTMPE), `pkg/amf0` (patched go-amf0, lenient UTF-8), `pgx/v5`, `zap`, `viper`, `grpc` and `uuid`. `go.mod` has a replace directive: `github.com/yutopp/go-amf0 => ./pkg/amf0`.

## Contributing

Contributions are welcome. Open an issue to discuss a change, or send a pull request. Please follow the conventions below; [`CLAUDE.md`](./CLAUDE.md) has the full rules, including the security policy and the database-function workflow.

- RPC method names match the client **exactly**, including typos (`chooseCharactor`, `udcr`, `udcp`).
- AMF0 numbers arrive as `float64`, so type-switch on `args[i]`.
- DTOs use the field names the client expects (`attStrength`, `currentHp`, `posMapId`).
- `iconCode`, `resCode`, `imgCode`, `portraitCode` and `colorCode` must be `int64`.
- `.go` files have no inline comments (a file-level header only), and files longer than 300–400 lines are split.
- Long SQL goes through schema-qualified Postgres functions, not inline strings.
- Do not edit the decompiled client in `docs/client/`; it is a read-only reference.

### Adding a new RPC handler

1. Domain entity and repo interface in `internal/domain/<feature>/`.
2. Postgres repo in `internal/infrastructure/persistence/postgres/`.
3. Service in `internal/application/<feature>/`.
4. Handler in `internal/presentation/rtmp/handlers/<feature>/`, with the signature `func(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error)`.
5. `RegisterHandlers(dispatcher)` in the handlers package, wired from `cmd/gameserver/main.go`.

## Project status

The project is under active development. The database schema, the migrations and the internal packages may change without notice, and there is no stability guarantee between commits.

## License

The source code written for this project is licensed under the [Apache License 2.0](./LICENSE).

Third-party material keeps its own license and is not covered by it: the vendored forks in `pkg/rtmp` and `pkg/amf0` (Boost Software License 1.0), the Supabase-derived files in `docker/`, and the game client files, assets and Flash Player projector described in the [DISCLAIMER](./DISCLAIMER.md).

## Disclaimer

This project is unofficial and provided "as is", without warranty. Read the full [DISCLAIMER](./DISCLAIMER.md) for what it covers, what it does not, and how to ask for the removal of material.
