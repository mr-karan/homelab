resource "nomad_job" "app" {
  jobspec = templatefile("${path.module}/conf/gitea.nomad", {
    gitea_config = data.template_file.gitea-config.rendered
  })
  hcl2 {
    enabled = true
  }
}
