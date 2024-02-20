# Perform an automatic backup of GitLab Deployment.

## Copy backup script.
```bash
cp -a gitlab-deployment-backup.sh /usr/bin/
chmod +x /usr/bin/gitlab-deployment-backup.sh
```

## Update the configuration path in the backup script.
Update following in `/usr/bin/gitlab-deployment-backup.sh`
```
GITLAB_DEPLOYMENT_DIR="${HOME}/gitlab-deployment"
GITLAB_DEPLOYMENT_BACKUP_PATH="${HOME}/gitlab-deployment-backup"
```

## Copy systemd unit and timer files.
```bash
cp gitlab-deployment-backup.timer gitlab-deployment-backup.service /etc/systemd/system/
```

## Enable the timer.
```bash
systemctl daemon-reload
systemctl enable gitlab-deployment-backup.timer
```