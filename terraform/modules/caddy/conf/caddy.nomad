job "caddy" {
  datacenters = ["hydra"]
  type        = "service"

  group "proxy" {
    count = 1

    network {
      port "http-internal" {
        static       = 80
        to           = 80
        host_network = "tailscale"
      }

      port "https-internal" {
        static       = 443
        to           = 443
        host_network = "tailscale"
      }

      port "https-public" {
        static = 80
        to     = 80

        # host_network = "public"
      }

      port "http-public" {
        static = 443
        to     = 443

        # host_network = "public"
      }
    }

    restart {
      attempts = 2
      interval = "2m"
      delay    = "30s"
      mode     = "fail"
    }

    task "internal" {
      driver = "docker"

      config {
        image = "mrkaran/caddy:latest"

        # Bind the config file to container.
        mount {
          type   = "bind"
          source = "configs"
          target = "/etc/caddy" # Bind mount the template from `NOMAD_TASK_DIR`.
        }

        # Bind the data directory to preserve certs.
        mount {
          type     = "bind"
          target   = "/data"
          source   = "/data/caddy"
          readonly = false
        }

        ports = ["http-internal", "https-internal"]
      }

      resources {
        cpu    = 100
        memory = 100
      }

      template {
        data = <<EOF
${caddyfile_internal}
EOF

        destination = "configs/Caddyfile" # Rendered template.

        # Caddy doesn't support reload via signals as of 
        change_mode = "restart"
      }
    }

    task "public" {
      driver = "docker"

      config {
        image = "mrkaran/caddy:latest"

        # Bind the config file to container.
        mount {
          type   = "bind"
          source = "configs"
          target = "/etc/caddy" # Bind mount the template from `NOMAD_TASK_DIR`.
        }

        # Bind the data directory to preserve certs.
        mount {
          type     = "bind"
          target   = "/data"
          source   = "/data/caddy"
          readonly = false
        }

        ports = ["http-public", "https-public"]
      }

      resources {
        cpu    = 200
        memory = 200
      }

      template {
        data = <<EOF
${caddyfile_public}
EOF

        destination = "configs/Caddyfile" # Rendered template.

        # Caddy doesn't support reload via signals as of 
        change_mode = "restart"
      }
    }
  }
}
