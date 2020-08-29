resource "docker_network" "firefly" {
  name     = "firefly"
  driver   = "bridge"
  internal = "false"
}
