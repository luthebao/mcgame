# MCGame Server Makefile

.PHONY: all build test test-verbose test-coverage test-race clean run help game

# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOTEST=$(GOCMD) test
GOVET=$(GOCMD) vet
GOMOD=$(GOCMD) mod
BINARY_NAME=gameserver
BINARY_PATH=bin/$(BINARY_NAME)
MAIN_PATH=./cmd/gameserver
DOCKER_ENV_FILE=docker/.env

### Host runs (make run) reach the compose stack through docker/.env.
env_value=$(shell grep -m1 '^$(1)=' $(DOCKER_ENV_FILE) 2>/dev/null | cut -d= -f2-)
HOST_RUN_ENV=MCGAME_DATABASE_PORT=$(call env_value,POSTGRES_DIRECT_PORT) MCGAME_DATABASE_PASSWORD='$(call env_value,POSTGRES_PASSWORD)' \
	MCGAME_AUTH_DATABASE_PORT=$(call env_value,POSTGRES_DIRECT_PORT) MCGAME_AUTH_DATABASE_PASSWORD='$(call env_value,POSTGRES_PASSWORD)'

# Test parameters
COVERAGE_FILE=coverage.out
COVERAGE_HTML=coverage.html

# Default target
all: build

## Build targets
build: ## Build the application
	@echo "Building..."
	$(GOBUILD) -o $(BINARY_PATH) $(MAIN_PATH)
	@echo "Build complete: $(BINARY_PATH)"

## Test targets
test: ## Run all tests
	$(GOTEST) ./...

test-verbose: ## Run all tests with verbose output
	$(GOTEST) -v ./...

test-coverage: ## Run tests with coverage report
	$(GOTEST) -coverprofile=$(COVERAGE_FILE) ./...
	$(GOCMD) tool cover -html=$(COVERAGE_FILE) -o $(COVERAGE_HTML)
	@echo "Coverage report: $(COVERAGE_HTML)"
	$(GOCMD) tool cover -func=$(COVERAGE_FILE) | grep total

test-race: ## Run tests with race detector
	$(GOTEST) -race ./...

test-short: ## Run only short tests
	$(GOTEST) -short ./...

test-bench: ## Run benchmarks
	$(GOTEST) -bench=. -benchmem ./...

test-rtmp: ## Run RTMP package tests
	$(GOTEST) -v ./pkg/rtmp/...

test-infra: ## Run infrastructure tests
	$(GOTEST) -v ./internal/infrastructure/...

test-cache: ## Run cache tests
	$(GOTEST) -v ./internal/infrastructure/cache/...

test-center: ## Run center service tests
	$(GOTEST) -v ./internal/application/center/...

test-errors: ## Run error package tests
	$(GOTEST) -v ./pkg/errors/...

## Lint and vet
vet: ## Run go vet
	$(GOVET) ./...

lint: vet ## Run linters (alias for vet)

## Dependencies
deps: ## Download dependencies
	$(GOMOD) download

tidy: ## Tidy go.mod
	$(GOMOD) tidy

## Run targets
run: build ## Build and run the application on the host against the compose database
	$(HOST_RUN_ENV) ./$(BINARY_PATH)

run-dev: ## Run in development mode with hot reload (requires air)
	air

## Stack: one compose file (docker/docker-compose.yml) for dev and prod
# Usage: make game <setup|up|down|reset>
#   setup   docker/.env from .env.example with fresh secrets (Google sign-in values carried over);
#           a database made with the old secrets is wiped too, after asking
#   up      database, migrations (seeds on a fresh database), then every service, rebuilt
#   down    stop every service; the data stays
#   reset   wipe the database and storage back to the migrations and seeds, then up (asks first)
# CONFIRM=1 answers the questions. The Supabase CLI and MCP talk to the same containers.
GAME_SUBCMDS := setup up down reset
game: ## The stack: make game <setup|up|down|reset>
	@set -e; \
	cmds="$(filter-out game,$(MAKECMDGOALS))"; \
	if [ -z "$$cmds" ]; then echo "usage: make game <setup|up|down|reset>"; exit 2; fi; \
	for cmd in $$cmds; do sh docker/utils/game.sh $$cmd; done

$(GAME_SUBCMDS):
	@:

## Run modes
run-main: build ## Run as main server (registry + auth)
	MCGAME_GATEWAY_MODE=main ./$(BINARY_PATH)

run-line: build ## Run as line server (game server)
	MCGAME_GATEWAY_MODE=line ./$(BINARY_PATH)

## Proto generation (requires protoc)
proto: ## Generate gRPC code from proto files
	@mkdir -p api/proto/lineserver/v1
	protoc --go_out=. --go_opt=paths=source_relative \
		--go-grpc_out=. --go-grpc_opt=paths=source_relative \
		api/proto/lineserver/v1/lineserver.proto

## Clean
clean: ## Clean build artifacts
	@rm -rf bin/
	@rm -f $(COVERAGE_FILE) $(COVERAGE_HTML)
	@echo "Clean complete"

## Help
help: ## Show this help message
	@echo "MCGame Server - Available targets:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "Examples:"
	@echo "  make build          # Build the server"
	@echo "  make test           # Run all tests"
	@echo "  make test-coverage  # Run tests with coverage"
	@echo "  make game setup     # docker/.env with fresh secrets"
	@echo "  make game up        # Start the stack (database, migrations, every service)"
	@echo "  make game down      # Stop the stack"
	@echo "  make game reset     # Database back to migrations + seeds"
