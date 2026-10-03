// Open-sourced by BaoLT

// Prometheus metrics instrumentation for MCGame server.
// Provides HTTP endpoint /metrics for Prometheus scraping.
// Tracks custom application metrics and Go runtime metrics.
package metrics

import (
	"net/http"

	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promauto"
	"github.com/prometheus/client_golang/prometheus/promhttp"
	"go.uber.org/zap"
)

var (
	// Player metrics
	ActivePlayers = promauto.NewGauge(prometheus.GaugeOpts{
		Name: "mcgame_active_players",
		Help: "Number of currently active players",
	})

	CachedPlayers = promauto.NewGauge(prometheus.GaugeOpts{
		Name: "mcgame_cached_players",
		Help: "Number of players in cache",
	})

	// RTMP connection metrics
	RTMPConnections = promauto.NewGauge(prometheus.GaugeOpts{
		Name: "mcgame_rtmp_connections",
		Help: "Number of active RTMP connections",
	})

	RTMPConnectionsTotal = promauto.NewCounter(prometheus.CounterOpts{
		Name: "mcgame_rtmp_connections_total",
		Help: "Total number of RTMP connections",
	})

	// RPC metrics
	RPCRequestsTotal = promauto.NewCounterVec(
		prometheus.CounterOpts{
			Name: "mcgame_rpc_requests_total",
			Help: "Total number of RPC requests",
		},
		[]string{"method"},
	)

	RPCDuration = promauto.NewHistogramVec(
		prometheus.HistogramOpts{
			Name:    "mcgame_rpc_duration_seconds",
			Help:    "RPC request duration in seconds",
			Buckets: prometheus.DefBuckets,
		},
		[]string{"method"},
	)

	// Cache metrics
	CacheHits = promauto.NewCounterVec(
		prometheus.CounterOpts{
			Name: "mcgame_cache_hits_total",
			Help: "Total number of cache hits",
		},
		[]string{"cache_type"},
	)

	CacheMisses = promauto.NewCounterVec(
		prometheus.CounterOpts{
			Name: "mcgame_cache_misses_total",
			Help: "Total number of cache misses",
		},
		[]string{"cache_type"},
	)

	// Database metrics
	DBQueriesTotal = promauto.NewCounterVec(
		prometheus.CounterOpts{
			Name: "mcgame_db_queries_total",
			Help: "Total number of database queries",
		},
		[]string{"operation", "table"},
	)

	DBQueryDuration = promauto.NewHistogramVec(
		prometheus.HistogramOpts{
			Name:    "mcgame_db_query_duration_seconds",
			Help:    "Database query duration in seconds",
			Buckets: prometheus.DefBuckets,
		},
		[]string{"operation", "table"},
	)

	// Item operation metrics
	ItemOperationsTotal = promauto.NewCounterVec(
		prometheus.CounterOpts{
			Name: "mcgame_item_operations_total",
			Help: "Total number of item operations",
		},
		[]string{"operation"},
	)

	ItemOperationErrors = promauto.NewCounterVec(
		prometheus.CounterOpts{
			Name: "mcgame_item_operation_errors_total",
			Help: "Total number of item operation errors",
		},
		[]string{"operation", "error_type"},
	)
)

// StartMetricsServer starts HTTP server for Prometheus metrics endpoint
func StartMetricsServer(port string, logger *zap.Logger) {
	http.Handle("/metrics", promhttp.Handler())

	logger.Info("Starting Prometheus metrics server", zap.String("port", port))

	go func() {
		if err := http.ListenAndServe(":"+port, nil); err != nil {
			logger.Error("Failed to start metrics server", zap.Error(err))
		}
	}()
}
