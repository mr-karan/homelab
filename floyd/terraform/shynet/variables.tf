variable "ips" {
  type = map
}

variable "shynet_postgresql_password" {
  type = string
}
variable "shynet_django_secret_key" {
  type = string
}

variable "caddy_network_public" {}
