resource "docker_container" "caddy" {
  name  = "caddy"
  image = docker_image.caddy.latest

  volumes {
    host_path      = "/data/caddy"
    container_path = "/data"
  }

  # Caddyfile
  upload {
    content = data.template_file.caddyfile.rendered
    file    = "/etc/caddy/Caddyfile"
  }

  ports {
    internal = 443
    external = 443
    ip       = var.ips["tailscale_floyd"]
    protocol = "tcp"
  }

  ports {
    internal = 80
    external = 80
    ip       = var.ips["tailscale_floyd"]
    protocol = "tcp"
  }

  networks_advanced {
    name = docker_network.caddy.name
  }

  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}
