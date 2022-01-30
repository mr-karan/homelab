resource "cloudflare_record" "website" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "@"
  type    = "CNAME"
  ttl     = "1"
  proxied = "false"

  value = "mrkaran.netlify.app"

}

resource "cloudflare_record" "pls" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "pls"
  type    = "A"
  ttl     = "1"
  proxied = "true"
  value   = "139.59.64.199"
}

resource "cloudflare_record" "adguard" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "adguard"
  type    = "A"
  ttl     = "1"
  proxied = "false"
  value   = "100.111.91.100"
}

resource "cloudflare_record" "bookmarks" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "bookmarks"
  type    = "A"
  ttl     = "1"
  proxied = "false"
  value   = "100.111.91.100"
}

resource "cloudflare_record" "feed" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "feed"
  type    = "A"
  ttl     = "1"
  proxied = "false"
  value   = "100.111.91.100"
}

resource "cloudflare_record" "grafana" {
  zone_id = cloudflare_zone.mrkaran_dev.id

  name    = "grafana"
  type    = "A"
  ttl     = "1"
  proxied = "false"
  value   = "100.111.91.100"
}
