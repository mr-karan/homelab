# Referred to https://github.com/plankanban/planka/blob/master/docker-compose.yml
# for config.

resource "docker_container" "planka" {
  name  = "planka"
  image = docker_image.planka.latest

  volumes {
    host_path      = "/data/planka/user-avatars"
    container_path = "/app/public/user-avatars"
  }

  volumes {
    host_path      = "/data/planka/project-background-images"
    container_path = "/app/public/project-background-images"
  }

  volumes {
    host_path      = "/data/planka/attachments"
    container_path = "/app/public/attachments"
  }

  ports {
    internal = 1337
    external = 3080
    ip       = var.ips["tailscale_floyd"]
    protocol = "tcp"
  }

  networks_advanced {
    name = docker_network.planka.name
  }

  networks_advanced {
    name = var.caddy_network_internal
  }

  env = [
    "BASE_URL=https://planka.mrkaran.dev",
    "DATABASE_URL=postgresql://planka:${var.planka_postgresql_password}@planka_db/planka",
    "SECRET_KEY=${var.planka_secret_key}",
    "NODE_ENV=production"
  ]

  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}
