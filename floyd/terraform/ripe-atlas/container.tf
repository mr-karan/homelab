# # Referred to https://github.com/pi-hole/docker-pi-hole#quick-start
# # for config.
# resource "docker_container" "gitea" {
#   name  = "gitea"
#   image = docker_image.gitea.latest

#   mounts {
#     target       = "/var/atlasdata"
#     type = "tmpfs"
#   }

#   log_opts {
#     max-size = "10m"
#   }

#   capabilities {
#     add  = ["SYS_ADMIN","NET_RAW","CHOWN"]
#   }
#   tmpfs {
#     /var/atlasdata
#   }

#   restart               = "unless-stopped"
#   destroy_grace_seconds = 30
#   must_run              = true
# }
