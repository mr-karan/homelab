resource "nomad_job" "app" {
  jobspec = templatefile("${path.module}/conf/restic.nomad", {
    restic_b2_account_id  = var.restic_b2_account_id,
    restic_b2_account_key = var.restic_b2_account_key
    restic_repository     = var.restic_repository
    restic_password       = var.restic_password
  })

  hcl2 {
    enabled = true
  }
}
