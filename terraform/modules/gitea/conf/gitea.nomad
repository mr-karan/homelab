job "gitea" {
  datacenters = ["hydra"]
  type        = "service"

  group "app" {
    count = 1

    network {
      port "http" {
        to = 3000
      }

      port "ssh" {
        to = 22

        # Need a static assignment for SSH ops.
        static = 4222

        # SSH port on host only exposed to Tailscale IP.
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
        name = "gitea-web"
        tags = ["gitea", "web"]
        port = "http"
      }

      service {
        name = "gitea-ssh"
        tags = ["gitea", "ssh"]
        port = "ssh"
      }

      config {
        image = "gitea/gitea:latest"

        ports = ["http", "ssh"]

        # Bind the config file to container.
        mount {
          type   = "bind"
          source = "local/gitea.ini"
          target = "/data/gitea/conf/app.ini"
        }

        # Bind the data directory to preserve data.
        mount {
          type     = "bind"
          target   = "/data"
          source   = "/data/gitea/"
          readonly = false
        }
      }

      template {
        data = <<EOF
${gitea_config}
EOF

        destination = "local/gitea.ini" # Rendered template.
        change_mode = "restart"

        # HACK:
        # https://github.com/hashicorp/nomad/issues/5020#issuecomment-778608068
        perms = "777"
      }

      env {
        # owner of `/data/gitea` on host.
        USER_UID = 1000
        USER_GID = 1000
      }

      resources {
        cpu    = 200
        memory = 300
      }
    }
  }
}
