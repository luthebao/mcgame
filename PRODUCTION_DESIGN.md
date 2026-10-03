# MCGame Server — Production Capacity Design for 5000 Concurrent Players

> **Date:** 2026-04-27 (updated)
> **Status:** Approved
> **Scope:** Monolith deployment, 5000 concurrent characters, peak load (world events, boss battles)

---

## 1. Problem Statement

The MCGame Go server (RTMP-based Flash MMO) needs to support **5,000 concurrent players** under **peak load** conditions — all players actively engaged in combat, questing, trading, and guild activities simultaneously. The current configuration is tuned for ~1,000 connections with a database pool of only 50 connections, which is insufficient for the target scale.

> **Note on DB pool sizing (revised after cache analysis):** The original recommendation of 200+ DB connections was based on a code bug in `CachedCharacterRepository.Update()` that bypasses write-behind caching. After fixing this bug (see companion fix plan), actual DB query volume drops by ~80%, making **50 pool connections + PgBouncer** sufficient for 5000 players. This document reflects both the "before fix" and "after fix" numbers.

---

## 2. Architecture Overview

### Current Architecture

```
Flash Client → RTMPE (encrypted RTMP) → pkg/rtmp/server_conn.go
    → RPC Dispatcher → Handler → Service → Repository
        → PostgreSQL (pgxpool) / Redis / In-Memory Cache
```

### Key Architectural Facts Discovered

| Component | Detail | Location |
| --- | --- | --- |
| **Connection model** | Goroutine-per-connection (1 goroutine per TCP conn + 2-3 extra per player) | `pkg/rtmp/server.go:56` |
| **RPC handlers** | ~562 registered methods across 20+ domains | `internal/presentation/rtmp/handlers/` |
| **Cache tiers** | HotState (5s Redis sync) → PlayerData (in-memory write-behind) → Redis (2hr TTL) → Postgres | `internal/infrastructure/cache/` |
| **Rate limiting** | Per-connection, per-method token-bucket cooldown (200ms–60s) | `internal/infrastructure/rtmp/dispatcher.go:97-182` |
| **Deployment modes** | monolith (all-in-one), main (gateway), line (game node) | `cmd/gameserver/main.go:110-119` |
| **Current max conns** | 1,000 (config only, not enforced at accept) | `config/config.yaml:49` |
| **Current DB pool** | 50 connections for game DB | `config/config.yaml:29` |

### Cache Hit Rate Analysis (Critical for DB Sizing)

The server uses a **3-tier write-behind cache** that eliminates ~99% of read queries for active players:

```bash
Tier 1: HotState (in-memory)  → position, HP/MP, buffs — synced to Redis every 5s
Tier 2: PlayerData (in-memory) → full char + items + skills + pets + quests — write-behind, flushed every 60s
Tier 3: Redis                 → full player snapshot, 2hr TTL
Tier 4: PostgreSQL            → source of truth
```

**Read operations during active gameplay: ALL CACHE HITS (~0 DB queries)**

| Operation | Cache? | Notes |
| --- | --- | --- |
| Position updates (udcp/udcr/toMovable) | ✅ 100% cache | `UpdatePosition()` is cache-only |
| Item move/swap/stack/drop | ✅ 100% cache | `CachedItemRepository.*` = cache-only |
| Get character/items/skills/pets | ✅ 100% cache | From PlayerData in-memory map |
| Combat actions (skill use, turns) | ✅ 100% cache | Pure in-memory Battle objects |
| Scene login/change | ✅ 100% cache | `GetByID()` → PlayerData lookup |

**Write operations: ONE BUG causes most DB traffic**

`CachedCharacterRepository.Update()` (`cached_character_repo.go:52-57`) does **immediate double-write** instead of write-behind:

```go
// CURRENT (BUG) — writes to DB on every call:
func (r *CachedCharacterRepository) Update(ctx, char) error {
    data.SetCharacter(char)              // update cache
    return r.delegate.Update(ctx, char)  // ❌ IMMEDIATE FULL-ROW DB WRITE
}
```

Compare with the correct pattern used by `CachedItemRepository.Update()` (`cached_item_repo.go:178-194`):

```go
// CORRECT — write-behind only:
func (r *CachedCharacterRepository) Update(ctx, it) error {
    data.SetItem(it)   // cache + mark dirty
    return nil          // ✅ NO DB hit, waits for SaveAllDirty every 60s
}
```

**This single bug causes ~50+ call sites to hit DB immediately**, including every battle end, equip change, item use, and level-up.

**After fixing this bug + enabling CachedQuestRepo:**

| Metric | Before Fix | After Fix |
| --- | --- | --- |
| DB queries/sec at 5000 players | ~800–3,000 | ~100–400 |
| Pool connections needed | 200+ | **30–50** |
| Remaining DB sources | Char update leaks | Create() needs ID, SaveAllDirty batch flush |

### Per-Player Memory Footprint

| Data Structure | Size per Player | ×5000 Total |
| --- | --- | --- |
| PlayerData cache (char + items + skills + pets + quests) | ~100 KB | ~500 MB |
| Connection struct + RTMP buffers | ~10 KB | ~50 MB |
| HotState (HP/MP/position/buffs) | ~1 KB | ~5 MB |
| Charactor (scene representation) | ~2 KB | ~10 MB |
| GameData static cache (shared, read-only) | N/A | ~150 MB |
| GC pressure + JSON serialization overhead | N/A | ~300–500 MB |
| **TOTAL ESTIMATED** | ~115 KB avg | **~1–1.2 GB minimum** |

**Recommendation: 4 GB RAM minimum, 8 GB recommended for headroom.**

---

## 3. Three Deployment Options

### Option A: Minimum (All-in-One VPS)

Single VPS running everything — game server, PostgreSQL, Redis.

```sh
┌─────────────────────────────────────────────────────┐
│  Single VPS                                         │
│  ┌───────────┬───────────┬────────────┬──────────┐  │
│  │ 4 vCPU    │  8 GB RAM │ 100 GB NVMe│ 10 TB BW │  │
│  └───────────┴───────────┴────────────┴──────────┘  │
│                                                     │
│  ┌──────────┐  ┌───────────┐  ┌──────────┐          │
│  │ mcgame   │  │ Postgres  │  │  Redis   │          │
│  │ server   │  │ +PgBouncer│  │  7-alpine│          │
│  │ :1935    │  │ :5432     │  │  1GB max │          │
│  │ :8080    │  │ pool=50*  │  │          │          │
│  │ :2112    │  │           │  │          │          │
│  └──────────┘  └───────────┘  └──────────┘          │
│                                                     │
│  * After cache bug fix. Use pool=200 if unfixed.    │
└─────────────────────────────────────────────────────┘
```

#### Configuration

```yaml
# config/config.yaml — Option A (AFTER cache bug fix)

auth_database:
  host: "localhost"
  port: 5432
  max_connections: 20
  max_idle_conns: 8
  conn_max_lifetime: 30m

database:
  host: "localhost"
  port: 5432
  max_connections: 50              # After fix: 50 is enough (was 200 in original estimate)
  max_idle_conns: 15
  conn_max_lifetime: 30m

redis:
  addr: "localhost:6379"
  pool_size: 100

server:
  max_connections: 6000           # ↑ from 1000
  cleanup_interval: 15s
  connection_timeout: 60s

performance:
  debug_log_player_data: false    # Disable full JSON dump every 15s
  max_concurrent_rpcs: 500        # Backpressure semaphore
```

#### Docker Compose

```yaml
mcgame-server:
  deploy:
    resources:
      limits:
        memory: 6G
        cpus: "3.5"
  ulimits:
    nofile:
      soft: 65536
      hard: 65536
  sysctls:
    net.core.somaxconn: "16384"
    net.ipv4.tcp_max_syn_backlog: "4096"

postgres:
  deploy:
    resources:
      limits:
        memory: 1.5G
        cpus: "0.5"

redis:
  command: redis-server --maxmemory 1gb --maxmemory-policy allkeys-lru
```

#### PostgreSQL Tuning

```conf
max_connections = 100              # was 300 (after cache fix: fewer conns needed)
shared_buffers = '2GB'
effective_cache_size = '4GB'
work_mem = '32MB'
maintenance_work_mem = '256MB'
random_page_cost = 1.1
default_statistics_target = 100
wal_buffers = '64MB'
checkpoint_completion_target = 0.9
effective_io_concurrency = 200
max_worker_processes = 4
max_parallel_workers_per_gather = 2
max_parallel_workers = 4
max_parallel_maintenance_workers = 2
```

#### PgBouncer Configuration

```ini
[databases]
mcgame_game = host=localhost port=5432 dbname=mcgame_game

[pgbouncer]
pool_mode = transaction
max_client_conn = 200             # was 500 (after cache fix)
default_pool_size = 25            # was 50 (fewer actual PG conns needed)
reserve_pool_size = 10
reserve_pool_timeout = 3
listen_addr = 0.0.0.0
listen_port = 6432
auth_type = md5
auth_file = /etc/pgbouncer/userlist.txt
```

#### Expected Metrics

| Metric | Value | Notes |
| --- | --- | --- |
| Concurrent players | 5,000 | Target |
| Requests/sec (peak) | ~25,000 | Rate limited |
| DB queries/sec | **~100–400** | After cache bug fix (was 5K-8K estimate) |
| RAM usage | ~5–6 GB / 8 GB | ~70% (less GC pressure from fewer DB ops) |
| CPU usage | ~50–70% / 4 cores | Lower than original estimate |
| Latency (p99) | < 200ms | Better — less DB contention |
| **Estimated cost** | **$40–80/month** | Hetzner AMD, Vultr High Freq |

**Risk:** No headroom, DB backup impacts performance, no redundancy.

---

### Option B: Recommended (Separated Game Server & Database)

Two VPSes — dedicated game server and dedicated database server.

```sh
┌───────────────────────────┐       ┌──────────────────────────┐
│  GAME SERVER VPS          │       │  DATABASE VPS            │
│  ┌───────────────────┐    │       │  ┌──────────────────┐    │
│  │ 8 vCPU / 8 GB RAM │    │  LAN  │  │ 4 vCPU / 8GB RAM │    │
│  │                   │    │  <──> │  │                  │    │
│  │ mcgame-server     │    │  1ms  │  │ PostgreSQL 16    │    │
│  │  :1935/:8080      │    │       │  │  :5432           │    │
│  │ Redis (:6379)     │    │       │  │  PgBouncer(:6432)│    │
│  │ Nginx RTMP        │    │       │  │  pg_dump backup  │    │
│  │ Prometheus(:2112) │    │       │  └──────────────────┘    │
│  └───────────────────┘    │       └──────────────────────────┘
└───────────────────────────┘
         │
         │  Internet (RTMP/HTTP)
         ▼
   ┌──────────┐
   │ Players   │
   └──────────┘
```

#### Configuration

```yaml
auth_database:
  host: "${DB_HOST}"
  port: 6432
  max_connections: 50
  max_idle_conns: 15
  conn_max_lifetime: 15m

database:
  host: "${DB_HOST}"
  port: 6432
  max_connections: 100             # After fix: 100 is enough (was 400)
  max_idle_conns: 30
  conn_max_lifetime: 15m

redis:
  addr: "localhost:6379"
  pool_size: 150

server:
  max_connections: 6000
  cleanup_interval: 15s
  connection_timeout: 60s

performance:
  debug_log_player_data: false
  max_concurrent_rpcs: 1000
```

#### Docker Compose — Game Server

```yaml
services:
  mcgame-server:
    build:
      context: .
      dockerfile: Dockerfile
    environment:
      - APP_MODE=monolith
      - DB_HOST=192.168.1.100
      - REDIS_ADDR=localhost:6379
    ports:
      - "1935:1935"
      - "8080:8080"
      - "2112:2112"
    deploy:
      resources:
        limits:
          memory: 7G
          cpus: "7.5"
    ulimits:
      nofile:
        soft: 131072
        hard: 131072
    sysctls:
      - net.core.somaxconn=32768
      - net.ipv4.tcp_max_syn_backlog=8192
      - net.ipv4.tcp_tw_reuse=1
      - net.core.netdev_max_backlog=8192
    restart: unless-stopped

  redis:
    image: redis:7-alpine
    command: >
      redis-server
      --maxmemory 2gb
      --maxmemory-policy allkeys-lru
      --save 900 1
      --save 300 10
      --save 60 10000
      --appendonly yes
      --appendfsync everysec
    volumes:
      - redis-data:/data
    deploy:
      resources:
        limits:
          memory: 2.5G
    restart: unless-stopped

volumes:
  redis-data:
```

#### PostgreSQL Tuning (Dedicated Database VPS)

```conf
max_connections = 500
shared_buffers = '2GB'
effective_cache_size = '6GB'
work_mem = '64MB'
maintenance_work_mem = '512MB'
huge_pages = try
min_wal_size = '2GB'
max_wal_size = '4GB'

max_worker_processes = 4
max_parallel_workers_per_gather = 4
max_parallel_workers = 4

wal_buffers = '128MB'
checkpoint_completion_target = 0.9
max_wal_senders = 3
wal_keep_segments = 0

random_page_cost = 1.1
default_statistics_target = 200
jit = on
cpu_tuple_cost = 0.01
cpu_index_tuple_cost = 0.005
cpu_operator_cost = 0.0025

log_min_duration_statement = 500
log_checkpoints = on
log_connections = on
log_disconnections = on
```

#### PgBouncer Configuration (Database VPS)

```ini
[pgbouncer]
pool_mode = transaction
max_client_conn = 800
default_pool_size = 75
reserve_pool_size = 20
reserve_pool_timeout = 3
listen_addr = 0.0.0.0
listen_port = 6432
auth_type = scram-sha-256
server_reset_query = DISCARD ALL
server_check_query = SELECT 1
server_check_delay = 30
server_lifetime = 3600
server_idle_timeout = 300
query_wait_timeout = 10
client_idle_timeout = 0
client_login_timeout = 30
idle_transaction_timeout = 0
pkt_buf = 4096
listen_backlog = 4096
admin_users = postgres
stats_users = stats

[databases]
mcgame_auth = host=/var/run/postgresql dbname=mcgame_auth
mcgame_game = host=/var/run/postgresql dbname=mcgame_game
```

#### Expected Metrics

| Metric | Value | Notes |
| --- | --- | --- |
| Concurrent players | 5,000 | Target |
| Requests/sec (peak) | ~25,000 | Rate limited |
| DB queries/sec | **~100–400** | After cache bug fix (was 4K-6K estimate) |
| Game Server RAM | ~5–6 GB / 8 GB | ~70%, good headroom |
| Game Server CPU | ~50–70% / 8 cores | Good headroom |
| Database RAM | ~3–4 GB / 8 GB | Less shared_buffers needed |
| Database CPU | ~20–40% / 4 cores | Very healthy |
| Latency (p99) | < 200ms | Better than A |
| Latency (avg) | < 50ms | Good |
| **Estimated cost** | **$120–200/month** | 2× VPS |

**Advantage:** Headroom for spikes, DB backups don't impact game, independent scaling possible.

---

### Option C: Production-Ready (Managed Services)

Dedicated game server with managed PostgreSQL (Supabase), managed Redis (Upstash), full monitoring stack.

```
                          ┌─────────────────┐
                          │   CDN / CloudFlare│
                          └────────┬────────┘
                                   │
                          ┌────────▼────────┐
                          │  Load Balancer   │
                          │  (Nginx/AWS ALB) │
                          └────────┬────────┘
                                   │
                    ┌──────────────┼──────────────┐
                    │              │              │
             ┌──────▼──────┐ ┌────▼─────┐ ┌──────▼──────┐
             │ Game Server │ │ Monitor  │ │ Admin API   │
             │ 8vCPU/8GB   │ │ Grafana  │ │ :8080       │
             │ :1935       │ │ :3000    │ │              │
             │ Prometheus  │ └──────────┘ │              │
             │ :2112       │              │              │
             └──────┬──────┘              │              │
                    │                     │              │
         ┌──────────┼──────────┐         │              │
         │          │          │         │              │
    ┌────▼──┐ ┌────▼────┐ ┌───▼───┐     │              │
    │Redis  │ │Redis    │ │Supabase│     │              │
    │Session│ │Cache    │ │Postgres│     │              │
    │Cluster│ │(Upstash)│ │Managed │     │              │
    └───────┘ └─────────┘ └────────┘     │              │
                                            │              │
┌───────────────────────────────────────────┴──────────────┘
│                    Cloud Provider                             │
└─────────────────────────────────────────────────────────────┘
```

#### Configuration

```yaml
auth_database:
  host: "${SUPABASE_DB_PORT}"
  port: 5432
  max_connections: 30
  max_idle_conns: 10
  conn_max_lifetime: 10m
  ssl_mode: "require"

database:
  host: "${SUPABASE_DB_PORT}"
  port: 6543
  max_connections: 80              # After fix: 80 is enough (was 200)
  max_idle_conns: 25
  conn_max_lifetime: 10m
  ssl_mode: "require"

redis:
  addr: "${UPSTASH_REDIS_URL}"
  pool_size: 200
  tls_enabled: true

server:
  max_connections: 6000
  cleanup_interval: 15s
  connection_timeout: 60s

performance:
  debug_log_player_data: false
  max_concurrent_rpcs: 1000

monitoring:
  prometheus_port: 2112
  metrics_enabled: true
  slow_query_threshold: 500ms
```

#### Docker Compose — Production

```yaml
services:
  mcgame-server:
    build:
      context: .
      dockerfile: Dockerfile
      target: production
    env_file:
      - .env.production
    ports:
      - "1935:1935"
      - "8080:8080"
      - "2112:2112"
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:8080/health"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 30s
    deploy:
      resources:
        limits:
          memory: 7G
          cpus: "7.5"
        replicas: 1
      restart_policy:
        condition: on-failure
        delay: 5s
        max_attempts: 5
    ulimits:
      nofile:
        soft: 131072
        hard: 131072
    sysctls:
      - net.core.somaxconn=32768
      - net.ipv4.tcp_max_syn_backlog=8192
      - net.ipv4.tcp_tw_reuse=1
      - net.core.netdev_max_backlog=8192
      - vm.overcommit_memory=1
    logging:
      driver: json-file
      options:
        max-size: "100m"
        max-file: "3"
    restart: unless-stopped

  prometheus:
    image: prom/prometheus:v2.50.0
    volumes:
      - ./monitoring/prometheus.yml:/etc/prometheus/prometheus.yml
      - prometheus-data:/prometheus
    ports:
      - "9090:9090"
    deploy:
      resources:
        limits:
          memory: 512M
          cpus: "0.5"
    restart: unless-stopped

  grafana:
    image: grafana/grafana:10.4.0
    volumes:
      - grafana-data:/var/lib/grafana
      - ./monitoring/grafana/provisioning:/etc/grafana/provisioning
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=${GRAFANA_ADMIN_PASSWORD}
      - GF_USERS_ALLOW_SIGN_UP=false
    ports:
      - "3000:3000"
    deploy:
      resources:
        limits:
          memory: 512M
          cpus: "0.5"
    depends_on:
      - prometheus
    restart: unless-stopped

volumes:
  prometheus-data:
  grafana-data:
```

#### Monitoring Dashboard Panels

Key Grafana panels for production monitoring:

| Panel | Metrics | Alert Threshold |
| --- | --- | --- |
| Online Players | Active connections | < 4500 warn, < 4000 crit |
| Requests/sec | RPC dispatch rate | > 30k/s warn |
| DB Query Latency (p99) | pgx query duration | > 500ms warn |
| Active Connections | TCP connections | > 5500 warn |
| Error Rate | RPC errors / total | > 1% warn, > 5% crit |
| Redis Ops/sec | SET/GET rate | > 5k/s info |
| Goroutines | runtime.NumGoroutine() | > 30k warn |
| Memory Usage | runtime.MemStats | > 7GB warn |
| GC Pause Time | GC pause ns | > 20ms warn |
| Top RPC Methods | Calls per method | Anomaly detection |
| Cache Hit Rate | PlayerData cache hits | < 90% warn |
| HotState Sync Latency | Redis write time | > 20ms warn |
| Connection Cleanup | Disconnected per cycle | > 100 warn |

#### Expected Metrics

| Metric | Value | Notes |
| --- | --- | --- |
| Concurrent players | 5,000 | Target |
| Availability | 99.9% | Auto-failover |
| Requests/sec (peak) | ~25,000 | No bottleneck |
| DB latency (p95) | < 50ms | Managed optimization |
| Redis latency (p95) | < 5ms | Upstash cluster |
| Recovery time (RTO) | < 5 min | Managed backups |
| Backup retention | 30 days | Supabase included |
| **Estimated cost** | **$300–500/month** | Supabase Pro $250 + DO $50–150 + Upstash free tier |

**Advantage:** Professional grade, auto-everything, focus on game logic not ops.

---

## 4. Comparison Summary

| Criterion | A (Minimum) | B (Recommended) | C (Production) |
| --- | --- | --- | --- |
| **VPS count** | 1 | 2 | 2–3 |
| **Total CPU** | 4 cores | 12 cores | 12+ cores |
| **Total RAM** | 8 GB | 16 GB | 16+ GB |
| **Monthly cost** | $40–80 | $120–200 | $300–500 |
| **5000 players?** | ✅ Viable (after fix) | ✅ Smooth | ✅ Excellent |
| **Headroom** | ~30-40% | ~50%+ | ~60%+ |
| **Redundancy** | ❌ None | ❌ None | ✅ Yes |
| **Auto-backup** | Manual | Manual | ✅ Automatic |
| **Monitoring** | Basic | Good | ✅ Full stack |
| **Complexity** | Low | Medium | High |
| **Best for** | Dev/Staging | Indie production | Commercial |

---

## 5. Required Code Changes (All Options)

Based on codebase analysis, these changes are required regardless of deployment option:

### 5.1 Fix CachedCharacterRepository.Update() — CRITICAL (BUG FIX)

**File:** `internal/infrastructure/cache/cached_character_repo.go:52-57`

**The single most impactful change.** This method currently does immediate double-write (cache + DB) instead of write-behind like all other cached repos. It is called from **50+ handler locations** on every battle end, equip change, item use, level-up, etc.

**Current (buggy):**

```go
func (r *CachedCharacterRepository) Update(ctx context.Context, char *character.Character) error {
    if data := r.cache.GetPlayer(char.ID); data != nil {
        data.SetCharacter(char)           // updates cache
    }
    return r.delegate.Update(ctx, char)   // ❌ IMMEDIATE FULL-ROW DB WRITE
}
```

**Fixed (write-behind):**

```go
func (r *CachedCharacterRepository) Update(ctx context.Context, char *character.Character) error {
    if data := r.cache.GetPlayer(char.ID); data != nil {
        data.SetCharacter(char)           // cache + mark dirty
        return nil                        // ✅ NO immediate DB hit
    }
    return r.delegate.Update(ctx, char)   // fallback: not in cache
}
```

**Impact:** Eliminates ~80% of DB query volume at 5000 players. Reduces required pool from 200+ to 50.

> See companion plan: `docs/plans/2026-04-27_1_CACHE_WRITE_BEHIND_FIX.md` for full implementation details and test plan.

### 5.2 Enable CachedQuestRepository — HIGH

**File:** `cmd/gameserver/main.go:177-178`

Currently the quest repository bypasses cache entirely:

```go
// CURRENT:
// questRepo := cache.NewCachedQuestRepository(playerCache, questRepoBase)
questRepo := questRepoBase   // ← NOT CACHED

// FIXED:
questRepo = cache.NewCachedQuestRepository(playerCache, questRepoBase)
```

`CachedQuestRepository` already exists (`cached_quest_repo.go`) with full read/write caching — it just needs to be wired in. Every monster kill quest check, quest progress update, and quest completion currently hits Postgres directly.

### 5.3 Increase Connection Limit — REQUIRED

**File:** `config/config.yaml:49`

Change `max_connections` from `1000` to `6000`.

### 5.4 Set Appropriate Database Pool Size — REQUIRED

**File:** `config/config.yaml:29`
**File:** `internal/infrastructure/persistence/postgres/db.go`

After fixing #5.1 above: increase `max_connections` from `50` to **50–100** depending on option.
(Original estimate of 200–400 was based on unfixed cache behavior.)

### 5.5 Disable Debug Player Data Logger — HIGH

**File:** `internal/infrastructure/cache/player_cache.go:80-174`

Dumps full JSON of ALL cached players to `/app/player_cache_debug.txt` every 15 seconds. At 5000 players this means marshaling ~500MB of data every 15s. Make it configurable:

```go
if c.logger.Core().Enabled(zap.DebugLevel) {  // only when debug logging enabled
    c.debugLoggerLoop()
}
```

Or add a config flag `performance.debug_log_player_data: false`.

Each RTMP connection uses at least 2 file descriptors (socket + internal). For 6000 connections: minimum 12,000 FDs recommended.

### 5.6 Kernel Parameter Tuning — RECOMMENDED

Add to Docker compose or server startup script:

```bash
sysctl -w net.core.somaxconn=32768
sysctl -w net.ipv4.tcp_max_syn_backlog=8192
sysctl -w net.ipv4.tcp_tw_reuse=1
sysctl -w net.core.netdev_max_backlog=8192
```

### 5.7 Add Performance Config Section — NEW

**File:** `config/config.yaml`

Add a new `performance:` section to centralize tuning parameters:

```yaml
performance:
  debug_log_player_data: false
  max_concurrent_rpcs: 1000
  hot_state_sync_interval: 5s
  player_data_persist_interval: 30s
  broadcast_batch_size: 100
```

---

## 6. Resource Estimation Details

### 6.1 Memory Breakdown

| Component | Per-Player | ×5000 | Notes |
| --- | --- | --- | --- |
| Character entity | 2–5 KB | 10–25 MB | 100+ fields, 30+ currencies, 40+ final stats |
| Items (~250 avg) | 50–125 KB | 250–625 MB | bag+bank+equip+quest+pet+temp |
| Skills (~20) | 4–10 KB | 20–50 MB | Learned skill list |
| Pets (~3–5) | 3–10 KB | 15–50 MB | Captured pets with stats |
| Quests (~15) | 2–5 KB | 10–25 MB | Active quest progress |
| Dirty tracking | 1–2 KB | 5–10 MB | Per-entity dirty flags |
| Connection + session | ~2 KB | ~10 MB | Auth state, rate limits, scene info |
| RTMP I/O buffers | ~8 KB | ~40 MB | 4KB read + 4KB write per conn |
| HotState buffer | ~1 KB | ~5 MB | HP/MP/position/buffs |
| Charactor (scene) | 1–3 KB | 5–15 MB | Scene representation |
| GameData (static, shared) | N/A | 100–200 MB | 90+ tables loaded at startup |
| GC + serialization overhead | N/A | 300–500 MB | JSON encoding, transient allocs |
| **GRAND TOTAL** | **~115 KB avg** | **~665 MB – 1.4 GB** | Use 2× estimate for safety |

### 6.2 CPU Estimation

| Factor | Calculation | Result |
| --- | --- | --- |
| Goroutines | 5000 players × 3-4 goroutines | 15,000–20,000 |
| Goroutine stack (min) | 20,000 × 2 KB initial | ~40 MB |
| RPC dispatch (peak) | 5000 × 5 req/s ÷ rate_limit | ~12,500 actual req/s |
| DB queries (after cache) | 12,500 × 0.3 avg hit ratio | ~3,750 q/s |
| Redis ops (hot state) | 5000 ÷ 5s interval | 1,000 SET/s |
| AMF0 encode/decode | Per-RPC CPU cost | Moderate |
| JSON marshal/unmarshal | Cache persistence | Moderate |
| **Recommended CPU** | With headroom | **4–8 cores** |

### 6.3 Network Bandwidth

| Traffic Type | Per-Player | ×5000 |
| --- | --- | --- |
| RTMP heartbeat | ~0.5 KB/s | 2.5 MB/s |
| Position updates (udcr/udcp) | ~2 KB/s | 10 MB/s |
| Combat/actions | ~5 KB/s | 25 MB/s |
| Scene broadcasts | ~10 KB/s (received) | 50 MB/s received |
| **Total estimated** | ~17.5 KB/s | **~87.5 MB/s (~700 Mbps)** |

**Recommendation:** 1 Gbps network interface minimum. 10 Gbps preferred for Option C.

### 6.4 Storage

| Data | Growth Rate | Monthly |
| --- | --- | --- |
| Player data | ~500 KB/player | 2.5 GB |
| Logs (with rotation) | ~50 MB/day | 1.5 GB |
| Backups (daily, 7-day retention) | ~2 GB × 7 | 14 GB |
| **Total** | | **~18 GB/month** |
| **Recommendation** | | **100 GB NVMe minimum** |

---

## 7. Risks and Mitigations

| Risk | Impact | Probability | Mitigation |
| --- | --- | --- | --- |
| DB connection exhaustion | All players disconnected | High (if misconfigured) | PgBouncer + proper pool sizing |
| Memory OOM kill | Process killed, all dropped | Medium | Set Docker memory limit + swap |
| GC pause spike | Lag spike for all players | Medium | Tune GOGC, avoid large allocations |
| Redis failure | Cache miss storm → DB overload | High | Redis persistence + graceful degradation |
| Network partition | Partial disconnection | Low | Reconnection logic exists in client |
| Sync.Map O(n) scans | Latency spikes during iteration | Medium | Add indexed lookups for common ops |
| Disconnect cascade (serial kick) | Slow shutdown under load | Medium | Parallelize ForceDisconnectAccount |
| BroadcastToAll O(n) | Global message latency | Low (specific events only) | Accept or use pub/sub |

---

## 8. Implementation Priority

### Phase 1: Critical (Must do before going live)

1. Update `config/config.yaml`: max_connections → 6000, DB pool → 200+
2. Disable debug player data logger
3. Add file descriptor limits to Docker config
4. Kernel parameter tuning

### Phase 2: High (Should do before peak events)

1. Add backpressure semaphore to dispatcher
2. Add performance config section
3. Deploy PgBouncer (all options)
4. Set up basic monitoring (Prometheus endpoint already exists)

### Phase 3: Nice to have (Optimization)

1. Object pooling for AMF0 encoders
2. Pre-allocated DTO slices
3. Cached DTOs for static game data
4. Full Grafana dashboard with alerts
5. Load testing with simulated 5000 players
