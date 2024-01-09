# Scripts To Rule Them All

This is a WIP repo to form some opinions on my own version of the "[Scripts To Rule Them All][Scripts To Rule Them All]" standard for my projects.

I'm using [just][casey/just] instead of Make or external files because it fits my brain better.
It also allows me to avoid `make` vs. `gmake` differences.

When my `just` recipes get too large, I turn them into an external file stored in a `scripts` folder, and I call them from a `just` recipe.
This can be `scripts/bootstrap.sh` or `scripts/bootstrap.py`, depending on which language the recipe is written in.

## Usage
<!-- [[[cog
import cog
import subprocess

help = subprocess.run(
    ["just", "--list"], 
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
    encoding="utf-8",
).stdout

cog.outl(
    f"```shell\n"
    f"❯ just\n"
    f"{help}\n"
    f"```"
)
]]] -->
```shell
❯ just
Available recipes:
    bootstrap *ARGS # installs/updates all dependencies
    check           # run '--fmt' in "check" mode.
    cibuild         # invoked by continuous integration servers to run tests
    console         # opens a console
    docs            # updates our README when justfile changes
    fmt             # format and overwrite justfile
    format          # alias for `fmt`
    lint            # check/lint our project
    server          # starts app
    setup           # sets up a project to be used for the first time
    test            # runs tests
    update          # updates a project to run at its current version

```
<!-- [[[end]]] -->

### Summary view

The summary view might be nice for linting or scripting to see what options are available with less parsing.

<!-- [[[cog
help = subprocess.run(
    ["just", "--summary"], 
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
    encoding="utf-8",
).stdout

cog.outl(
    f"```shell\n"
    f"❯ just --summary\n"
    f"{help}\n"
    f"```"
)
]]] -->
```shell
❯ just --summary
bootstrap check cibuild console docs fmt lint server setup test update

```
<!-- [[[end]]] -->

## Recipes
<!-- [[[cog
help = subprocess.run(
    ["just", "--summary"], 
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
    encoding="utf-8",
).stdout.strip()

recipes = help.split(" ")
for recipe in recipes:
    recipe_help = subprocess.run(
        ["just", "--show", f"{recipe}"], 
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        encoding="utf-8",
    ).stdout.strip()

    cog.outl(
        f"### {recipe} recipe\n\n"
        f"```shell\n"
        f"$ just {recipe}\n"
        f"```\n\n"
        f"<details>\n"
        f"<summary>source</summary>\n\n"
        f"```shell\n"
        f"{recipe_help}\n"
        f"```\n\n"
        f"</details>\n"
    )
]]] -->
### bootstrap recipe

```shell
$ just bootstrap
```

<details>
<summary>source</summary>

```shell
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
```

</details>

### check recipe

```shell
$ just check
```

<details>
<summary>source</summary>

```shell
# run '--fmt' in "check" mode.
@check:
    just --check --fmt --unstable
```

</details>

### cibuild recipe

```shell
$ just cibuild
```

<details>
<summary>source</summary>

```shell
# invoked by continuous integration servers to run tests
@cibuild:
    echo "TODO: cibuild"
```

</details>

### console recipe

```shell
$ just console
```

<details>
<summary>source</summary>

```shell
# opens a console
@console:
    echo "TODO: console"
```

</details>

### docs recipe

```shell
$ just docs
```

<details>
<summary>source</summary>

```shell
# updates our README when justfile changes
@docs:
    pipx run --spec cogapp cog -r README.md
```

</details>

### fmt recipe

```shell
$ just fmt
```

<details>
<summary>source</summary>

```shell
# format and overwrite justfile
@fmt:
    just --fmt --unstable
```

</details>

### lint recipe

```shell
$ just lint
```

<details>
<summary>source</summary>

```shell
# check/lint our project
@lint:
    pipx run --spec cogapp cog --check README.md
```

</details>

### server recipe

```shell
$ just server
```

<details>
<summary>source</summary>

```shell
# starts app
@server:
    echo "TODO: server"
```

</details>

### setup recipe

```shell
$ just setup
```

<details>
<summary>source</summary>

```shell
# sets up a project to be used for the first time
@setup:
    echo "TODO: setup"
```

</details>

### test recipe

```shell
$ just test
```

<details>
<summary>source</summary>

```shell
# runs tests
@test:
    echo "TODO: test"
```

</details>

### update recipe

```shell
$ just update
```

<details>
<summary>source</summary>

```shell
# updates a project to run at its current version
@update:
    echo "TODO: update"
```

</details>

<!-- [[[end]]] -->

## Resources

- [Scripts to Rule Them All][Scripts to Rule Them All]
- [github/scripts-to-rule-them-all][github/scripts-to-rule-them-all]
- [casey/just][casey/just]

[casey/just]: https://github.com/casey/just
[github/scripts-to-rule-them-all]: https://github.com/github/scripts-to-rule-them-all
[Scripts to Rule Them All]: https://github.blog/2015-06-30-scripts-to-rule-them-all/
