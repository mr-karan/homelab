data "docker_registry_image" "pihole" {
  name = "pihole/pihole:v5.1.2"
}

resource "docker_image" "pihole" {
  name          = data.docker_registry_image.pihole.name
  pull_triggers = [data.docker_registry_image.pihole.sha256_digest]
}
