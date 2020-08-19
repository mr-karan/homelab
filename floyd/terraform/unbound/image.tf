data "docker_registry_image" "unbound" {
  name = "mvance/unbound:latest"
}

resource "docker_image" "unbound" {
  name          = data.docker_registry_image.unbound.name
  pull_triggers = [data.docker_registry_image.unbound.sha256_digest]
}
