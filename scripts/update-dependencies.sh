#!/usr/bin/env bash

# Exit if anything fails
set -eo pipefail

# Change directory to project root
SCRIPT_PATH="$( cd "$( dirname "$0" )" >/dev/null 2>&1 && pwd )"
cd "$SCRIPT_PATH/.." || exit

# Utilities
GREEN='\033[00;32m'

function log () {
    echo -e "$1"
    echo "#########################################################"
    echo "#### $2 "
    echo "#########################################################"
    echo -e "\033[0m"
}

log $GREEN "Cloning private dependencies"

mkdir -p lib

cd lib

rm -rf reflex/

git clone --branch feat/optimisations-and-improvements --depth=1 git@github.com:chroma-org/reflex.git

rm -rf reflex/.git

log $GREEN "Done"