module "servers" {
  source = "./modules/digitalocean"
  providers = {
    digitalocean = digitalocean
  }
}

module "cloudflare" {
  source = "./modules/cloudflare"
  providers = {
    cloudflare = cloudflare
  }
}
