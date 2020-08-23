# Referred to https://github.com/pi-hole/docker-pi-hole#quick-start
# for config.
resource "docker_container" "gitea" {
  name  = "gitea"
  image = docker_image.gitea.latest

  volumes {
    host_path      = "/data/gitea/"
    container_path = "/data/"
  }

  # https://tools.ietf.org/html/rfc5966
  # mentions to support TCP for DNS.
  ports {
    internal = 3000
    external = 4000
    ip       = var.ips["tailscale_floyd"]
    protocol = "tcp"
  }

  # DNS on UDP
  ports {
    internal = 22
    external = 4222
    ip       = var.ips["tailscale_floyd"]
    protocol = "tcp"
  }

  networks_advanced {
    name = docker_network.gitea.name
  }

  networks_advanced {
    name = "caddy"
  }

  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}
