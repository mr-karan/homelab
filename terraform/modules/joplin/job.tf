resource "nomad_job" "app" {
  jobspec = templatefile("${path.module}/conf/joplin.nomad", {
    joplin_postgresql_password = var.joplin_postgresql_password
  })
  hcl2 {
    enabled = true
  }
}
