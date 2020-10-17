resource "docker_network" "syncthing" {
  name     = "syncthing"
  driver   = "bridge"
  internal = "false"
}
