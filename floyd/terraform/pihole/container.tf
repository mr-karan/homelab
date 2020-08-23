# Referred to https://github.com/pi-hole/docker-pi-hole#quick-start
# for config.
resource "docker_container" "pihole" {
  name  = "pihole"
  image = docker_image.pihole.latest

  volumes {
    host_path      = "/data/pihole/etc-pihole/"
    container_path = "/etc/pihole/"
  }

  volumes {
    host_path      = "/data/pihole/etc-dnsmasq.d/"
    container_path = "/etc/dnsmasq.d/"
  }

  # https://tools.ietf.org/html/rfc5966
  # mentions to support TCP for DNS.
  ports {
    internal = 53
    external = 53
    ip       = var.ips["tailscale_floyd"]
    protocol = "tcp"
  }

  # DNS on UDP
  ports {
    internal = 53
    external = 53
    ip       = var.ips["tailscale_floyd"]
    protocol = "udp"
  }

  # Admin Interface (HTTP)
  ports {
    internal = 80
    external = 3000
    ip       = var.ips["tailscale_floyd"]
    protocol = "tcp"
  }

  # Admin Interface (HTTPS)
  ports {
    internal = 443
    external = 3001
    ip       = var.ips["tailscale_floyd"]
    protocol = "tcp"
  }

  # Set timezone
  env = [
    "TZ=Asia/Kolkata",
  ]

  networks_advanced {
    name = docker_network.pihole.name
  }

  networks_advanced {
    name = "caddy"
  }

  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}
