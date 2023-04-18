#!/bin/bash
# Usage: combine-repos.sh <name> <id> <author> <url> <repo-url1> <repo-url2> ...

set -eu

NAME="$1"
ID="$2"
AUTHOR="$3"
URL="$4"
shift 4

# downlaod all json files from urls
PACKAGES=$(for url in "$@"; do
    curl -s "$url" | jq '.packages'
done | jq -s add)

echo "$PACKAGES" | jq "{name: \"$NAME\", id: \"$ID\",author: \"$AUTHOR\", url: \"$URL\", packages: .}"
