resource "hcloud_floating_ip" "main_primary" {
  type = "ipv4"
  server_id = hcloud_server.main_primary.id
}

resource "hcloud_floating_ip_assignment" "main_primary" {
  floating_ip_id = hcloud_floating_ip.main_primary.id
  server_id = hcloud_server.main_primary.id
}