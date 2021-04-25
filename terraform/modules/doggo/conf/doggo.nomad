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
        image = "ghcr.io/mr-karan/doggo-api:v0.4.0"

        ports = ["http"]

        logging {
          type = "json-file"
          config {
            labels = "com.hashicorp.nomad.alloc_id,com.hashicorp.nomad.job_id,com.hashicorp.nomad.job_name,com.hashicorp.nomad.namespace,com.hashicorp.nomad.node_id,com.hashicorp.nomad.node_name,com.hashicorp.nomad.task_group_name,com.hashicorp.nomad.task_name"
          }
        }
      }

      resources {
        cpu    = 200
        memory = 200
      }
    }
  }
}
