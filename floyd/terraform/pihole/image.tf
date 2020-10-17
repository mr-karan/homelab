data "docker_registry_image" "pihole" {
  name = "pihole/pihole:latest"
}

resource "docker_image" "pihole" {
  name          = data.docker_registry_image.pihole.name
  pull_triggers = [data.docker_registry_image.pihole.sha256_digest]
}
