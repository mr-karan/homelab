# Referred to https://github.com/linuxserver/docker-bookstack
# for config.
resource "docker_container" "bookstack" {
  name  = "bookstack"
  image = docker_image.bookstack.latest

  volumes {
    host_path      = "/data/bookstack"
    container_path = "/config"
  }

  ports {
    internal = 80
    external = 6875
    ip       = var.ips["tailscale_floyd"]
    protocol = "tcp"
  }

  networks_advanced {
    name = docker_network.bookstack.name
  }

  networks_advanced {
    name = "caddy"
  }

  env = [
    "PUID=1000",
    "PGID=1000",
    "DB_HOST=bookstack_db",
    "DB_USER=bookstack",
    "DB_PASS=${var.bookstack_mariadb_password}",
    "DB_DATABASE=bookstackapp",
    "APP_URL=https://wiki.mrkaran.dev",
  ]

  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}
