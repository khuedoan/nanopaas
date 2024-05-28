#!/bin/sh

set -eu

app="${1}"
branch="${2:-master}"
path="./data/source/${app}"

git init "${path}" --initial-branch "${branch}"
cd "${path}"

git config core.hooksPath ../../../../hooks
git config receive.denyCurrentBranch updateInstead
