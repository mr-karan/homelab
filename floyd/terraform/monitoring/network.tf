resource "docker_network" "monitoring" {
  name     = "monitoring"
  driver   = "bridge"
  internal = "false"
}
