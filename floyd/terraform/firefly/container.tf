# Referred to https://docs.firefly-iii.org/installation/docker
# for config.
resource "docker_container" "firefly" {
  name  = "firefly"
  image = docker_image.firefly.latest

  volumes {
    host_path      = "/data/firefly/export"
    container_path = "/var/www/firefly-iii/storage/export"
  }

  volumes {
    host_path      = "/data/firefly/upload"
    container_path = "/var/www/firefly-iii/storage/upload"
  }

  networks_advanced {
    name = docker_network.firefly.name
  }

  networks_advanced {
    name = var.caddy_network_internal
  }

  env = [
    "DB_CONNECTION=pgsql",
    "DB_HOST=firefly_db",
    "DB_USERNAME=firefly",
    "DB_PORT=5432",
    "DB_PASSWORD=${var.firefly_postgres_password}",
    "DB_DATABASE=firefly",
    "TZ=Asia/Kolkata",
    "APP_URL=https://firefly.mrkaran.dev",
    "APP_LOG_LEVEL=debug",
    "MAIL_MAILER=log",
    "TRUSTED_PROXIES=**",
    "APP_KEY=${var.firefly_app_key}",
  ]

  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}
