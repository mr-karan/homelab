# Referred to https://github.com/milesmcc/shynet/blob/master/GUIDE.md#installation
# for config.
resource "docker_container" "shynet" {
  name  = "shynet"
  image = docker_image.shynet.latest

  volumes {
    host_path      = "/data/shynet"
    container_path = "/config"
  }

  ports {
    internal = 8080
    external = 4080
    ip       = var.ips["tailscale_floyd"]
    protocol = "tcp"
  }

  networks_advanced {
    name = docker_network.shynet.name
  }

  networks_advanced {
    name = var.caddy_network_public
  }

  env = [
    "DB_NAME=shynet",
    "DB_PORT=5432",
    "DB_HOST=shynet_db",
    "DB_USER=shynet",
    "DB_PASSWORD=${var.shynet_postgresql_password}",
    "DJANGO_SECRET_KEY=${var.shynet_django_secret_key}",
    "TIME_ZONE=Asia/Kolkata",
    "ACCOUNT_SIGNUPS_ENABLED=False",
    "SCRIPT_USE_HTTPS=True",
    "SHOW_SHYNET_VERSION=True",
    "PERFORM_CHECKS_AND_SETUP=True",
    "PORT=8080",
    "ONLY_SUPERUSERS_CREATE=True"
  ]

  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}
