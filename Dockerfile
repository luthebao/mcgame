# Build stage
FROM golang:1.26-alpine AS builder

# Install timezone data (needed for scratch image)
RUN apk add --no-cache tzdata

WORKDIR /app

# Copy go mod files and local packages (needed for replace directives)
COPY go.mod go.sum ./
COPY pkg/ ./pkg/
RUN go mod download

# Copy source code
COPY . .

# Build optimized static binary
# -s: omit symbol table, -w: omit DWARF debug info
RUN CGO_ENABLED=0 GOOS=linux go build \
    -ldflags="-s -w" \
    -o /gameserver ./cmd/gameserver

# Runtime stage - scratch is the smallest possible base (0 bytes)
FROM scratch

WORKDIR /app

# Copy CA certificates for HTTPS (if needed for outbound calls)
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

# Copy timezone data (Go uses embedded tzdata, but this ensures compatibility)
COPY --from=builder /usr/share/zoneinfo /usr/share/zoneinfo

# Copy binary from builder
COPY --from=builder /gameserver /app/gameserver

# Expose RTMP port
EXPOSE 1935

# Run directly (no shell in scratch)
ENTRYPOINT ["/app/gameserver"]
