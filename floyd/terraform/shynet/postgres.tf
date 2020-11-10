# Referred to https://github.com/milesmcc/shynet/blob/master/docker-compose.yml
# for config.
resource "docker_container" "shynet_db" {
  name  = "shynet_db"
  image = docker_image.postgres.latest

  volumes {
    host_path      = "/data/shynet/db"
    container_path = "/var/lib/postgres"
  }

  env = [
    "POSTGRES_DB=shynet",
    "POSTGRES_USER=shynet",
    "POSTGRES_PASSWORD=${var.shynet_postgresql_password}",
  ]

  networks_advanced {
    name = docker_network.shynet.name
  }

  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}
