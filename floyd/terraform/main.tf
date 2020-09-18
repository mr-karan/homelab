module "hydra-infra" {
  source = "./digitalocean-infra"
  providers = {
    docker = docker.floyd
  }
}

module "pihole" {
  source = "./pihole"
  ips    = var.ips
  providers = {
    docker = docker.floyd
  }
}

module "unbound" {
  source = "./unbound"
  ips    = var.ips
  providers = {
    docker = docker.floyd
  }
}

module "gitea" {
  source = "./gitea"
  ips    = var.ips
  providers = {
    docker = docker.floyd
  }
}

module "bookstack" {
  source                     = "./bookstack"
  ips                        = var.ips
  bookstack_mariadb_password = var.bookstack_mariadb_password
  providers = {
    docker = docker.floyd
  }
}

module "caddy" {
  source               = "./caddy"
  ips                  = var.ips
  cloudflare_api_token = var.cloudflare_api_token
  providers = {
    docker = docker.floyd
  }
}

module "monitoring" {
  source = "./monitoring"
  ips    = var.ips
  providers = {
    docker = docker.floyd
  }
}

module "firefly" {
  source                    = "./firefly"
  ips                       = var.ips
  firefly_postgres_password = var.firefly_postgres_password
  firefly_app_key           = var.firefly_app_key
  providers = {
    docker = docker.floyd
  }
}

module "ripe-atlas" {
  source = "./ripe-atlas"
  ips    = var.ips
  providers = {
    docker = docker.parvaaz
  }
}
