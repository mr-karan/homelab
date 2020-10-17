data "docker_registry_image" "cadvisor" {
  name = "gcr.io/cadvisor/cadvisor:v0.36.0"
}

resource "docker_image" "cadvisor" {
  name          = data.docker_registry_image.cadvisor.name
  pull_triggers = [data.docker_registry_image.cadvisor.sha256_digest]
}

data "docker_registry_image" "grafana" {
  name = "grafana/grafana:latest-ubuntu"
}

resource "docker_image" "grafana" {
  name          = data.docker_registry_image.grafana.name
  pull_triggers = [data.docker_registry_image.grafana.sha256_digest]
}

data "docker_registry_image" "prometheus" {
  name = "prom/prometheus:latest"
}

resource "docker_image" "prometheus" {
  name          = data.docker_registry_image.prometheus.name
  pull_triggers = [data.docker_registry_image.prometheus.sha256_digest]
}

data "docker_registry_image" "nodeexporter" {
  name = "prom/node-exporter:v1.0.1"
}

resource "docker_image" "nodeexporter" {
  name          = data.docker_registry_image.nodeexporter.name
  pull_triggers = [data.docker_registry_image.nodeexporter.sha256_digest]
}
