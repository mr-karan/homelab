resource "hcloud_network" "hydra_private" {
  name     = "hydra-private"
  ip_range = "10.0.0.0/8"
}

resource "hcloud_network_subnet" "hydra_private_subnet_0" {
  network_id   = hcloud_network.hydra_private.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.1.0/24"
}

resource "hcloud_server_network" "main_primary_ntwrk" {
  server_id = hcloud_server.main_primary.id
  subnet_id = hcloud_network_subnet.hydra_private_subnet_0.id
  ip        = "10.0.1.5"
}