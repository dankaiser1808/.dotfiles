#!/bin/bash

set -e

./scripts/brew.sh
./scripts/zsh.sh
./scripts/stow.sh
./scripts/git.sh
./scripts/vscode.sh


echo "All scripts installed successfully!"
