resource "nomad_job" "app" {
  jobspec = templatefile("${path.module}/conf/caddy.nomad.tpl", {
    caddyfile = data.template_file.caddyfile.rendered
  })
  hcl2 {
    enabled = true
  }
}
