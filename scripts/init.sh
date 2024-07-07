#!/bin/bash
set -e

workdir=$(dirname $0)
echo "workdir: $workdir"

$workdir/install_nvim.sh

if [[ ! -e ~/.config/nvim/init.vim ]]; then
  mkdir -p ~/.config/nvim
  echo "source ~/.nvimrc" > ~/.config/nvim/init.vim
  echo "created ~/.config/nvim/init.vim"
fi

if [[ ! -e ~/.nvimrc ]]; then
  echo "source ~/.vim/.vimrc" > ~/.nvimrc
  echo "created ~/.nvimrc"
fi

echo "installing plugins"
PATH=~/bin:$PATH
nvim --headless +PlugInstall +qall
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
echo "installed plugins"
