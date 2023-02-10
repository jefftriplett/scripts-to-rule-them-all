# Scripts To Rule Them All

This is a WIP repo to form some opinions on my own version of "[Scripts To Rule Them All][Scripts to Rule Them All]" standard for my projects.

I'm using [just][casey/just] instead of Make or external files because it fits my brain better. 
It also allows me to avoid make vs. gmake differences. 

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
    bootstrap # installs/updates all dependencies
    check     # run '--fmt' in "check" mode.
    cibuild   # invoked by continuous integration servers to run tests
    console   # opens a console
    fmt       # format and overwrite justfile
    server    # starts app
    setup     # sets up a project to be used for the first time
    test      # runs tests
    update    # updates a project to run at its current version

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
bootstrap check cibuild console fmt server setup test update

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
        f"### {recipe}\n\n"
        f"```shell\n"
        f"$ just {recipe}\n"
        f"```\n\n"
        f"<details>\n"
        f"<summary>output</summary>\n"
        f"```shell\n"
        f"{recipe_help}\n"
        f"```\n"
        f"</details>\n"
    )
]]] -->
### bootstrap

```shell
$ just bootstrap
```

<details>
<summary>output</summary>
```shell
# installs/updates all dependencies
@bootstrap:
    echo "TODO: bootstrap"
```
</details>

### check

```shell
$ just check
```

<details>
<summary>output</summary>
```shell
# run '--fmt' in "check" mode.
@check:
    just --check --fmt --unstable
```
</details>

### cibuild

```shell
$ just cibuild
```

<details>
<summary>output</summary>
```shell
# invoked by continuous integration servers to run tests
@cibuild:
    echo "TODO: cibuild"
```
</details>

### console

```shell
$ just console
```

<details>
<summary>output</summary>
```shell
# opens a console
@console:
    echo "TODO: console"
```
</details>

### fmt

```shell
$ just fmt
```

<details>
<summary>output</summary>
```shell
# format and overwrite justfile
@fmt:
    just --fmt --unstable
```
</details>

### server

```shell
$ just server
```

<details>
<summary>output</summary>
```shell
# starts app
@server:
    echo "TODO: server"
```
</details>

### setup

```shell
$ just setup
```

<details>
<summary>output</summary>
```shell
# sets up a project to be used for the first time
@setup:
    echo "TODO: setup"
```
</details>

### test

```shell
$ just test
```

<details>
<summary>output</summary>
```shell
# runs tests
@test:
    echo "TODO: test"
```
</details>

### update

```shell
$ just update
```

<details>
<summary>output</summary>
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
