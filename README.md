## GitLab.
This can be used to setup a GitLab Server.  
GitLab - https://about.gitlab.com/

### Followings preconfiguration required before setup.
- By default this configuration uses 22/SSH port and it is defined in the `docker-compose.yml` file.  
  Make sure to check that this port does not conflicts with system.  
  System default 22/SSH port if in use then it must be changed to something else in prior to make it work.
- Update the external URLs for GitLab server and Registry server in the `docker-compose.yml` file.  
  Change follwoing according to the configurations.
    - external_url 'https://gitlab.mydomain.com'
    - gitlab_rails['registry_host'] = "gitlab-registry.mydomain.com"
    - registry_external_url 'https://gitlab-registry.mydomain.com'
- Email configuration for SMTP is by default disabled. If requires then it should be confiugured in the `docker-compose.yml` file.
    - https://docs.gitlab.com/omnibus/settings/smtp.html

### Starting the container.
```bash
docker-compose up -d
```

### Checking the container logs.
```bash
docker-compose logs -f
```

### Once Container is successfully created, we can access the webui in the browser - http://IPADDR_OF_SYSTEM

#### Retrieving the default password for default admin user `root`.
```bash
docker-compose exec -it gitlab-server grep 'Password:' /etc/gitlab/initial_root_password
```

### Setting up first time.
- https://docs.gitlab.com/
- https://about.gitlab.com/releases/categories/releases/

[Additional Configuration](./configs/additional-configs.md)

[Backup and Restore](./configs/backup-and-restore.md)

[Runner Setup](./runner-setup-configs/README.md)
