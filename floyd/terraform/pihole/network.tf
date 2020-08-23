resource "docker_network" "pihole" {
  name     = "pihole"
  driver   = "bridge"
  internal = "false"
}
