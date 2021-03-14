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
        image = "ghcr.io/mr-karan/doggo-api:v0.3.7"

        ports = ["http"]
      }

      resources {
        cpu    = 200
        memory = 200
      }
    }
  }
}
