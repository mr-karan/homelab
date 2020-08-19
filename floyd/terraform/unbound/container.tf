# Referred to https://github.com/pi-hole/docker-pi-hole#quick-start
# for config.
resource "docker_container" "unbound" {
  name  = "unbound"
  image = docker_image.unbound.latest

  # volumes {
  #   host_path      = "/data/unbound"
  #   container_path = "/opt/unbound/etc/unbound/"
  # }

  # https://tools.ietf.org/html/rfc5966
  # mentions to support TCP for DNS.
  ports {
    internal = 53
    external = 5353
    ip       = var.ips["tailscale_floyd"]
    protocol = "tcp"
  }

  # DNS on UDP
  ports {
    internal = 53
    external = 5353
    ip       = var.ips["tailscale_floyd"]
    protocol = "udp"
  }
  
  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}
