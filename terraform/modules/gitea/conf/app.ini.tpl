; This file lists the default values used by Gitea
; Sample file: https://github.com/go-gitea/gitea/blob/master/custom/conf/app.example.ini
; Docs: https://docs.gitea.io/en-us/config-cheat-sheet/

APP_NAME = Code by mrkaran
RUN_MODE = prod
RUN_USER = git

[repository]
ROOT = /data/git/repositories

[repository.local]
LOCAL_COPY_PATH = /data/gitea/tmp/local-repo

[repository.upload]
TEMP_PATH = /data/gitea/uploads

[server]
APP_DATA_PATH    = /data/gitea
DOMAIN           = git.mrkaran.dev
SSH_DOMAIN       = koadings.mrkaran.dev
HTTP_PORT        = 3000
ROOT_URL         = https://git.mrkaran.dev/
DISABLE_SSH      = false
SSH_PORT         = 4222
SSH_LISTEN_PORT  = 22
LFS_START_SERVER = true
LFS_CONTENT_PATH = /data/git/lfs
LFS_JWT_SECRET   = "${gitea_lfs_jwt_secret}"
OFFLINE_MODE     = true
LANDING_PAGE     = explore

[ui]
THEME_COLOR_META_TAG = "#6B46C1"

[ui.meta]
AUTHOR = Karan
DESCRIPTION = Karan's self-hosted Gitea instance
KEYWORDS = git, gitea, karan, git.mrkaran.dev, mrkaran

[database]
PATH     = /data/gitea/gitea.db
DB_TYPE  = sqlite3
HOST     = localhost:3306
NAME     = gitea
USER     = root
PASSWD   = 
SCHEMA   = 
SSL_MODE = disable
CHARSET  = utf8

[indexer]
ISSUE_INDEXER_PATH = /data/gitea/indexers/issues.bleve

[session]
PROVIDER_CONFIG = /data/gitea/sessions
PROVIDER        = file
COOKIE_SECURE = true

[picture]
AVATAR_UPLOAD_PATH            = /data/gitea/avatars
REPOSITORY_AVATAR_UPLOAD_PATH = /data/gitea/repo-avatars
DISABLE_GRAVATAR              = false
ENABLE_FEDERATED_AVATAR       = true

[attachment]
PATH = /data/gitea/attachments

[log]
ROOT_PATH = /data/gitea/log
MODE      = file
LEVEL     = info

[security]
INSTALL_LOCK   = true
SECRET_KEY     = "${gitea_secret_key}"
INTERNAL_TOKEN = "${gitea_internal_token}"

[service]
DISABLE_REGISTRATION              = true
REQUIRE_SIGNIN_VIEW               = false
REGISTER_EMAIL_CONFIRM            = false
ENABLE_NOTIFY_MAIL                = false
ALLOW_ONLY_EXTERNAL_REGISTRATION  = false
ENABLE_CAPTCHA                    = false
DEFAULT_KEEP_EMAIL_PRIVATE        = false
DEFAULT_ALLOW_CREATE_ORGANIZATION = true
DEFAULT_ENABLE_TIMETRACKING       = true
NO_REPLY_ADDRESS                  = noreply.localhost

[oauth2]
JWT_SECRET = "${gitea_oauth2_jwt_secret}"

[mailer]
ENABLED = false

[openid]
ENABLE_OPENID_SIGNIN = true
ENABLE_OPENID_SIGNUP = true

[metrics]
ENABLED = true

[cron]
ENABLED = true
RUN_AT_START = false

[cron.archive_cleanup]
RUN_AT_START = true
SCHEDULE = @every 24h
OLDER_THAN = 24h

[cron.update_mirrors]
SCHEDULE = @every 3h

[cron.repo_health_check]
SCHEDULE = @every 24h
TIMEOUT = 60s

[cron.check_repo_stats]
RUN_AT_START = true
SCHEDULE = @every 24h
