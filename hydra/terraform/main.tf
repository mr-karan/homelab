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

module "pihole" {
  source = "./modules/pihole"
  providers = {
    nomad = nomad
  }
}


module "shynet" {
  source                     = "./modules/shynet"
  shynet_postgresql_password = var.shynet_postgresql_password
  shynet_django_secret_key   = var.shynet_django_secret_key
  providers = {
    nomad = nomad
  }
}
