#!/bin/sh
set -e

if [ "${1:0:1}" = '-' ]; then
	set -- docker "$@"
fi

# if our command is a valid Docker subcommand, let's invoke it through Docker instead
# (this allows for "docker run docker ps", etc)
if docker "$1" --help > /dev/null 2>&1; then
	set -- docker "$@"
fi

exec "$@"
