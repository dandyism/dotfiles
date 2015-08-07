#!/bin/sh

for dotfile in `find . -maxdepth 1 -name '.*' -type f`; do
  echo ln -sf $dotfile $HOME/`basename "$dotfile"`
done
