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
      delay    = "15s"
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
            target = "/etc/caddy"
          }
        ]
        ports = ["http", "https"]
      }
      resources {
        cpu    = 100
        memory = 100
      }
      artifact {
        source      = "https://"
        destination = "configs/"
      }
      template {
        source        = "/home/karan/jobs/caddy/Caddyfile.tpl"
        destination   = "configs/Caddyfile"
        change_mode   = "signal"
        change_signal = "SIGINT"
      }
    }
  }
}
