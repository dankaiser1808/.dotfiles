#!/bin/bash

set -e

source "${HOME}/.dotfiles/config.cfg"

echo "installing vscode extensions"

if [[ ! -f $CODE_EXTENSIONS_FILE ]]; then
    echo "File $CODE_EXTENSIONS_FILE not found!"
    exit 1
fi

while IFS= read -r extension; do
if [[ -n "$extension" ]]; then
    echo "Installing extension: $extension"
    code --install-extension "$extension"
fi
done < "$CODE_EXTENSIONS_FILE"

echo "All extensions processed!"