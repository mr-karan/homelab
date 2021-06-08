job "monitoring" {
  datacenters = ["hydra"]
  type        = "service"

  group "apps" {
    count = 1

    network {
      mode = "bridge"

      port "grafana-http" {
        to           = 3000
        host_network = "tailscale"
      }

      port "prometheus-http" {
        to           = 9090
        host_network = "tailscale"
      }

    }

    restart {
      attempts = 3
      interval = "5m"
      delay    = "30s"
      mode     = "fail"
    }

    task "grafana" {
      driver = "docker"
      # https://www.nomadproject.io/docs/job-specification/task#user
      # https://grafana.com/docs/grafana/latest/installation/docker/#migrate-to-v51-or-later
      user = "root"

      service {
        name = "grafana-web"
        tags = ["grafana", "web"]
        port = "grafana-http"
      }

      config {
        image = "grafana/grafana:8.0.0-ubuntu"

        ports = ["grafana-http"]

        # Bind the data directory to preserve data.
        mount {
          type     = "bind"
          target   = "/var/lib/grafana"
          source   = "/data/grafana/"
          readonly = false
        }
      }

      resources {
        cpu    = 200
        memory = 300
      }
    }

    task "prometheus" {
      driver = "docker"
      user   = "root"

      service {
        name = "prometheus-web"
        tags = ["prometheus", "web"]
        port = "prometheus-http"
      }

      config {
        image = "prom/prometheus:v2.27.1"

        args = [
          "--config.file=/etc/prometheus/prometheus.yml",
          "--storage.tsdb.path=/prometheus",
          "--web.console.libraries=/etc/prometheus/console_libraries",
          "--web.console.templates=/etc/prometheus/consoles",
          "--storage.tsdb.retention.time=30d",
          "--web.enable-lifecycle"
        ]

        ports = ["prometheus-http"]

        # Bind the data directory to preserve data.
        mount {
          type     = "bind"
          target   = "/prometheus"
          source   = "/data/prometheus/data"
          readonly = false
        }

        # Bind the config file to container.
        mount {
          type     = "bind"
          source   = "local/prometheus.yml"
          target   = "/etc/prometheus/prometheus.yml"
          readonly = true
        }
      }

      template {
        data = <<EOF
${prometheus_config}
EOF

        destination = "local/prometheus.yml" # Rendered template.
        change_mode = "restart"
      }

      resources {
        memory = 400
      }
    }
  }

}
