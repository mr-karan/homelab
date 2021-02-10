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
