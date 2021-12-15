# Docker Artifacts

This is a partial guide to creating artifacts using Docker.

# A rough, brief introduction to Docker

To a first approximation, a *Docker container* is a lightweight
virtual machine that only virtualizes userspace; its OS is the host
OS. But it contains its own separate filesystem, its own separate
process table, its own network ports, etc. In practice, Docker
containers are usually specialized to run one (or at most a few)
primary applications rather than being a general-purpose platform that
can run any sort of application.

A *Docker image* is a recipe for initializing a container. It
describes the initial contents of the filesystem and a command to run
when the container is created (for example, a shell or server). Images
are built in reusable *layers*. For example, an image for an Apache
web server might be built with a base (minimal) Linux userspace layer,
then a layer containing the Apache software. An image for a Cassandra
database server might share the same base Linux userspace layer, then
have a layer with the Java JDK, then another layer with the Cassandra
software (scripts and `jar` files).

To build your own image, you should start with a suitable image and
then add a layer containing your specific content. You must write a
*`Dockerfile`* that specifies the starting image and the content to
add.


General resources:
- [Docker: Get Started](https://docs.docker.com/get-started/)
- [Docker: Manage data in Docker (Storage Overview)](https://docs.docker.com/storage/)

- [Creating a docker image for your application](https://www.stereolabs.com/docs/docker/creating-your-image/)
- [Docker Build: A beginner's buide to building Docker images](https://stackify.com/docker-build-a-beginners-guide-to-building-docker-images/)
- [Docker for beginners](https://docker-curriculum.com/) -- Not especially helpful, except maybe commands.

- https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
- https://www.techrepublic.com/article/how-to-create-your-own-docker-image/
- https://docs.docker.com/develop/develop-images/baseimages/

----
# Docker commands

    docker build -t artifact .

    docker run --rm -it artifact
    docker run --rm -it -v artifact-shared:/app/shared artifact

    docker volume inspect artifact-shared  # shows Mountpoint on host filesystem
    docker volume ls
    docker volume rm artifact-shared

    docker ps -a
    docker container prune

    docker image ls
    docker inspect artifact

    docker image save -o artifact.tar artifact
    docker image load -i artifact.tar

----
