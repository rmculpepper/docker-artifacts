# Recipe for Racket-based Artifacts

## Goals

This recipe assumes that you want to build a Docker image so that:
1. the image contains all of your software and data,
2. and the user interacts with your software solely through the Docker container,
3. but the user can easily access certain files from the host environment.

Point 2 means that your software is suitable for interactive use,
rather than being, for example, a non-interactive command or network
server.

Point 3 means that your software might produce outputs that are
easiest to inspect in the host environment; for example, it might
build a static HTML or PDF document that should be viewed in the host
environment (there's no reason for the Docker image to contain a web
browser or PDF viewer). Another example is a sample input that is
designed to be edited by the user; it may be most convenient to edit
the input from the host environment and then use the artifact
environment to process it.

# Directory contents

Docker metadata:
- `Dockerfile` -- specification for image
- `.dockerignore` -- eg, omit `Dockerfile`, `.git` directories

- `test.rkt`
- `digest-message.rkt`

# Commands

    docker build -t artifact .

