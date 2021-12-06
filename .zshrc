# Settings for command history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=5000

# Don't beep on error
unsetopt beep
# Set vi mode
bindkey -v

# Add colored prompt
autoload -U promptinit && promptinit

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b)'

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Set up the prompt
setopt PROMPT_SUBST
prompt fade white grey blue
RPROMPT=\$vcs_info_msg_0_

export EDITOR=vim

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

# The following lines were added by compinstall
zstyle :compinstall filename '/home/dani/.zshrc'

autoload -Uz compinit
compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add pyenv to PATH
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


eval $(thefuck --alias)
