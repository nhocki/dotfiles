My dotfiles
===================

Got most of this from Thoughtbot's dotfiles

Install
-------

Clone this directory and run:

    ./install.sh

This will create symlinks for all config files in your home directory. You can
safely run this file multiple times to update.

Note that there is configuration for `zsh` so if you'd like to switch your shell from the default `bash` to `zsh`, on OS X you do:

    chsh -s /bin/zsh

Manual Steps
-------

* `compaudit | xargs chmod g-w` to fix directory problems.
* `xattr -d com.apple.quarantine ~/Library/QuickLook/*` to allow QuickLook to run.
