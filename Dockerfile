FROM caddy:builder-alpine AS builder

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    xcaddy build \
    --with github.com/caddy-dns/ovh

FROM caddy:alpine

LABEL org.opencontainers.image.licenses="Apache-2.0,MIT"

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
