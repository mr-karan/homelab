job "syncthing" {
  datacenters = ["hydra"]
  type        = "service"

  group "app" {
    count = 1

    network {
      port "http" {
        to           = 8384
        host_network = "tailscale"
      }
      port "listen" {
        to           = 22000
        host_network = "tailscale"
      }
      port "discovery" {
        to           = 21027
        host_network = "tailscale"
      }
    }

    restart {
      attempts = 2
      interval = "2m"
      delay    = "30s"
      mode     = "fail"
    }

    task "web" {
      driver = "docker"

      service {
        name = "syncthing-web"
        tags = ["syncthing", "web"]
        port = "http"
      }

      config {
        image = "linuxserver/syncthing:version-v1.18.0"

        # Bind the data directory to preserve config.
        mount {
          type     = "bind"
          target   = "/config"
          source   = "/data/syncthing/config/"
          readonly = false
        }

        mount {
          type     = "bind"
          target   = "/data"
          source   = "/data/syncthing/data/"
          readonly = false
        }

        ports = ["http", "listen", "discovery"]
      }

      env {
        PUID                     = 1000
        PGID                     = 1000
        TZ                       = "Asia/Kolkata"
      }

      resources {
        cpu    = 400
        memory = 400
      }
    }
  }
}
