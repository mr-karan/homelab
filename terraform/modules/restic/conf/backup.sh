#!/usr/bin/env bash

set -Eeuo pipefail

set -o allexport; source restic.env; set +o allexport

echo "Starting backup!"

restic backup --verbose --one-file-system --tag nomad /data

echo "Pruning old backups according to retention policy."

restic forget --verbose --tag nomad --group-by "paths,tags" --keep-daily 7 --keep-weekly 4 --keep-monthly 12 --keep-yearly 3

echo "Pruning old backups from local storage."

restic prune