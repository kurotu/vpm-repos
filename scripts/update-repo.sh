#!/bin/sh
set -eu

DIRNAME=$(dirname "$0")

cd "$DIRNAME/.."
./scripts/combine-repos.sh kurotu kurotu https://kurotu.github.io/vpm-repos/vpm.json \
  https://kurotu.github.io/VRCQuestTools/index.json \
  > vpm.json
