variable "ips" {
  type = map
}
variable "gitea_secret_key" {}
variable "gitea_internal_token" {}
variable "gitea_lfs_jwt_secret" {}
variable "gitea_oauth2_jwt_secret" {}

variable "caddy_network_public" {}
