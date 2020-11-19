resource "docker_network" "planka" {
  name     = "planka"
  driver   = "bridge"
  internal = "false"
}
