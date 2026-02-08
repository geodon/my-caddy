# Caddy + OVH DNS challenge

This repository builds a Docker image for Caddy with the `dns.providers.ovh` plugin, so you can issue SSL/TLS certificates using the DNS challenge.

## Official references

- OVH module for Caddy: https://github.com/caddy-dns/ovh
- Official Caddy Docker image: https://hub.docker.com/_/caddy

## Licenses

- Caddy: Apache-2.0 (https://github.com/caddyserver/caddy/blob/master/LICENSE)
- `caddy-dns/ovh`: MIT (https://github.com/caddy-dns/ovh/blob/main/LICENSE)

## License compliance

This image redistributes Caddy and the `caddy-dns/ovh` plugin under their original licenses. Make sure your use and redistribution comply with Apache-2.0 and MIT license terms.

## Environment variables (OVH)

These variables are used in `Caddyfile.example`:

- `OVH_ENDPOINT`: OVH API endpoint (for example: `ovh-eu`, `ovh-us`, `ovh-ca`).
- `OVH_APPLICATION_KEY`: OVH application key.
- `OVH_APPLICATION_SECRET`: OVH application secret.
- `OVH_CONSUMER_KEY`: OVH consumer key.

Additional variables used by the example:

- `ACME_EMAIL`: contact email for ACME.
- `CADDY_DOMAIN`: site domain used in the `Caddyfile`.

You can copy `.env.example` to `.env` and fill in your values.

## Prepare configuration

```bash
cp .env.example .env
cp Caddyfile.example Caddyfile
```

## Build image

```bash
docker build -t my-caddy-ovh .
```

## Run container

```bash
docker run --rm \
  --env-file .env \
  -p 80:80 \
  -p 443:443 \
  -p 443:443/udp \
  -v "$PWD/Caddyfile:/etc/caddy/Caddyfile:ro" \
  -v caddy_data:/data \
  -v caddy_config:/config \
  my-caddy-ovh
```

## Included files

- `Dockerfile`: multi-stage Caddy build with OVH plugin.
- `Caddyfile.example`: configuration example with `tls { dns ovh { ... } }`.
- `.env.example`: environment variable template.
