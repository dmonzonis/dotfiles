#
# ~/.bash_profile
#

# Add ~/bin to PATH
export PATH="$HOME/.local/bin:$PATH"

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
export GPG_TTY=$(tty)

source "$HOME/.cargo/env"
