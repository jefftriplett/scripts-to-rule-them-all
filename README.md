# Scripts To Rule Them All

This is a WIP repo to form some opinions on my own version of "[Scripts To Rule Them All][Scripts to Rule Them All]" standard for my projects.

I'm using [just][casey/just] instead of Make or external files because it fits my brain better. 
It also allows me to avoid make vs. gmake differences. 

## Usage

<!-- [[[cog
import cog
import subprocess

result = subprocess.check_output(["just", "--list"], stderr=subprocess.STDOUT)
help = result.decode().strip()
cog.outl("```shell")
cog.outl("❯ just")
cog.outl(f"{help}")
cog.outl("```")
]]] -->
```shell
❯ just
Available recipes:
    bootstrap # installs/updates all dependencies
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
result = subprocess.check_output(["just", "--summary"], stderr=subprocess.STDOUT)
help = result.decode().strip()
cog.outl("```shell")
cog.outl("❯ just --summary")
cog.outl(f"{help}")
cog.outl("```")
]]] -->
```shell
❯ just --summary
bootstrap cibuild console fmt server setup test update
```
<!-- [[[end]]] -->

## Resources

- [Scripts to Rule Them All][Scripts to Rule Them All]
- [github/scripts-to-rule-them-all][github/scripts-to-rule-them-all]
- [casey/just][casey/just]

[casey/just]: https://github.com/casey/just
[github/scripts-to-rule-them-all]: https://github.com/github/scripts-to-rule-them-all
[Scripts to Rule Them All]: https://github.blog/2015-06-30-scripts-to-rule-them-all/
