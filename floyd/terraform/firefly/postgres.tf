# Referred to https://docs.firefly-iii.org/faq/self_hosted#i-want-to-use-postgresql
# for config.
resource "docker_container" "firefly_db" {
  name  = "firefly_db"
  image = docker_image.postgres.latest

  volumes {
    host_path      = "/data/firefly/db"
    container_path = "/var/lib/postgresql/data"
  }

  env = [
    "POSTGRES_DB=firefly",
    "POSTGRES_USER=firefly",
    "POSTGRES_PASSWORD=${var.firefly_postgres_password}",
  ]

  networks_advanced {
    name = docker_network.firefly.name
  }

  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}
