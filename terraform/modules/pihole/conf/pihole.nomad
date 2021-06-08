job "pihole" {
  datacenters = ["hydra"]
  type        = "service"

  group "web" {
    count = 1

    network {
      port "dns" {
        static       = 53
        to           = 53
        host_network = "tailscale"
      }

      port "http" {
        to           = 80
        host_network = "tailscale"
      }

      port "https" {
        to           = 443
        host_network = "tailscale"
      }
    }

    service {
      name = "pihole-admin"
      tags = ["pihole", "admin"]
      port = "http"
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
        image = "pihole/pihole:v5.8.1"

        # Bind the data directory to preserve config.
        mount {
          type     = "bind"
          target   = "/etc/dnsmasq.d"
          source   = "/data/pihole/dnsmasq.d/"
          readonly = false
        }

        mount {
          type     = "bind"
          target   = "/etc/pihole"
          source   = "/data/pihole/conf/"
          readonly = false
        }

        ports = ["http", "https", "dns"]
      }

      env {
        TZ = "Asia/Kolkata"
      }

      resources {
        cpu    = 200
        memory = 100
      }
    }
  }
}
