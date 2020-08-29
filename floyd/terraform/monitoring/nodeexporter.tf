# Referred to https://github.com/stefanprodan/dockprom/blob/master/docker-compose.yml

resource "docker_container" "nodeexporter" {
  name  = "nodeexporter"
  image = docker_image.nodeexporter.latest

  command = [
    "--path.procfs=/host/proc",
    "--path.rootfs=/rootfs",
    "--path.sysfs=/host/sys",
    "--collector.filesystem.ignored-mount-points=^/(sys|proc|dev|host|etc)($$|/)"
  ]

  volumes {
    host_path      = "/proc"
    container_path = "/host/proc"
    read_only      = true
  }

  volumes {
    host_path      = "/sys"
    container_path = "/host/sys"
    read_only      = true
  }

  volumes {
    host_path      = "/"
    container_path = "/rootfs"
    read_only      = true
  }

  networks_advanced {
    name = docker_network.monitoring.name
  }

  user                  = "root"
  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}
