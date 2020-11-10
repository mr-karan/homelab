data "docker_registry_image" "shynet" {
  name = "milesmcc/shynet:latest"
}

resource "docker_image" "shynet" {
  name          = data.docker_registry_image.shynet.name
  pull_triggers = [data.docker_registry_image.shynet.sha256_digest]
}

data "docker_registry_image" "postgres" {
  name = "postgres:12"
}

resource "docker_image" "postgres" {
  name          = data.docker_registry_image.postgres.name
  pull_triggers = [data.docker_registry_image.postgres.sha256_digest]
}
