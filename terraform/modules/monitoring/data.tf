data "template_file" "prometheus-config" {
  template = file("${path.module}/conf/prometheus.yml")
}