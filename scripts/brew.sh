#!/bin/bash

set -e

source "${HOME}/.dotfiles/config.cfg"

if ! which brew &> /dev/null; then
    echo "installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if ! grep -q 'eval "$(/opt/homebrew/bin/brew shellenv)"' "$HOME/.zprofile"; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
    fi
fi

if [[ ! -f $BREW_FORMULA_FILE ]]; then
    echo "File $BREW_FORMULA_FILE not found!"
    exit 1
fi

echo "installing formula homebrew packages"
while IFS= read -r formula_package; do
    if [[ -n  $formula_package ]]; then
        echo "Installing $formula_package"
        brew install --formula "$formula_package"
    fi
done < "$BREW_FORMULA_FILE"

if [[ ! -f $BREW_CASK_FILE ]]; then
    echo "File $BREW_CASK_FILE not found!"
    exit 1
fi

echo "installing cask homebrew packages"
while IFS= read -r cask_package; do
    if [[ -n $cask_package ]]; then
        echo "Installing $cask_package"
        brew install --cask "$cask_package"
    fi
done < "$BREW_CASK_FILE"
