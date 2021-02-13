job "restic" {
  datacenters = ["hydra"]
  type        = "batch"

  periodic {
    cron             = "0 3 * * *"
    time_zone        = "Asia/Kolkata"
    prohibit_overlap = true
  }

  group "script" {
    count = 1

    restart {
      attempts = 2
      interval = "30m"
      delay    = "1m"
      mode     = "fail"
    }

    task "backup" {
      driver = "exec"
      user   = "karan"

      config {
        # Since `/data` is owned by `root`, restic needs to be spawned as `root`.
        command = "sudo"
        args    = ["local/restic_backup.sh"]

        // command = "sleep"

        // args = ["infinity"]
      }

      env {
        B2_ACCOUNT_ID     = "${restic_b2_account_id}"
        B2_ACCOUNT_KEY    = "${restic_b2_account_key}"
        RESTIC_REPOSITORY = "${restic_repository}"
        RESTIC_PASSWORD   = "${restic_password}"
      }

      template {
        data = <<EOF
#!/usr/bin/env bash

set -Eeuo pipefail

export B2_ACCOUNT_ID="${restic_b2_account_id}"
export B2_ACCOUNT_KEY="${restic_b2_account_key}"
export RESTIC_PASSWORD="${restic_repository}"
export RESTIC_REPOSITORY="${restic_password}"

echo "`date`: Starting backup! $RESTIC_REPOSITORY"

restic backup --verbose --one-file-system --tag nomad /data

echo "`date`: Pruning old backups according to retention policy."

restic forget --verbose --tag nomad --group-by "paths,tags" --keep-daily 7 --keep-weekly 4 --keep-monthly 12 --keep-yearly 3

echo "`date`: Pruning old backups from local storage."

restic prune
EOF

        destination = "local/restic_backup.sh" # Rendered template.
        change_mode = "restart"
        perms       = "755"
      }

      resources {
        cpu    = 200
        memory = 50
      }
    }
  }
}
