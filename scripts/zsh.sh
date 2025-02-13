#!/bin/bash

set -e

source "${HOME}/.dotfiles/config.cfg"

if ! [ -d "$ZSH" ]; then
    echo "install zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if ! [ -d "$ZSH_P10K_PATH" ]; then
    echo "install p10k"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi

for repo in "${ZSH_PLUGIN_REPOS[@]}"; do
    plugin=$(basename "$repo" | cut  -d . -f 1)
    if ! [ -d "$ZSH_CUSTOM_PLUGINS_PATH/$plugin" ]; then
        echo "Install $plugin"
        git clone "$repo" "$ZSH_CUSTOM_PLUGINS_PATH/$plugin"
    fi
    echo "Plugin: $plugin already exists in $ZSH_CUSTOM_PLUGINS_PATH"
done
