#
# ~/.bash_profile
#

# Add ~/bin to PATH
export PATH="$HOME/.local/bin:$PATH"

[[ -f ~/.bashrc ]] && . ~/.bashrc

export GPG_TTY=$(tty)

. "$HOME/.cargo/env"
