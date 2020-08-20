resource "docker_network" "bookstack" {
  name     = "bookstack"
  driver   = "bridge"
  internal = "false"
}
