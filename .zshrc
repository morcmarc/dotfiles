#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias assume-role='function(){eval $(command assume-role $@);}'
function unassume-role() {
  unset ASSUMED_ROLE
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_SECURITY_TOKEN
  unset AWS_SESSION_TOKEN
}

# Customize to your needs...
export GOPATH=/Users/marcell.jusztin/Code/go
export PIP_BIN=/Users/marcell.jusztin/Library/Python/3.7/bin
export PATH=$PATH:/usr/local/opt/go/bin:$GOPATH/bin:/Users/marcell.jusztin/Code/github/dotfiles/functions:$PIP_BIN:/Users/marcell.jusztin/.tfenv/bin
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

. /usr/local/etc/profile.d/z.sh

eval "$(jenv init -)"

alias e='emacsclient -t'
alias n='nvim'
alias ag='ag --path-to-ignore ~/.config/ag/.ignore'
alias cs='curl cheat.sh/'
alias cat='bat'
alias ls='exa'
alias find='fd'
alias grep='rg'
alias awsume='. awsume'

#if command -v tmux>/dev/null; then
  #[[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
#fi

export GPG_TTY=$(tty)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/Code/github/alias-tips/alias-tips.plugin.zsh
