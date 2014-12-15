#!/bin/sh

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


