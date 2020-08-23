data "template_file" "caddyfile" {
  template = "${file("${path.module}/conf/Caddyfile.tpl")}"
  vars = {
    cloudflare_api_token = "${var.cloudflare_api_token}"
  }
}