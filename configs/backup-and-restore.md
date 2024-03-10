## Backup and Restore.
https://docs.gitlab.com/ee/administration/backup_restore/

### Backup GitLab instance.
All backups are stored in `./gitlab-data/data/backups` directory.  
Along with the backup following files must be `manually` backed up.  
```
./gitlab-data/config/gitlab.rb
./gitlab-data/config/gitlab-secrets.json
```

#### Triggering Backup.
Run following command to trigger the backup.
This will create a tarball containing each and everything except the 
two files mentioned above.
```bash
docker-compose exec -it gitlab-server gitlab-rake gitlab:backup:create STRATEGY=copy
```

#### Triggering Restore.
Followings conditions must be met for restore.
- A working GitLab instance.
- GitLab instance version and type must be same for old and new.

#### Restore.
- Stop the services.
```bash
docker-compose exec -it gitlab-server gitlab-ctl stop puma
docker-compose exec -it gitlab-server gitlab-ctl stop sidekiq
docker-compose exec -it gitlab-server gitlab-ctl status
```

- Restore/Copy the configuration files.
```
Copy gitlab.rb file to ./gitlab-data/config/gitlab.rb
Copy gitlab-secrets.json file to ./gitlab-data/config/gitlab-secrets.json
```

- Copy the backup tarball for restore.
```
Copy 1699096131_2023_11_04_16.5.1_gitlab_backup.tar file to ./gitlab-data/data/backups directory.
```

- Restore the backup. Update the Tarball name.
```bash
docker-compose exec -it gitlab-server gitlab-rake gitlab:backup:restore BACKUP=1699096131_2023_11_04_16.5.1 --trace
docker-compose exec -it gitlab-server gitlab-ctl restart
docker-compose exec -it gitlab-server gitlab-rake gitlab:check SANITIZE=true
docker-compose exec -it gitlab-server gitlab-rake gitlab:doctor:secrets
docker-compose exec -it gitlab-server gitlab-rake gitlab:artifacts:check
docker-compose exec -it gitlab-server gitlab-rake gitlab:lfs:check
docker-compose exec -it gitlab-server gitlab-rake gitlab:uploads:check
```

#### Once Backup is restored login to the GitLab instance and verify that all configurations and data are restored.

[Automatic Backup Setup](./automatic-backup/README.md)
