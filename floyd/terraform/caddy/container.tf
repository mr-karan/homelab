resource "docker_container" "caddy_public" {
  name  = "caddy_public"
  image = docker_image.caddy.latest

  volumes {
    host_path      = "/data/caddy"
    container_path = "/data"
  }

  # Caddyfile
  upload {
    content = data.template_file.caddyfile_public.rendered
    file    = "/etc/caddy/Caddyfile"
  }

  ports {
    internal = 443
    external = 443
    ip       = var.ips["public"]
    protocol = "tcp"
  }

  ports {
    internal = 80
    external = 80
    ip       = var.ips["public"]
    protocol = "tcp"
  }

  networks_advanced {
    name = docker_network.caddy_public.name
  }

  networks_advanced {
    name = var.monitoring_network
  }

  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}

resource "docker_container" "caddy_internal" {
  name  = "caddy_internal"
  image = docker_image.caddy.latest

  volumes {
    host_path      = "/data/caddy"
    container_path = "/data"
  }

  # Caddyfile
  upload {
    content = data.template_file.caddyfile_internal.rendered
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
    name = docker_network.caddy_internal.name
  }

  # networks_advanced {
  #   name = var.monitoring_network
  # }

  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}
