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
  value   = "174.138.120.194"
}
