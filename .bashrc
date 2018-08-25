#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable  bash completion in interactive shells
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

set -o vi                       # Set Vi mode
stty -ixon                      # Disable software flow control
export LC_ALL="en_US.UTF-8"     # Locale setting
export EDITOR=vim               # Default editor

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='vim'
alias gs='git status'
alias sudo='sudo '
alias pacopt='~/scripts/pacopt.sh'
alias i3lock='~/scripts/i3pixlock.sh'
alias python='python3'

# Colored manpages
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Get git branch name in current directory
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Set custom dark theme for tty terminals
if [ "$TERM" = "linux" ]; then
    printf '\033]P01a1813'; # black
    printf '\033]P1991f1f'; # red
    printf '\033]P25c991f'; # green
    printf '\033]P3997b1f'; # yellow
    printf '\033]P41f3e99'; # blue
    printf '\033]P5991f70'; # magenta
    printf '\033]P61f9999'; # cyan
    printf '\033]P7ccbc95'; # white
    printf '\033]P8333026'; # brighter black
    printf '\033]P9E62E2E'; # brighter red
    printf '\033]PA8AE62E'; # brighter green
    printf '\033]PBE6B82E'; # brighter yellow
    printf '\033]PC2E5CE6'; # brighter blue
    printf '\033]PDE62EA9'; # brighter magenta
    printf '\033]PE2EE6E6'; # brighter cyan
    printf '\033]PFE6D7AB'; # brighter white
    clear;
fi;

# Use colorful prompt
PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \W\[\033[33m\]$(parse_git_branch)\[\033[00m\] $ '

# Path
export PATH=$PATH:~/.local/bin:/sbin
export GPG_TTY=$(tty)

# Output weather info. Give location name as arg for other locations.
function weather {
  curl -s wttr.in/$1
}

# Load fzf bashrc
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add alias of function fuck from the thefuck script
eval $(thefuck --alias)
