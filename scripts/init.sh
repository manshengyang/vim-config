#!/bin/bash
set -e

if [[ $(uname) == "Darwin" ]]; then
  if ! $(which nvim); then
    brew install nvim
  fi
else
  if ! $(which nvim); then
    cd ~/.vim
    if [[ ! -e nvim ]]; then
      echo "installing neovim"
      wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
      tar xf nvim-linux64.tar.gz
      mv nvim-linux64 nvim
      rm nvim-linux64.tar.gz
    fi
    mkdir -p ~/bin
    ln -sf $(pwd)/nvim/bin/nvim ~/bin/nvim
    ln -sf $(pwd)/nvim/bin/nvim ~/bin/vim
    echo "installed neovim"
  elif [[ ! -e ~/bin/vim ]]; then
    mkdir -p ~/bin
    ln -sf $(which nvim) ~/bin/vim
    echo "linked vim to nvim"
  fi
fi

if [[ ! -e ~/.config/nvim/init.vim ]]; then
  mkdir -p ~/.config/nvim
  echo "source ~/.vimrc" > ~/.config/nvim/init.vim
  echo "created ~/.config/nvim/init.vim"
fi

if [[ ! -e ~/.vimrc ]]; then
  echo "source ~/.vim/.vimrc" > ~/.vimrc
fi

PATH=~/bin:$PATH
nvim --headless +PlugInstall +qall
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
