data "docker_registry_image" "gitea" {
  name = "gitea/gitea:1.12.3"
}

resource "docker_image" "gitea" {
  name          = data.docker_registry_image.gitea.name
  pull_triggers = [data.docker_registry_image.gitea.sha256_digest]
}
