job "restic" {
  datacenters = ["hydra"]
  type        = "batch"

  periodic {
    cron             = "0 * * * *"
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

      config {
        # Since `/data` is owned by `root`, restic needs to be spawned as `root`.
        command = "sudo"
        args    = ["./home/karan/restic-backup/backup.sh"]
      }

      artifact {
        source      = "https://internal.file.server/name-of-my-binary"
        destination = "local/some-directory"
      }

      resources {
        cpu    = 200
        memory = 50
      }
    }
  }
}
