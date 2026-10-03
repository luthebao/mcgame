# Monitoring

Components: Grafana (port 3000), Prometheus (port 9091), Redis Exporter (port 9121), PostgreSQL Exporters (Game DB port 9187, Auth DB port 9188), RedisInsight (port 5540). App metrics: Main server port 2112, Line Server 1 port 2113.

Application metrics: `mcgame_active_players`, `mcgame_cached_players`, `mcgame_rtmp_connections`, `mcgame_rpc_requests_total{method}`, `mcgame_rpc_duration_seconds{method}`, `mcgame_cache_hits/misses_total{cache_type}`, `mcgame_db_queries_total{operation,table}`, `mcgame_item_operations_total{operation}`, plus Go runtime metrics.

PromQL examples: Cache hit rate `rate(hits[5m]) / (rate(hits[5m]) + rate(misses[5m]))`. Top 5 RPC: `topk(5, sum by (method) (rate(mcgame_rpc_requests_total[5m])))`. P95 latency: `histogram_quantile(0.95, rate(mcgame_rpc_duration_seconds_bucket[5m]))`.

Alerting thresholds: Redis down (`redis_up == 0`), low cache hit (<0.7), DB connection spike (>100), high Redis memory (>1GB), high RPC latency (P95>1s), item errors (>10/s), memory leak (heap>2GB), goroutine leak (>10000).
