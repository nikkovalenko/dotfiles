autoload -U +X compinit && compinit
source <(kubectl completion zsh)
source <(helm completion zsh)

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

autoload -U colors && colors
PS1="%{$fg[green]%}%n@%m %{$fg[blue]%}%1~ %{$reset_color%}%% "

alias ls="ls -al"
alias mv="mv -i"
alias mkdir="mkdir -p"
alias df="df -h"

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export EDITOR=nvim

bindkey '^R' history-incremental-search-backward
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^F' forward-char
bindkey '^B' backward-char
bindkey '^D' delete-char
bindkey '^K' kill-line
bindkey '^U' kill-whole-line
bindkey '^W' kill-word 
