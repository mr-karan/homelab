job "caddy" {
  datacenters = ["hydra"]
  type        = "service"
  group "proxy" {
    count = 1
    network {
      port "http" {
        static = 80
        to     = 80
      }
      port "https" {
        static = 443
        to     = 443
      }
    }
    service {
      name = "caddy-http"
      tags = ["caddy", "http"]
      port = "http"
    }
    service {
      name = "caddy-https"
      tags = ["caddy", "https"]
      port = "https"
    }
    restart {
      attempts = 2
      interval = "2m"
      delay    = "30s"
      mode     = "fail"
    }
    task "app" {
      driver = "docker"
      config {
        image = "mrkaran/caddy:latest"
        # Bind the config file to container.
        mount {
          type   = "bind"
          source = "configs"
          target = "/etc/caddy" # Bind mount the template from `NOMAD_TASK_DIR`.
        }
        # Bind the data directory to preserve certs.
        mount {
          type     = "bind"
          target   = "/data"
          source   = "/data/caddy"
          readonly = false
        }
        ports = ["http", "https"]
      }
      resources {
        cpu    = 100
        memory = 100
      }
      template {
        data          = <<EOF
${caddyfile}
EOF
        destination   = "configs/Caddyfile" # Rendered template.
        change_mode   = "signal"
        change_signal = "SIGINT"
      }
    }
  }
}
