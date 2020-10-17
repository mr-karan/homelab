# Referred to https://github.com/linuxserver/syncthing
# for config.
resource "docker_container" "syncthing" {
  name  = "syncthing"
  image = docker_image.syncthing.latest

  volumes {
    host_path      = "/data/syncthing/data"
    container_path = "/data"
  }

  volumes {
    host_path      = "/data/syncthing/config"
    container_path = "/config"
  }

  ports {
    internal = 8384
    external = 8384
    ip       = var.ips["tailscale_floyd"]
    protocol = "tcp"
  }

  ports {
    internal = 22000
    external = 22000
    ip       = var.ips["tailscale_floyd"]
    protocol = "tcp"
  }

  ports {
    internal = 21027
    external = 21027
    ip       = var.ips["tailscale_floyd"]
    protocol = "udp"
  }

  networks_advanced {
    name = docker_network.syncthing.name
  }

  networks_advanced {
    name = "caddy"
  }

  env = [
    "PUID=1000",
    "PGID=1000",
    "TZ=Asia/Kolkata",
  ]

  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}
