resource "nomad_job" "app" {
  jobspec = templatefile("${path.module}/conf/shynet.nomad", {
    shynet_django_secret_key   = var.shynet_django_secret_key,
    shynet_postgresql_password = var.shynet_postgresql_password
  })
  hcl2 {
    enabled = true
  }
}
