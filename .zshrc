#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

alias assume-role='function(){eval $(command assume-role $@);}'
function unassume-role() {
  unset ASSUMED_ROLE
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_SECURITY_TOKEN
  unset AWS_SESSION_TOKEN
}

# Customize to your needs...
export GOPATH=/Users/morcmarc/Code/go
export PIP_BIN=/Users/morcmarc/Library/Python/3.7/bin
export PATH=$PATH:/usr/local/opt/go/bin:$GOPATH/bin:/Users/morcmarc/Code/github/dotfiles/functions:/Applications/Wine\ Stable.app/Contents/Resources/start/bin:/Applications/Wine\ Stable.app/Contents/Resources/wine/bin:$PIP_BIN:$/Users/morcmarc/.jenv/bin
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

. /usr/local/etc/profile.d/z.sh

eval "$(jenv init -)"

alias e='emacsclient -t'
alias n='nvim'
alias ag='ag --path-to-ignore ~/.config/ag/.ignore'
alias cs='curl cheat.sh/'
alias cat='bat'

function my-ls() { exa "$@" }
#alias ls=my-ls

function my-fd() { fd "$@" }
alias find=my-fd

function my-rg() { rg "$@" }
alias grep=my-rg

function my-code() {  /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code "$@" }
alias vscode=my-code

function ptc() { bw get password $1 | tr -d '\n' | tr -d ' ' | pbcopy }

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

export GPG_TTY=$(tty)
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
source ~/Code/alias-tips/alias-tips.plugin.zsh
