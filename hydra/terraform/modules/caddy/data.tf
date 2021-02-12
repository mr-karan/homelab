data "template_file" "caddyfile-internal" {
  template = file("${path.module}/conf/Caddyfile-internal.tpl")
  vars = {
    cloudflare_api_token = var.cloudflare_api_token
  }
}

data "template_file" "caddyfile-public" {
  template = file("${path.module}/conf/Caddyfile-public.tpl")
  vars = {
    cloudflare_api_token = var.cloudflare_api_token
  }
}