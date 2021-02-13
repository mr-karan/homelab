resource "nomad_job" "app" {
  jobspec = "${path.module}/conf/restic.nomad"

  hcl2 {
    enabled = true
  }
}
