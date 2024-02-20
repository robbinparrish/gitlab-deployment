## Upgrading GitLab to latest Stable Release.

**NOTE** - Before proceeding further please make sure that you have created a backup. If not then follow [Backup and Restore](./backup-and-restore.md) to create a backup.

### Identify the latest released version.
- https://about.gitlab.com/releases/categories/releases/
- https://gitlab.com/gitlab-org/gitlab/-/releases
- https://gitlab.com/gitlab-org/gitlab-runner/-/releases
- https://about.gitlab.com/update/
- https://hub.docker.com/r/gitlab/gitlab-ce/tags
- https://hub.docker.com/r/gitlab/gitlab-runner/tags

Once the latest released version is identified we can update the corresponding version in their respective `docker-compose.yml` files.
</br>[GitLab Server](./../docker-compose.yml)
</br>[GitLab Runner](./../runner-setup-configs/docker-compose.yml)

Once version is updated, recreate container so it can use new version.

### Upgrading the container.
```bash
docker-compose up -d
```

### Checking the container logs.
```bash
docker-compose logs -f
```
