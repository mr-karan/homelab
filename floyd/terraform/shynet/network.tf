resource "docker_network" "shynet" {
  name     = "shynet"
  driver   = "bridge"
  internal = "false"
}
