#!/bin/bash

set -e

run_script() {
    echo "running $1..."
    ./"$1"

    echo "successful installed $1!"
}

./scripts/brew.sh
./scripts/zsh.sh
./scripts/stow.sh
./scripts/git.sh
./scripts/vscode.sh


echo "All scripts installed successfully!"