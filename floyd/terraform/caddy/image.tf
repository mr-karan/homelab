data "docker_registry_image" "caddy" {
  name = "mrkaran/caddy:latest"
}

resource "docker_image" "caddy" {
  name          = data.docker_registry_image.caddy.name
  pull_triggers = [data.docker_registry_image.caddy.sha256_digest]
}
