job "joplin" {
  datacenters = ["hydra"]
  type        = "service"

  group "app" {
    count = 1

    network {
      port "http" {
        to           = 22300
        host_network = "tailscale"
      }

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

    task "web" {
      driver = "docker"

      service {
        name = "joplin-web"
        tags = ["joplin", "web"]
        port = "http"
      }

      config {
        image = "joplin/server:latest"
        ports = ["http"]
      }

      env {
        APP_BASE_URL      = "https://joplin.mrkaran.dev"
        DB_CLIENT         = "pg"
        POSTGRES_DATABASE = "joplin"
        POSTGRES_USER     = "joplin"
        POSTGRES_PASSWORD = "${joplin_postgresql_password}"
      }

      template {
        data = <<EOH
      {{- with service "joplin-db" }}
      {{- with index . 0 }}
      POSTGRES_HOST="{{.Address}}"
      POSTGRES_PORT="{{.Port}}"
      {{- end }}
      {{ end }}
      EOH

        destination = "secrets/file.env"
        env         = true
        change_mode = "restart"
      }

      resources {
        cpu    = 200
        memory = 100
      }
    }

    task "db" {
      driver = "docker"

      service {
        name = "joplin-db"
        tags = ["joplin", "db"]
        port = "db"
      }

      config {
        image = "postgres:13"

        # Bind the data directory to preserve config.
        mount {
          type     = "bind"
          target   = "/var/lib/postgresql/data"
          source   = "/data/joplin/db/"
          readonly = false
        }

        ports = ["db"]
      }

      env {
        POSTGRES_DB       = "joplin"
        POSTGRES_USER     = "joplin"
        POSTGRES_PASSWORD = "${joplin_postgresql_password}"
      }

      # resources {
      #   cpu    = 200
      #   memory = 200
      # }
    }
  }
}
