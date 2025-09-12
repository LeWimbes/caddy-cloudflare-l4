# Caddy with Cloudflare DNS plugin & Layer 4 app

[![Build status](https://github.com/lewimbes/caddy-cloudflare-l4/actions/workflows/auto-build-on-change.yml/badge.svg)](https://github.com/lewimbes/caddy-cloudflare-l4/actions/workflows/auto-build-on-change.yml)

Automatically builds and publishes **multi‑architecture Docker images** for [Caddy](https://caddyserver.com) with the [`caddy-dns/cloudflare`](https://github.com/caddy-dns/cloudflare) module and [Layer 4 app](https://github.com/mholt/caddy-l4) pre‑installed.

---

## ✨ Why use this image?

- **ECH‑ready** – Caddy 2.10 introduces [Encrypted ClientHello](https://caddyserver.com/docs/automatic-https#encrypted-clienthello-ech), but it requires a DNS provider module to publish the necessary records. This image is already compiled with the Cloudflare DNS provider, so you can enable ECH right away.
- **Cloudflare DNS provider built-in** – use `tls.dns.cloudflare`, ACME DNS challenges, or ECH without rebuilding Caddy.
- **Layer 4 App built-in** – handle raw TCP & UDP connections.
- **Multi‑arch** – runs on `linux/amd64` and `linux/arm64`.
- **Automatic rebuilds** – whenever upstream `caddy:latest` changes.
- Available from **Docker Hub** (`lewimbes/caddy-cloudflare-l4`) and **GHCR** (`ghcr.io/lewimbes/caddy-cloudflare-l4`).

---

## 📦 Quick start

```bash
# Pull the latest image
docker pull lewimbes/caddy-cloudflare-l4:latest

# Or pin a specific version
docker pull lewimbes/caddy-cloudflare-l4:2.10.0
docker pull lewimbes/caddy-cloudflare-l4:2.10
docker pull lewimbes/caddy-cloudflare-l4:2
```

---

## 🛠️ Build it yourself

```bash
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t lewimbes/caddy-cloudflare-l4:latest .
```

---

## 🤖 How the workflow works

A single GitHub Actions workflow keeps the image fresh:

- **Triggers**

  - Any push to the `main` branch
  - A daily scheduled run that checks whether `caddy:latest` has changed upstream

- **If an update is needed**, the job:

  - builds Caddy with the Cloudflare DNS module for linux/amd64 and linux/arm64,
  - tags the result (latest, full semver, major‑minor, major),
  - pushes to **Docker Hub** and **GHCR**.

See [`auto-build-on-change.yml`](./.github/workflows/auto-build-on-change.yml) for full details.

---

## 📝 License

This repository is licensed under the **Apache License 2.0**.  
[Caddy](https://github.com/caddyserver/caddy), [Caddy-Docker](https://github.com/caddyserver/caddy-docker), the [Cloudflare DNS provider](https://github.com/caddy-dns/cloudflare) and [Layer 4 App](https://github.com/mholt/caddy-l4) are upstream Apache‑2.0 projects.

---

### Official resources

- Upstream project – <https://caddyserver.com>
- Official Docker image – <https://hub.docker.com/_/caddy>
