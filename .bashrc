#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '             # Custom prompt
set -o vi                       # Set Vi mode
stty -ixon                      # Disable software flow control
export LC_ALL="en_US.UTF-8"     # Locale setting
export EDITOR=vim               # Default editor

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


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
