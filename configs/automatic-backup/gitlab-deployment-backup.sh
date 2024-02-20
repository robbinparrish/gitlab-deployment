#!/bin/bash

# Path where the GitLab deployment is configured.
# NEED TO REPLACE THEASE TO CORRECT PATH.
GITLAB_DEPLOYMENT_DIR="${HOME}/gitlab-deployment"
GITLAB_DEPLOYMENT_BACKUP_PATH="${HOME}/gitlab-deployment-backup"

# Backup directory.
BACKUP_TIME=$(date "+%a-%d-%m-%Y-%k-%M")
GITLAB_DEPLOYMENT_BACKUP_DIR="${GITLAB_DEPLOYMENT_BACKUP_PATH}/${BACKUP_TIME}"

cd "${GITLAB_DEPLOYMENT_DIR}" || exit 1

# Backup configuration files.
mkdir -p "${GITLAB_DEPLOYMENT_BACKUP_DIR}"
cp -av ./gitlab-data/config/gitlab.rb ./gitlab-data/config/gitlab-secrets.json "${GITLAB_DEPLOYMENT_BACKUP_DIR}"/

# Garbage Cleanup.
# Uncomment following to also run the garbage cleanup before creating backup.
# docker-compose exec -it gitlab-server gitlab-ctl registry-garbage-collect -m
# sync

# Create backup.
docker-compose exec -it gitlab-server gitlab-rake gitlab:backup:create STRATEGY=copy
mv -fv ./gitlab-data/data/backups/*_gitlab_backup.tar "${GITLAB_DEPLOYMENT_BACKUP_DIR}"/

