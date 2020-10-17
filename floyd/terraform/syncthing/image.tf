data "docker_registry_image" "syncthing" {
  name = "linuxserver/syncthing:latest"
}

resource "docker_image" "syncthing" {
  name          = data.docker_registry_image.syncthing.name
  pull_triggers = [data.docker_registry_image.syncthing.sha256_digest]
}

data "docker_registry_image" "mariadb" {
  name = "linuxserver/mariadb:latest"
}

resource "docker_image" "mariadb" {
  name          = data.docker_registry_image.mariadb.name
  pull_triggers = [data.docker_registry_image.mariadb.sha256_digest]
}
