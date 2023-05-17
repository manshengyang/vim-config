#!/bin/bash
set -e

if [[ ! -e ~/bin/vim ]]; then
  mkdir -p ~/bin
  ln -sf $(which nvim) ~/bin/vim
  echo "created ~/bin/vim"
fi

if [[ ! -e ~/.config/nvim/init.vim ]]; then
  mkdir -p ~/.config/nvim
  echo "source ~/.vimrc" > ~/.config/nvim/init.vim
  echo "created init.vim"
fi
