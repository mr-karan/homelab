module "hydra-infra" {
  source = "./digitalocean-infra"
  providers = {
    digitalocean = digitalocean
  }
}

module "pihole" {
  source                 = "./pihole"
  ips                    = var.ips
  caddy_network_internal = module.caddy.caddy_network_internal
  providers = {
    docker = docker.floyd
  }
}

module "unbound" {
  source                 = "./unbound"
  ips                    = var.ips
  caddy_network_internal = module.caddy.caddy_network_internal
  providers = {
    docker = docker.floyd
  }
}

module "gitea" {
  source                  = "./gitea"
  ips                     = var.ips
  gitea_secret_key        = var.gitea_secret_key
  gitea_internal_token    = var.gitea_internal_token
  gitea_lfs_jwt_secret    = var.gitea_lfs_jwt_secret
  gitea_oauth2_jwt_secret = var.gitea_oauth2_jwt_secret
  caddy_network_public    = module.caddy.caddy_network_public
  providers = {
    docker = docker.floyd
  }
}

module "bookstack" {
  source                     = "./bookstack"
  ips                        = var.ips
  bookstack_mariadb_password = var.bookstack_mariadb_password
  caddy_network_internal     = module.caddy.caddy_network_internal
  providers = {
    docker = docker.floyd
  }
}

module "caddy" {
  source               = "./caddy"
  ips                  = var.ips
  cloudflare_api_token = var.cloudflare_caddy_api_token
  monitoring_network   = module.monitoring.monitoring_network
  providers = {
    docker = docker.floyd
  }
}

module "monitoring" {
  source                 = "./monitoring"
  ips                    = var.ips
  caddy_network_internal = module.caddy.caddy_network_internal
  providers = {
    docker = docker.floyd
  }
}



module "shynet" {
  source                     = "./shynet"
  ips                        = var.ips
  shynet_postgresql_password = var.shynet_postgresql_password
  shynet_django_secret_key   = var.shynet_django_secret_key
  caddy_network_public       = module.caddy.caddy_network_public
  providers = {
    docker = docker.floyd
  }
}

module "syncthing" {
  source                 = "./syncthing"
  ips                    = var.ips
  caddy_network_internal = module.caddy.caddy_network_internal
  providers = {
    docker = docker.floyd
  }
}

module "cloudflare" {
  source = "./cloudflare"
  ips    = var.ips
  providers = {
    cloudflare = cloudflare
  }
}


### UNUSED SERVICES ###
###      GOODBYE    ###

# module "ripe-atlas" {
#   source = "./ripe-atlas"
#   ips    = var.ips
#   providers = {
#     docker = docker.parvaaz
#   }
# }

# module "firefly" {
#   source                    = "./firefly"
#   ips                       = var.ips
#   firefly_postgres_password = var.firefly_postgres_password
#   firefly_app_key           = var.firefly_app_key
#   caddy_network_internal    = module.caddy.caddy_network_internal
#   providers = {
#     docker = docker.floyd
#   }
# }
