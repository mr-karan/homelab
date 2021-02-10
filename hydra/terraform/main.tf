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

module "caddy" {
  source               = "./modules/caddy"
  cloudflare_api_token = var.cloudflare_caddy_api_token
  providers = {
    nomad = nomad
  }
}
