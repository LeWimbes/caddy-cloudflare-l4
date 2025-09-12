FROM --platform=$BUILDPLATFORM caddy:builder AS builder
ARG TARGETOS
ARG TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build --with github.com/caddy-dns/cloudflare --with github.com/mholt/caddy-l4

FROM caddy:latest
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
