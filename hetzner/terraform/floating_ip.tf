resource "hcloud_floating_ip" "floyd" {
  type = "ipv4"
  server_id = hcloud_server.floyd.id
}

resource "hcloud_floating_ip_assignment" "floyd" {
  floating_ip_id = hcloud_floating_ip.floyd.id
  server_id = hcloud_server.floyd.id
}