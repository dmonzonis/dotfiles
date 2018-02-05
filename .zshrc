# Settings for command history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=5000

# Don't beep on error
unsetopt beep
# Set vi mode
bindkey -v

# Add colored prompt with gentoo theme
autoload -U promptinit && promptinit
prompt gentoo

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='vim'
alias gs='git status'
alias sudo='sudo '
alias pacopt='~scripts/pacopt.sh'

# Weather utility
function weather {
  curl -s wttr.in/$1
}

# The following lines were added by compinstall
zstyle :compinstall filename '/home/dani/.zshrc'

autoload -Uz compinit
compinit

