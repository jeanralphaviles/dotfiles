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

# Parse comments in prompt
setopt interactivecomments

# Menu selection
zstyle ':completion:*' menu select

# Emacs keybindings
bindkey -e

# Command line editing
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Word boundaries
autoload -U select-word-style
select-word-style bash

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
HISTFILE="$HOME/.zsh_history"
alias history='history -t "%Y-%m-%dT%H:%M:%S %z:"'
# c-r history search
bindkey '^R' history-incremental-search-backward
# More recorded history
HISTSIZE=100000000
SAVEHIST=100000000
# Commands are recorded in history as they're typed.
setopt SHARE_HISTORY
# Write to the history file immediately, not when the shell exits.
setopt INC_APPEND_HISTORY
# Add timestamp for every entry
setopt EXTENDED_HISTORY
# Remove superfluous blanks before recording entry.
setopt HIST_REDUCE_BLANKS
# De-dupe history
setopt HIST_FIND_NO_DUPS
# Don't record an entry starting with a space.
setopt HIST_IGNORE_SPACE
# Beep when accessing nonexistent history.
setopt HIST_BEEP

# GO
export GOPATH="$HOME/Projects"
export PATH="$PATH:$GOPATH/bin"

# Aliases
alias cow='fortune | cowsay'
alias screenshot='import png:- | xclip -selection c -t image/png'

function weather() {
  curl -H "Accept-Language: ${LANG%_*}" "wttr.in/$1?u"
}
