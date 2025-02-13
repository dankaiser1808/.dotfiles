#!/bin/bash

set -e

source "${HOME}/.dotfiles/config.cfg"

if [[ $GIT_USER_MAIL == "" ]]; then
    echo "GIT_USER_MAIL not set in config.cfg."
    exit 0
fi

if [[ $GIT_GENERATE_SSH_KEY == "TRUE" ]]; then
    if ! [[ -d "$HOME/.ssh/github_id_ed25519" ]]; then
        echo "create ssh keypair"
        ssh-keygen -t ed25519 -C "$GIT_USER_MAIL" -f "$HOME/.ssh/github_id_ed25519" -N ""
        echo  "manual step: save public key in github and use ssh -T git@github.com for handshake"
        exit 0
    fi
    echo "ssh key with the name github_id_ed25519 already exists."
fi

current_user_mail="$(git config get --global user.email)"
current_user_name="$(git config get --global user.name)"

#only change git config if no mail and name is set.
if [[ $current_user_mail == "" ]]; then
    git config --global user.email "$GIT_USER_MAIL"
fi

if [[ $current_user_name ==  "" ]]; then
    git config --global user.name "$GIT_USER_NAME"
fi

echo "cloning git repositories"
mkdir -p "$HOME/github"

for project in "${GIT_PROJECTS[@]}"
do
    repo="$GIT_REPO_PATH/$repo"
    if ! [ -d "$repo" ]; then
        echo "cloning $repo"
        git clone "git@github.com:$GIT_USER/$project.git" "$repo"
    else
        echo "skipping $project, already exists."
    fi
done
