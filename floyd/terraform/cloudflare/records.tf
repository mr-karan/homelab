
resource "cloudflare_record" "firefly" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "firefly"
  type    = "A"
  ttl     = "1"
  proxied = "false"

  value = var.ips["tailscale_floyd"]

}


resource "cloudflare_record" "floyd" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "floyd"
  type    = "A"
  ttl     = "1"
  proxied = "false"

  value = var.ips["floating"]

}


resource "cloudflare_record" "git" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "git"
  type    = "A"
  ttl     = "1"
  proxied = "true"

  value = var.ips["public"]

}


resource "cloudflare_record" "grafana" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "grafana"
  type    = "A"
  ttl     = "1"
  proxied = "false"

  value = var.ips["tailscale_floyd"]

}


resource "cloudflare_record" "pi" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "pi"
  type    = "A"
  ttl     = "1"
  proxied = "false"

  value = var.ips["tailscale_floyd"]

}

resource "cloudflare_record" "koadings" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "koadings"
  type    = "A"
  ttl     = "1"
  proxied = "false"

  value = var.ips["tailscale_floyd"]

}

resource "cloudflare_record" "shynet" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "shynet"
  type    = "A"
  ttl     = "1"
  proxied = "true"

  value = var.ips["public"]

}


resource "cloudflare_record" "sync" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "sync"
  type    = "A"
  ttl     = "1"
  proxied = "false"

  value = var.ips["tailscale_floyd"]

}


resource "cloudflare_record" "tailscale" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "tailscale"
  type    = "A"
  ttl     = "1"
  proxied = "false"

  value = var.ips["tailscale_floyd"]

}


resource "cloudflare_record" "wiki" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "wiki"
  type    = "A"
  ttl     = "1"
  proxied = "false"

  value = var.ips["tailscale_floyd"]

}

resource "cloudflare_record" "nextcloud" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "nextcloud"
  type    = "A"
  ttl     = "1"
  proxied = "false"

  value = var.ips["tailscale_floyd"]

}
