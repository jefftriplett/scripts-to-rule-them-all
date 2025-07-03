set dotenv-load := false

alias format := fmt

# ------------------------------------------------------------
#  Standard justfile recipes
# ------------------------------------------------------------

# show available recipes
@_default:
    just --list

# format and overwrite justfile
@fmt:
    just --fmt --unstable

# ------------------------------------------------------------
#  Scripts To Rule Them All recipes
# ------------------------------------------------------------

# installs/updates all dependencies
bootstrap *ARGS:
    #!/usr/bin/env bash

    set -euo pipefail

    # we use cogapp to update our README
    pip install --upgrade pip uv

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
    uvx --from cogapp cog --check README.md

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
    uvx --from cogapp cog -r README.md
