# Referred to https://github.com/linuxserver/docker-bookstack
# for config.
resource "docker_container" "bookstack_db" {
  name  = "bookstack_db"
  image = docker_image.mariadb.latest

  volumes {
    host_path      = "/data/bookstack"
    container_path = "/config"
  }
  
  env = [
    "TZ=Asia/Kolkata",
    "MYSQL_DATABASE=bookstackapp",
    "MYSQL_USER=bookstack",
    "MYSQL_PASSWORD=${var.bookstack_mariadb_password}",
    "PUID=1000",
    "PGID=1000"
  ]

  networks_advanced  {
    name    = docker_network.bookstack.name
  }

  restart               = "unless-stopped"
  destroy_grace_seconds = 30
  must_run              = true
}
