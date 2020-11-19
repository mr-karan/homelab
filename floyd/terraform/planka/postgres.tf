# Referred to https://github.com/plankanban/planka/blob/master/docker-compose.yml
# for config.
resource "docker_container" "planka_db" {
  name  = "planka_db"
  image = docker_image.postgres.latest

  volumes {
    host_path      = "/data/planka/db"
    container_path = "/var/lib/postgresql/data"
  }

  env = [
    "POSTGRES_DB=planka",
    "POSTGRES_USER=planka",
    "POSTGRES_PASSWORD=${var.planka_postgresql_password}",
  ]

  networks_advanced {
    name = docker_network.planka.name
  }

  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}
