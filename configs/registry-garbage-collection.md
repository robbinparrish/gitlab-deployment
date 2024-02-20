## GitLab Container Registry Garbage Collection.
https://docs.gitlab.com/ee/administration/packages/container_registry.html#container-registry-garbage-collection

Running garbage collection requires the container registry to be in stop state.
If the container registry is not stopped then it will stop it and then run the garbage collection.
This will cause the downtime while the garbage collection runs.
To avoid this we can put the container registry in read-only mode where only pull requests will be accepted.


### Running the garbage collection.
```bash
docker-compose exec -it gitlab-server gitlab-ctl registry-garbage-collect -m
```
