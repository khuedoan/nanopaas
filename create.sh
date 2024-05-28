#!/bin/sh

# TODO probably not needed from Docker 26

set -eu

app="${1}"
branch="${2:-master}"
path="./data/source/${app}"

git init "${path}" --initial-branch "${branch}"
cd "${path}"

git config core.hooksPath ../../../../hooks
git config receive.denyCurrentBranch updateInstead
