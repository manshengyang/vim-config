#!/bin/bash
set -e

# if nvim command is not found or FORCE_INSTALL is set
if [[ ! $(which nvim) || "$FORCE_INSTALL" ]]; then
  if [[ $(uname) == "Darwin" ]]; then
    if [[ $(uname -m) == "arm64" ]]; then
      nvim="nvim-macos-arm64"
    else
      nvim="nvim-macos-x86_64"
    fi
  else
    nvim="nvim-linux-x86_64"
  fi
  nvim_version="stable"
  cd ~/.vim
  # remove existing nvim dir
  rm -rf nvim
  echo "installing neovim"
  wget "https://github.com/neovim/neovim/releases/download/${nvim_version}/${nvim}.tar.gz"
  tar xf "${nvim}.tar.gz"
  mv "${nvim}" nvim
  rm "${nvim}.tar.gz"
  mkdir -p ~/bin
  ln -sf $(pwd)/nvim/bin/nvim ~/bin/nvim
  ln -sf $(pwd)/nvim/bin/nvim ~/bin/vim
  echo "installed neovim"
elif [[ ! -e ~/bin/vim ]]; then
  mkdir -p ~/bin
  ln -sf $(which nvim) ~/bin/vim
  echo "linked ~/bin/vim to nvim"
fi
