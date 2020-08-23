resource "docker_network" "gitea" {
  name     = "gitea"
  driver   = "bridge"
  internal = "false"
}
