# Referred to https://github.com/google/cadvisor
# and https://prometheus.io/docs/guides/cadvisor/.
resource "docker_container" "cadvisor" {
  name  = "cadvisor"
  image = docker_image.cadvisor.latest

  volumes {
    host_path      = "/"
    container_path = "/rootfs"
    read_only      = true
  }

  volumes {
    host_path      = "/var/run"
    container_path = "/var/run"
    read_only      = true
  }


  volumes {
    host_path      = "/sys"
    container_path = "/sys"
    read_only      = true
  }


  volumes {
    host_path      = "/var/lib/docker"
    container_path = "/var/lib/docker"
    read_only      = true
  }

  volumes {
    host_path      = "/dev/disk"
    container_path = "/dev/disk"
    read_only      = true
  }

  networks_advanced {
    name = docker_network.monitoring.name
  }

  devices {
    host_path = "/dev/kmsg"
  }

  privileged            = true
  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}
