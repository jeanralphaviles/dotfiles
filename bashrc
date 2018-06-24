#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Terminal
export TERM='rxvt-unicode-256color'
export EDITOR='vim'
export PROMPT_COMMAND='history -a'
export HISTSIZE=
export HISTFILESIZE=
stty -ixon

# GOPATH
export GOPATH="$HOME/Projects"

# PATH
export PATH="$PATH:/bin"
export PATH="$PATH:$GOPATH/bin"

# Colorizing
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
   . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
   . /etc/bash_completion
  fi
fi


# Prompt
export PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$\[\033[00m\] "

# Aliases
alias cow='fortune | cowsay'
alias irssi='TERM=screen-256color irssi'
alias open='xdg-open'
alias pacman-clean='sudo pacman -R $(pacman -Qdtq)'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias screenshot='import png:- | xclip -selection c -t image/png'

function tmux {
  if [[ "$1" == "ls" ]]; then
    command tmux list-sessions
  elif [[ "$1" == "a" ]]; then
    if [[ "$#" == 1 ]]; then
      command tmux attach-session
    else
      command tmux attach-session -t "$2"
    fi
  else
    command tmux "$@"
  fi
}

# Tab Completion for Tmux function
function _tmux() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ "$COMP_CWORD" == 2 ]]; then
    if [[ "${COMP_WORDS[1]}" == 'a' ]]; then
      COMPREPLY=(
        $(compgen -W "$(tmux list-sessions -F '#{session_name}')" "$cur")
      )
    fi
  fi
  return 0
}

complete -F _tmux tmux

function notify {
  local title=''
  command "$@"
  if [[ "$?" == 0 ]]; then
    title='Command Success'
  else
    title='Command Failure'
  fi
  notify-send "$title" "$(printf '%s ' $@)"
}

