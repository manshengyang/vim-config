set number
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set switchbuf=useopen
filetype plugin indent on
syntax on

set incsearch
set hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

call pathogen#infect('~/.vim/submodules/')
source ~/.vim/conf/neocomplcache.vim

colo wombat
let Tlist_Ctags_Cmd='/opt/local/bin/ctags'
