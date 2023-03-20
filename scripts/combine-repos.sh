#!/bin/sh
# Usage: combine-repos.sh <name> <author> <url> <repo-url1> <repo-url2> ...

set -eu

NAME="$1"
AUTHOR="$2"
URL="$3"
shift 3

# downlaod all json files from urls
PACKAGES=$(for url in "$@"; do
    curl -s "$url" | jq '.packages'
done | jq -s add)

echo "$PACKAGES" | jq "{name: \"$NAME\", author: \"$AUTHOR\", url: \"$URL\", packages: .}"
