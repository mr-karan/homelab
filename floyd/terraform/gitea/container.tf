# Referred to https://github.com/pi-hole/docker-pi-hole#quick-start
# for config.
resource "docker_container" "gitea" {
  name  = "gitea"
  image = docker_image.gitea.latest

  volumes {
    host_path      = "/data/gitea/"
    container_path = "/data/"
  }

  upload {
    content = data.template_file.gitea.rendered
    file    = "/data/gitea/conf/app.ini"
  }

  # SSH port on host exposed to Tailscale IP
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
    name = var.caddy_network_public
  }

  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}
