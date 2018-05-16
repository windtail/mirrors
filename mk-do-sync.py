#!/usr/bin/env python
# coding: utf-8

import yaml
import click
import os
import sys


def prefix_sequence(prefix, seq):
    for c in seq:
        yield prefix
        yield c


def specs_to_cmdline_args(name, specs):
    yield from ("docker", "run", "--name", name)
    yield from prefix_sequence("-e", specs.get("environment", ()))
    yield from prefix_sequence("-v", specs.get("volumes", ()))
    yield specs["image"]
    yield "/sync.sh"


def specs_to_cmdline(name, specs):
    return " ".join(specs_to_cmdline_args(name, specs))


def to_commands(docker_compose_yml):
    with open(docker_compose_yml) as f:
        containers = yaml.load(f)

    return {name: specs_to_cmdline(name, specs) for name, specs in containers.items()}


@click.command("Create a manually run sync script")
@click.option("-p", "--poweroff/--no-poweroff", default=False, help="Power off the computer after sync")
@click.option("-l", "--list-mirrors/--no-list-mirrors", default=False, help="List all supported mirrors")
@click.argument("mirrors", nargs=-1)
def cli(poweroff, list_mirrors, mirrors):
    cmds = to_commands(os.path.join(
        os.path.dirname(__file__), "docker-compose.yml"))

    if list_mirrors:
        print("Supported mirrors:")
        for name in sorted(cmds.keys()):
            print("\t", name)
        sys.exit(0)

    script = "do-sync.sh"

    with open(script, "wt") as f:
        for mir in mirrors:
            if mir not in cmds:
                click.secho("Unknown mirror: %s" % mir, fg="red")
            else:
                f.write(cmds[mir])
                f.write("\n")

        if poweroff:
            f.write("/sbin/poweroff\n")

    os.chmod(script, 0o766)


if __name__ == '__main__':
    cli()
