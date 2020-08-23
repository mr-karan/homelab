resource "docker_network" "unbound" {
  name     = "unbound"
  driver   = "bridge"
  internal = "false"
}
