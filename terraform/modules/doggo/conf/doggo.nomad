job "doggo" {
  datacenters = ["hydra"]
  type        = "service"

  group "app" {
    count = 1

    network {
      port "http" {
        to = 8080
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
        name = "doggo-web"
        tags = ["doggo", "web"]
        port = "http"
      }

      config {
        # TODO: use dockerhub for now, ghcr giving issues.
        image = "mrkaran/doggo-api:v0.3.3"

        ports = ["http"]
      }

      resources {
        cpu    = 200
        memory = 200
      }
    }
  }
}
