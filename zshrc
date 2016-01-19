# load our own completion functions
fpath=(~/.zsh/completion $fpath)
fpath=(/opt/boxen/homebrew/share/zsh/site-functions $fpath)
fpath=(/usr/localshare/zsh/site-functions $fpath)
fpath=(/usr/local/share/zsh-completions $fpath)

# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

# emacs mode
bindkey -e

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# add some emacs key shortcuts
bindkey "^K" kill-line
bindkey "^Z" undo

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
# bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# expand functions in the prompt
setopt prompt_subst

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# look for ey config in project dirs
export EYRC=./.eyrc

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try to correct command line spelling
# setopt CORRECT CORRECT_ALL
#
# Disable autocorrect
unsetopt correct_all

# Enable extended globbing
setopt EXTENDED_GLOB

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# functions
if [ -e "$HOME/.functions/functions" ]; then
  source "$HOME/.functions/functions"
fi

# RVM
setopt nullglob
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# prompt
if [ -e "$HOME/.prompt" ]; then
  source "$HOME/.prompt"
fi

# export EDITOR="~/bin/subl -n"

# PATH stuff
export PATH="$HOME/bin:/usr/local/bin:/usr/local/share/python:$PATH"
export PATH="$HOME/.cask/bin:$PATH"
PATH="/usr/local/heroku/bin:/usr/texbin:$PATH"
PATH="/Applications/Android Studio.app/sdk:$PATH" #Android SDK

export ANDROID_HOME="/Applications/Android Studio.app/sdk"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# added by travis gem
[ -f /Users/tarjan/.travis/travis.sh ] && source /Users/tarjan/.travis/travis.sh

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
