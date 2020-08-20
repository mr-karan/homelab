data "docker_registry_image" "bookstack" {
  name = "linuxserver/bookstack:latest"
}

resource "docker_image" "bookstack" {
  name          = data.docker_registry_image.bookstack.name
  pull_triggers = [data.docker_registry_image.bookstack.sha256_digest]
}

data "docker_registry_image" "mariadb" {
  name = "linuxserver/mariadb:latest"
}

resource "docker_image" "mariadb" {
  name          = data.docker_registry_image.mariadb.name
  pull_triggers = [data.docker_registry_image.mariadb.sha256_digest]
}
