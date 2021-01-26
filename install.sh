#!/bin/zsh

chsh -s /bin/zsh

exclude_files=(README.md install.sh .editorconfig)

for name in *; do
  target="$HOME/.$name"
  include=$(echo "${exclude_files[@]:0}" | grep -o $name)

  if [[ -z $include ]]; then
    if [ -e $target ]; then
      # Target exists. Let's check if it's not a sym link.
      if [ ! -L $target ]; then
        echo "WARNING: $target exists but is not a symlink. Ignoring."
      fi
    else
      # File doesn't exist yet. Create it without a problem.
      echo "Creating $target"
      ln -s "$PWD/$name" "$target"
    fi
  fi
done

if ! (crontab -l 2>/dev/null | grep -q "brew bundle dump") ; then
  echo "Adding Brewfile cronjob"
  (crontab -l 2>/dev/null; echo "0 */300 * * * /usr/local/bin/brew bundle dump --file=~/src/dotfiles/Brewfile -f")| crontab -
else
  echo "Cron already exists"
fi

echo "Installing Vundle"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo "Run compaudit | xargs chmod g-w  to fix directory problems"
