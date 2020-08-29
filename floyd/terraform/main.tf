module "hydra-infra" {
  source = "./digitalocean-infra"
}

module "pihole" {
  source = "./pihole"
  ips    = var.ips
}

module "unbound" {
  source = "./unbound"
  ips    = var.ips
}

module "gitea" {
  source = "./gitea"
  ips    = var.ips
}

module "bookstack" {
  source                     = "./bookstack"
  ips                        = var.ips
  bookstack_mariadb_password = var.bookstack_mariadb_password
}

module "caddy" {
  source               = "./caddy"
  ips                  = var.ips
  cloudflare_api_token = var.cloudflare_api_token
}

module "monitoring" {
  source = "./monitoring"
  ips    = var.ips
}

module "firefly" {
  source                    = "./firefly"
  ips                       = var.ips
  firefly_postgres_password = var.firefly_postgres_password
  firefly_app_key           = var.firefly_app_key
}
