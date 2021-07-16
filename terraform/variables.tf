locals {
  # Map of IPs of all the nodes.
  ips = {
    floyd_floating  = module.servers.floating_floyd
    floyd_tailscale = "100.119.138.27"
    floyd_public    = "68.183.87.4"
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

variable "gitea_secret_key" {
  type        = string
  description = "Global secret key"
}
variable "gitea_internal_token" {
  type        = string
  description = "Secret used to validate communication within Gitea binary"

}
variable "gitea_lfs_jwt_secret" {
  type        = string
  description = "LFS authentication secret"

}
variable "gitea_oauth2_jwt_secret" {
  type        = string
  description = "OAuth2 authentication secret for access and refresh tokens"

}

variable "restic_b2_account_id" {
  type = string
}

variable "restic_b2_account_key" {
  type = string
}

variable "restic_repository" {
  type = string
}

variable "restic_password" {
  type = string
}
