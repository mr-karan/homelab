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


module "doggo" {
  source = "./modules/doggo"
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

module "restic" {
  source                = "./modules/restic"
  restic_b2_account_id  = var.restic_b2_account_id
  restic_b2_account_key = var.restic_b2_account_key
  restic_repository     = var.restic_repository
  restic_password       = var.restic_password
  providers = {
    nomad = nomad
  }
}


module "gitea" {
  source                  = "./modules/gitea"
  gitea_secret_key        = var.gitea_secret_key
  gitea_internal_token    = var.gitea_internal_token
  gitea_lfs_jwt_secret    = var.gitea_lfs_jwt_secret
  gitea_oauth2_jwt_secret = var.gitea_oauth2_jwt_secret
  providers = {
    nomad = nomad
  }
}

module "monitoring" {
  source = "./modules/monitoring"
  providers = {
    nomad = nomad
  }
}

module "syncthing" {
  source = "./modules/syncthing"
  providers = {
    nomad = nomad
  }
}
