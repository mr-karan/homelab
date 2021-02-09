module "servers" {
  source = "./modules/digitalocean"
  providers = {
    digitalocean = digitalocean
  }
}

module "cloudflare" {
  source = "./modules/cloudflare"
  ips    = local.ips
  providers = {
    cloudflare = cloudflare
  }
}
