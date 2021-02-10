resource "nomad_job" "app" {
  jobspec = file("${path.module}/conf/pihole.nomad")
  hcl2 {
    enabled = true
  }
}
