locals {
  # Map of IPs of all the nodes.
  ips = {
    floyd_floating  = module.servers.floating_floyd
    floyd_tailscale = "100.119.138.27"
  }
}

variable "cloudflare_caddy_api_token" {
  type        = string
  description = "API key to edit DNS zones in Cloudflare used by Caddy"
}

variable "shynet_postgresql_password" {
  type        = string
  description = "Password for shynet PostgreSQL server"
}

variable "shynet_django_secret_key" {
  type        = string
  description = "Django secret key generated for Shynet"
}
