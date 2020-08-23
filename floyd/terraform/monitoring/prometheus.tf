# Referred to https://github.com/stefanprodan/dockprom/blob/master/docker-compose.yml

resource "docker_container" "prometheus" {
  name  = "prometheus"
  image = docker_image.prometheus.latest

  command = [
    "--config.file=/etc/prometheus/prometheus.yml",
    "--storage.tsdb.path=/prometheus",
    "--web.console.libraries=/etc/prometheus/console_libraries",
    "--web.console.templates=/etc/prometheus/consoles",
    "--storage.tsdb.retention.time=30d",
    "--web.enable-lifecycle"
  ]

  volumes {
    host_path      = "/data/prometheus/config"
    container_path = "/etc/prometheus"
  }

  volumes {
    host_path      = "/data/prometheus/data"
    container_path = "/prometheus"
  }

  upload {
    content = "${file("${path.module}/conf/prometheus.yml")}"
    file    = "/etc/prometheus/prometheus.yml"
  }

  networks_advanced {
    name = docker_network.monitoring.name
  }

  user                  = "root"
  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}
