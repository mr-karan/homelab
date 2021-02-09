job "pihole" {
  datacenters = ["hydra"]
  type = "service"
  group "pihole" {
    count = 1
    network {
      # Ensure that port 53 on host is free to use.
      # Stop `systemd-resolvd` on the host if required.
      port "dns" {
        to = 53
      }
      # Assign a random port for UI and forward to port 80 in container.
      port "http" {
        to = "80"
      }
    }
    service {
      name = "pihole-web"
      tags = ["pihole", "web"]
      port = "http"
      # check {
      #   name     = "alive"
      #   type     = "tcp"
      #   interval = "10s"
      #   timeout  = "2s"
      # }
    }
    restart {
      attempts = 2
      interval = "2m"
      delay = "15s"
      mode = "fail"
    }
    task "app" {
      driver = "docker"
      config {
        image = "pihole/pihole:latest"

        ports = ["http","dns"]
      }
      resources {
        cpu    = 250
        memory = 256
      }
    }
  }
}
