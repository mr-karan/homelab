resource "nomad_job" "app" {
  jobspec = templatefile("${path.module}/conf/doggo.nomad", {
  })
  hcl2 {
    enabled = true
  }
}
