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
