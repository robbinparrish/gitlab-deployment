## Disclaimer.
The content on this account/repository provided solely for educational and informational purposes.
It is not intended for use in making any kind of business, investment and/or legal decisions.
Although every effort has been made to keep the information up-to-date and accurate, no representations and/or warranties, express and/or implied, completeness, accuracy, reliability, suitability, and/or availability of the content.

## GitLab.
This can be used to setup a GitLab Server.  
GitLab - https://about.gitlab.com/

### Followings pre-configuration required before setup.
- By default this configuration uses 22/SSH port and it is defined in the `docker-compose.yml` file.  
  Make sure to check that this port does not conflicts with system.  
  System default 22/SSH port if in use then it must be changed to something else in prior to make it work.
- Update the external URLs for relevant domains in the `docker-compose.yml` file.
  Change following according to the configurations.
  `NOTE - Following domain names must be added to DNS and resolvable to IP address of the system.`
    - external_url 'https://gitlab.mydomain.com'
    - gitlab_rails['registry_host'] = "gitlab-registry.mydomain.com"
    - gitlab_pages['auth_redirect_uri'] = "https://projects.gitlab-pages.mydomain.com/auth"
    - pages_external_url "https://gitlab-pages.mydomain.com/"
    - registry_external_url 'https://gitlab-registry.mydomain.com'
- Email configuration for SMTP is by default disabled. If requires then it should be configured in the `docker-compose.yml` file.
    - https://docs.gitlab.com/omnibus/settings/smtp.html
- SSL Certificates Configurations.
    - Currently this project uses single default self-signed SSL certificates for `*.mydomain.com` and it is used for all services.
      Replace the SSL certificates in `configs/certs` directory.
    - Update the relevant SSL certificates in the `docker-compose.yml` file.
        - nginx['ssl_certificate'] = "/etc/gitlab/ssl/gitlab.mydomain.com.crt"
        - nginx['ssl_certificate_key'] = "/etc/gitlab/ssl/gitlab.mydomain.com.key"
        - pages_nginx['ssl_certificate'] = "/etc/gitlab/ssl/gitlab.mydomain.com.crt"
        - pages_nginx['ssl_certificate_key'] = "/etc/gitlab/ssl/gitlab.mydomain.com.key"
        - registry_nginx['ssl_certificate'] = "/etc/gitlab/ssl/gitlab.mydomain.com.crt"
        - registry_nginx['ssl_certificate_key'] = "/etc/gitlab/ssl/gitlab.mydomain.com.key"

## Docker Compose Version.
Always validate that [docker-compose](https://github.com/docker/compose/releases/) version is latest.
If not then use the latest released version. As of updating this document `v2.24.0` was latest released version.

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

[Upgrading GitLab](./configs/upgrading-gitlab.md)

[Registry Garbage Collection](./configs/registry-garbage-collection.md)

[Use Image From Private Registry](./configs/use-image-from-private-registry.md)

[Known Issues](./configs/known-issues.md)
  
