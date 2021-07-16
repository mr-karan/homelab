resource "cloudflare_record" "floyd" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "floyd"
  type    = "A"
  ttl     = "1"
  proxied = "false"

  value = var.ips["floyd_floating"]

}

resource "cloudflare_record" "nomad" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "nomad"
  type    = "A"
  ttl     = "1"
  proxied = "false"

  value = var.ips["floyd_tailscale"]

}

resource "cloudflare_record" "consul" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "consul"
  type    = "A"
  ttl     = "1"
  proxied = "false"

  value = var.ips["floyd_tailscale"]

}

resource "cloudflare_record" "website" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "@"
  type    = "CNAME"
  ttl     = "1"
  proxied = "false"

  value = "mrkaran.netlify.app"

}

resource "cloudflare_record" "talks" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "talks"
  type    = "CNAME"
  ttl     = "1"
  proxied = "false"

  value = "eager-albattani-dc3cb1.netlify.app"

}

resource "cloudflare_record" "notes" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "notes"
  type    = "CNAME"
  ttl     = "1"
  proxied = "false"

  value = "mr-karan.github.io"

}

resource "cloudflare_record" "pihole" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "pihole"
  type    = "A"
  ttl     = "1"
  proxied = "false"

  value = var.ips["floyd_tailscale"]

}

resource "cloudflare_record" "shynet" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "shynet"
  type    = "A"
  ttl     = "1"
  proxied = "true"
  # TODO: shift to floating IP
  value = var.ips["floyd_public"]

}

resource "cloudflare_record" "koadings" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "koadings"
  type    = "A"
  ttl     = "1"
  proxied = "false"

  value = var.ips["floyd_tailscale"]

}

resource "cloudflare_record" "grafana" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "grafana"
  type    = "A"
  ttl     = "1"
  proxied = "false"

  value = var.ips["floyd_tailscale"]

}

resource "cloudflare_record" "prometheus" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "prometheus"
  type    = "A"
  ttl     = "1"
  proxied = "false"

  value = var.ips["floyd_tailscale"]

}

resource "cloudflare_record" "syncthing" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "syncthing"
  type    = "A"
  ttl     = "1"
  proxied = "false"

  value = var.ips["floyd_tailscale"]

}

resource "cloudflare_record" "git" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "git"
  type    = "A"
  ttl     = "1"
  proxied = "true"

  value = var.ips["floyd_public"]

}


resource "cloudflare_record" "doggo" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "doggo"
  type    = "A"
  ttl     = "1"
  proxied = "true"

  value = var.ips["floyd_public"]

}