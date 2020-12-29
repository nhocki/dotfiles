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

setopt nullglob

if [ -e "$HOME/.zshenv" ]; then
  source "$HOME/.zshenv"
fi

# prompt
if [ -e "$HOME/.prompt" ]; then
  source "$HOME/.prompt"
fi

# PATH stuff
export PATH="$HOME/.rbenv/shims:$HOME/bin:/usr/local/bin:/usr/local/share/python:$PATH"
export PATH="$HOME/.cask/bin:$PATH"
PATH="/usr/local/bin:/usr/local/heroku/bin:/usr/texbin:$PATH"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

if [ -e "$HOME/.splicefuncs" ]; then
  source "$HOME/.splicefuncs"
fi

eval "$(nodenv init -)"
export PATH="/usr/local/opt/elasticsearch@2.4/bin:$PATH"

export GPG_TTY=$(tty)

if [ -e "/usr/local/opt/asdf/asdf.sh" ]; then
. /usr/local/opt/asdf/asdf.sh
fi

export HOMEBREW_NO_AUTO_UPDATE=1
