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

resource "cloudflare_record" "joplin" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "joplin"
  type    = "A"
  ttl     = "1"
  proxied = "false"
  value   = var.ips["floyd_tailscale"]

}

resource "cloudflare_record" "koadings" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "koadings"
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