job "shynet-db" {
  datacenters = ["hydra"]
  type        = "service"

  group "db" {
    count = 1

    network {
      port "db" {
        to           = 5432
        host_network = "tailscale"
      }
    }

    restart {
      attempts = 2
      interval = "2m"
      delay    = "30s"
      mode     = "fail"
    }

    task "db" {
      driver = "docker"

      service {
        name = "shynet-db"
        tags = ["shynet", "db"]
        port = "db"
      }

      config {
        image = "postgres:13"

        # Bind the data directory to preserve config.
        mount {
          type     = "bind"
          target   = "/var/lib/postgresql/data"
          source   = "/data/shynet/db/"
          readonly = false
        }

        ports = ["db"]
      }

      env {
        POSTGRES_DB       = "shynet"
        POSTGRES_USER     = "shynet"
        POSTGRES_PASSWORD = "${shynet_postgresql_password}"
      }

      resources {
        cpu    = 400
        memory = 400
      }
    }
  }
}
