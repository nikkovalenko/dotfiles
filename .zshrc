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
