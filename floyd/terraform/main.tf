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
