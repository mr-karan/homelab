variable "ips" {
  type = map

  default = {
    tailscale_floyd = "100.101.134.59"
    eth1            = "10.139.120.134"
  }
}

variable "bookstack_mariadb_password" {
  type        = string
  description = "Password for Bookstack MariaDB server"
}
