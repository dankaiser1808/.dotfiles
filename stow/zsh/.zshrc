# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/go/bin:~/.rd/bin:/opt/homebrew/bin:$PATH
export GOPATH=$HOME/go
export EDITOR="nvim"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

alias k=kubectl
alias vim=nvim
alias ov=" cd $HOME/github/Zettelkasten/ && vim $HOME/github/Zettelkasten/Zettelkasten.md"
ZSH_THEME="powerlevel10k/powerlevel10k"

autoload -Uz compinit
compinit

plugins=( git kube-ps1 zsh-bat docker aws fzf fzf-tab git ansible terraform brew colorize docker-compose golang helm postgres python ssh zsh-autosuggestions k9s )

source $ZSH/oh-my-zsh.sh
PROMPT='$(kube_ps1)'$PROMPT

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
