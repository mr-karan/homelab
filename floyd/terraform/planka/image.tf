data "docker_registry_image" "planka" {
  name = "meltyshev/planka:latest"
}

resource "docker_image" "planka" {
  name          = data.docker_registry_image.planka.name
  pull_triggers = [data.docker_registry_image.planka.sha256_digest]
}

data "docker_registry_image" "postgres" {
  name = "postgres:13"
}

resource "docker_image" "postgres" {
  name          = data.docker_registry_image.postgres.name
  pull_triggers = [data.docker_registry_image.postgres.sha256_digest]
}
