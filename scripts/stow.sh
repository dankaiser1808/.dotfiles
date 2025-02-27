#!/bin/bash

set -e

source "${HOME}/.dotfiles/config.cfg"

# backups of dotfiles before running gnu stow is enabled by default.
# in config.cfg SET DOTFILES_BACKUP = FALSE to disable.

if [[ "$STOW_DOTFILES_BACKUP" == "TRUE" ]]; then
    echo "move current dotfiles to ${HOME}/backups"

    mkdir -p backups
    cp -r "$$HOME"/.* "$HOME"/backups

    echo "move vscode settings $HOME/backups"
    cp "$HOME/Library/Application Support/Code/User/keybindings.json" "$HOME/backups" 2>/dev/null
    cp "$HOME/Library/Application Support/Code/User/settings.json" "$HOME/backups" 2>/dev/null

    echo "backups created"
fi

echo "create symlinks with stow"
stow --target="$HOME" --adopt --dir="${HOME}/.dotfiles/stow" .
stow --target="$HOME/.dotfiles/.git/hooks" --adopt --dir="$HOME/.dotfiles" hooks

#since adopt overrides our dotfiles with the existing files and links them, we can reset the repo so the changes from the dotfiles repo will apply.
git reset --hard
