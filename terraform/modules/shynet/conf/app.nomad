job "shynet-app" {
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
        name = "shynet-web"
        tags = ["shynet", "web"]
        port = "http"
      }

      config {
        image = "milesmcc/shynet:v0.9.1"

        # Bind the data directory to preserve config.
        mount {
          type     = "bind"
          target   = "/config"
          source   = "/data/shynet/app/"
          readonly = false
        }

        ports = ["http"]
      }

      env {
        DB_NAME                  = "shynet"
        DB_PORT                  = 5432
        DB_USER                  = "shynet"
        DB_PASSWORD              = "${shynet_postgresql_password}"
        DJANGO_SECRET_KEY        = "${shynet_django_secret_key}"
        TIME_ZONE                = "Asia/Kolkata"
        ACCOUNT_SIGNUPS_ENABLED  = "False"
        SCRIPT_USE_HTTPS         = "True"
        SHOW_SHYNET_VERSION      = "True"
        PERFORM_CHECKS_AND_SETUP = "True"
        PORT                     = 8080
        ONLY_SUPERUSERS_CREATE   = "True"
        NUM_WORKERS              = 2
      }

      template {
        data = <<EOH
      {{- with service "shynet-db" }}
      {{- with index . 0 }}
      DB_HOST="{{.Address}}"
      DB_PORT="{{.Port}}"
      {{- end }}
      {{ end }}
      EOH

        destination = "secrets/file.env"
        env         = true
        change_mode = "restart"
      }

      resources {
        cpu    = 500
        memory = 400
      }
    }
  }
}
