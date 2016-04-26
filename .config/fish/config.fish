# Path to Oh My Fish install.
set -gx OMF_PATH /Users/marcell/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG /Users/marcell/.config/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set -x DOCKER_HOST tcp://192.168.99.100:2376
set -x DOCKER_CERT_PATH /Users/marcell/.docker/machine/machines/dev
set -x DOCKER_TLS_VERIFY 1
set -x GOPATH $HOME/Code/go
set -gx PATH /usr/local/bin /bin /usr/sbin /sbin /usr/bin $GOPATH/bin 
set -x AWS_CONFIG_FILE /Users/marcell/.aws/credentials
set -x ANDROID_HOME /usr/local/opt/android-sdk

. ~/.config/fish/functions/z-fish/z.fish

set GHC_DOT_APP /Applications/ghc-7.10.3.app
set -gx PATH $HOME/.local/bin $HOME/.cabal/bin $GHC_DOT_APP/Contents/bin $PATH

alias love /Applications/love.app/Contents/MacOS/love
alias sless serverless

tmux
