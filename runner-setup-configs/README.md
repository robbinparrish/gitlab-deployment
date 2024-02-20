## GitLab Runner.
This can be used to setup a GitLab Runner.  
GitLab Runner - https://docs.gitlab.com/runner/

### Followings pre-configuration required before setup.
- This configuration is only applicable for setting a Runner in Container.
  For all types of Runner setup please check [Runner Install](https://docs.gitlab.com/runner/install/).
- Some modification must be applied before starting the setup.
- A default [configuration file](./configs/config.toml) provided here is as a template.  
  Following modifications are required.
    - GITLAB_RUNNER_NAME - gitlab-runner
    - GITLAB_SERVER_URL - https://gitlab.mydomain.com
    - GITLAB_RUNNER_TOKEN - GITLAB_RUNNER_TOKEN

### Following types of runner can be created.
- Shared Runner
- Group Runner
- Project Runner

https://docs.gitlab.com/ee/ci/runners/runners_scope.html

### Creating a Shared Runner.
- Create a Shared Runner from Admin Area of GitLab Instance.  
  During the creation provide the necessary tags and/or also use runner to be used as an untagged if needed.  
  More information can be found [here](https://docs.gitlab.com/ee/ci/runners/runners_scope.html#shared-runners).
- Note down the Runner Token that we will replace it in the `configs/config.toml` file.

### Starting the container.
```bash
docker-compose up -d
```

### Checking the container logs.
```bash
docker-compose logs -f
```

### Registering the Runner.
The above process will also register the runner as we have provided all the info in the configuration file.  
If we do not provide the `config.toml` file then following is the step to register the runner after starting the container.
More information can be found [here](https://docs.gitlab.com/runner/register/?tab=Docker).
```bash
docker-compose exec gitlab-runner gitlab-runner register
```

