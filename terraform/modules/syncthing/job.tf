resource "nomad_job" "app" {
  jobspec = templatefile("${path.module}/conf/app.nomad",{})
  hcl2 {
    enabled = true
  }
}
