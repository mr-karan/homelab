resource "nomad_job" "prometheus" {
  jobspec = templatefile("${path.module}/conf/monitoring.nomad", {
    prometheus_config = data.template_file.prometheus-config.rendered
  })
  hcl2 {
    enabled = true
  }
}
