resource "docker_network" "caddy_public" {
  name     = "caddy_public"
  driver   = "bridge"
  internal = "false"
}

resource "docker_network" "caddy_internal" {
  name     = "caddy_internal"
  driver   = "bridge"
  internal = "false"
}
