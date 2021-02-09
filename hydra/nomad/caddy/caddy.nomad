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
        mounts = [
          {
            type   = "bind"
            source = "configs"
            target = "/etc/caddy" # Bind mount the template from `NOMAD_TASK_DIR`.
          }
        ]
        ports = ["http", "https"]
      }
      resources {
        cpu    = 100
        memory = 100
      }
      artifact {
        source      = "https://raw.githubusercontent.com/mr-karan/hydra/nomad/hydra/nomad/caddy/Caddyfile.tpl"
        destination = "configs" # Save to a local path inside `NOMAD_TASK_DIR`.
      }
      template {
        source        = "configs/Caddyfile.tpl" # Downloaded from Artifact.
        destination   = "configs/Caddyfile"     # Rendered template.
        change_mode   = "signal"
        change_signal = "SIGINT"
      }
    }
  }
}
