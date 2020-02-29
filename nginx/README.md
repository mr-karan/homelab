# Nginx configuration for my domains

## Setup

`docker-compose up -d` spawns an `nginx` container with the config files mounted at `/etc/nginx/conf.d` path in container.

### Servers

- [ip.mrkaran.dev](conf.d/ip.conf)
- [adguard.mrkaran.dev](conf.d/adguard.conf)

### SSL

All of my domains and subdomains are handled via Cloudflare. SSL certs are issued by Certificate and that's why there's no `listen 443` directives in these `nginx` configurations. Unless ofcourse any site is not behind Cloudflare proxy due to any reason, the SSL certs configuration will be present for the same.

### References

- https://github.com/trimstray/nginx-admins-handbook
- https://nginxconfig.io/
