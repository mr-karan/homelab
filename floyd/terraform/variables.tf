variable "ips" {
  type = map

  default = {
    tailscale_floyd   = "100.101.134.59"
    tailscale_parvaaz = "100.94.241.54"
    eth1              = "10.139.120.134"
    anchor            = "10.47.0.5"
    floating          = "139.59.55.13"
    public            = "134.209.159.175"
  }
}

variable "bookstack_mariadb_password" {
  type        = string
  description = "Password for Bookstack MariaDB server"
}

variable "cloudflare_api_token" {
  type        = string
  description = "API key to edit DNS zones in Cloudflare"
}

variable "firefly_postgres_password" {
  type        = string
  description = "Password for Firefly PostgreSQL server"
}

variable "firefly_app_key" {
  type        = string
  description = "32Char token uniquely generated to encrypt Firefly Sessions and Attachments"
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

