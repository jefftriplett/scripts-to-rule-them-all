set dotenv-load := false

alias format := fmt

# ------------------------------------------------------------
#  Standard justfile recipes
# ------------------------------------------------------------

@_default:
    just --list

# format and overwrite justfile
@fmt:
    just --fmt --unstable

# ------------------------------------------------------------
#  Scripts To Rule Them All recipes
# ------------------------------------------------------------

# installs/updates all dependencies
@bootstrap *ARGS:
    #!/usr/bin/env bash

    set -euo pipefail

    # we use cogapp to update our README
    pip install cogapp

    # setup our project defaults if they exist
    if [ ! -f ".env" ]; then
        echo ".env created"
        cp .env.example .env
    fi

    if [ ! -f "docker-compose.override.yml" ]; then
        echo "docker-compose.override.yml created"
        cp docker-compose.override.yml.example docker-compose.override.yml
    fi

    # [ ] uncomment if we are using Docker
    # docker-compose {{ ARGS }} build --force-rm

    # [ ] uncomment if we are using pre-commit
    # python -m pip install --upgrade pre-commit

# invoked by continuous integration servers to run tests
@cibuild:
    echo "TODO: cibuild"

# run '--fmt' in "check" mode.
@check:
    just --check --fmt --unstable

# opens a console
@console:
    echo "TODO: console"

# check/lint our project
@lint:
    pipx run --spec cogapp cog --check README.md

# starts app
@server:
    echo "TODO: server"

# sets up a project to be used for the first time
@setup:
    echo "TODO: setup"

# runs tests
@test:
    echo "TODO: test"

# updates a project to run at its current version
@update:
    echo "TODO: update"

# ------------------------------------------------------------
#  Custom recipes for our project
# ------------------------------------------------------------

# updates our README when justfile changes
@docs:
    pipx run --spec cogapp cog -r README.md
