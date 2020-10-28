# Referred to https://github.com/stefanprodan/dockprom/blob/master/docker-compose.yml

resource "docker_container" "grafana" {
  name  = "grafana"
  image = docker_image.grafana.latest

  ports {
    internal = 3000
    external = 9000
    ip       = var.ips["tailscale_floyd"]
    protocol = "tcp"
  }

  volumes {
    host_path      = "/data/grafana"
    container_path = "/var/lib/grafana"
  }

  networks_advanced {
    name = docker_network.monitoring.name
  }

  networks_advanced {
    name = var.caddy_network_internal
  }

  user                  = "root"
  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}
