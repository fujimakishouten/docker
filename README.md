# docker
Dockerfiles

## Build
```Shell
docker build [--no-cache] --rm --tag <IMAGE_NAME>[:VERSION] <DOCKER_FILE_DIRECTORY>
```

## Run
```Shell
docker run --interactive --rm --tty --name <NAME> [--publish HOST_PORT:GUEST_PORT] <IMAGE_NAME>
```
