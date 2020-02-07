# Terminal
stty -ixon
export EDITOR='vim'
export PROMPT=$'%{\e[0;92m%}%n@%m%{\e[0m%} %{\e[0;94m%}%~ $ %{\e[0m%}'

# zsh settings
# Tab completion
autoload -U compinit
compinit

# Pushd stack
setopt pushdignoredups

# Menu selection
zstyle ':completion:*' menu select

# Colorizing
export CLICOLOR=1
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
# BSD ls
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
# GNU ls
ls --color=auto &> /dev/null && alias ls='ls --color=auto'

# History
# https://sanctum.geek.nz/arabesque/better-bash-history/
alias history='history -t "%Y-%m-%dT%H:%M:%S %z:"'
# Commands are recorded in history as they're typed.
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
# De-dupe history
setopt HIST_FIND_NO_DUPS
# More recorded history
export HISTSIZE=100000
export HISTFILESIZE=100000

# GO
export GOPATH="$HOME/Projects"
export PATH="$PATH:$GOPATH/bin"

# Aliases
alias cow='fortune | cowsay'

function weather() {
  curl -H "Accept-Language: ${LANG%_*}" "wttr.in/$1"
}
