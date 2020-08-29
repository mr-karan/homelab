data "docker_registry_image" "firefly" {
  name = "jc5x/firefly-iii:stable"
}

resource "docker_image" "firefly" {
  name          = data.docker_registry_image.firefly.name
  pull_triggers = [data.docker_registry_image.firefly.sha256_digest]
}

data "docker_registry_image" "postgres" {
  name = "postgres:12"
}

resource "docker_image" "postgres" {
  name          = data.docker_registry_image.postgres.name
  pull_triggers = [data.docker_registry_image.postgres.sha256_digest]
}
