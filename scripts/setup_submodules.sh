# git submodule update --init --recursive

# pip install websocket-client sexpdata flake8

TOP=$(git rev-parse --show-toplevel)
cd $TOP/submodules/you-complete-me && ./install.py --clangd-completer
cd $TOP/submodules/vimproc.vim && make
cd $TOP
