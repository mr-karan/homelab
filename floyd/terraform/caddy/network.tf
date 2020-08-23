resource "docker_network" "caddy" {
  name     = "caddy"
  driver   = "bridge"
  internal = "false"
}