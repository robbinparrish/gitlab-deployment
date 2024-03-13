# Use Image From Private Registry.

In GitLab CI environment we may need to use the container image from an external private registry that requires an authentication to pull images or an internal GitLab project with container registry configured that requires an authentication to pull image.
In this case the CI Jobs that runs on runner will not have any authentication info about how to pull images from these registries.  
A full information can be found at [Access Private Registries](https://docs.gitlab.com/ee/ci/docker/using_docker_images.html#access-an-image-from-a-private-container-registry).

The easiest way to achieve this is by using `DOCKER_AUTH_CONFIG` CI/CD variable.

## Prerequisites
- A credential for registry authentication access. This credential provide an access to pull the images. For image push this credential should also provide push access.
- Generating base64 encoded credential.
```bash
echo -n "REGISTRY_USERNAME:REGISTRY_PASSWORD" | base64 -w 0
```
- Set `DOCKER_AUTH_CONFIG` CI/CD variable.
The `DOCKER_AUTH_CONFIG` CI/CD variable can be configured on `project-level` or `group-level` or `system-wide` depending on the needs.
    - Replace the PRIVATE_REGISTRY_URL with registry server url.
    - Replace the BASE64_ENCODED_CREDENTIAL with base64 encoded credential.
```json
{
  "auths": {
    "PRIVATE_REGISTRY_URL": {
      "auth": "BASE64_ENCODED_CREDENTIAL"
    }
  }
}
```
Now any CI/CD jobs that runs on server will automatically get `DOCKER_AUTH_CONFIG` variable configured from runner.

### Setup DOCKER_AUTH_CONFIG for pulling images from GitLab project container registry.
For container registry configured in the GitLab project a `Personal Access Token` should be used with minimal `read_registry` access. For building and pushing image a `write_registry` access is also required.

An internal project that have container registry configured. We can use the images from this registry in some other internal projects inside `.gitlab-ci.yml` file. For building some other images using [Kaniko](https://github.com/GoogleContainerTools/kaniko) or using `docker`.
- [Build Image Using Kaniko](https://docs.gitlab.com/ee/ci/docker/using_kaniko.html)
- [Build Image Using Docker](https://docs.gitlab.com/ee/ci/docker/using_docker_build.html)

#### Prerequisites
- A Group Access Tokens having minimal `Developer` role with `read_registry` and `write_registry` scopes.
- Generating base64 encoded credential.
```bash
echo -n "GROUP_ACCESS_TOKEN:GROUP_ACCESS_TOKEN" | base64 -w 0
```
- Set `DOCKER_AUTH_CONFIG` CI/CD variable.
The `DOCKER_AUTH_CONFIG` CI/CD variable will be configured on `group-level`.
    - Replace the PRIVATE_REGISTRY_URL with registry server url.
    - Replace the BASE64_ENCODED_CREDENTIAL with base64 encoded credential.
```json
{
  "auths": {
    "PRIVATE_REGISTRY_URL": {
      "auth": "BASE64_ENCODED_CREDENTIAL"
    }
  }
}
```

- Creating `config.json` for Kaniko.
```bash
mkdir -p /kaniko/.docker
echo $DOCKER_AUTH_CONFIG > /kaniko/.docker/config.json
```

- Creating `config.json` for docker.
```bash
mkdir -p $HOME/.docker
echo $DOCKER_AUTH_CONFIG > $HOME/.docker/config.json
```
