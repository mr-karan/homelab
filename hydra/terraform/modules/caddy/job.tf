resource "nomad_job" "app" {
  jobspec = templatefile("${path.module}/conf/caddy.nomad.tpl", {
    caddyfile_internal = data.template_file.caddyfile-internal.rendered
    caddyfile_public   = data.template_file.caddyfile-public.rendered
  })
  hcl2 {
    enabled = true
  }
}
