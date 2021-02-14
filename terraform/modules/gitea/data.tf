data "template_file" "gitea-config" {
  template = file("${path.module}/conf/app.ini.tpl")
  vars = {
    gitea_secret_key        = var.gitea_secret_key
    gitea_internal_token    = var.gitea_internal_token
    gitea_lfs_jwt_secret    = var.gitea_lfs_jwt_secret
    gitea_oauth2_jwt_secret = var.gitea_oauth2_jwt_secret
  }
}