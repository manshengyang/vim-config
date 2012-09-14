set number
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set switchbuf=useopen
set foldmethod=indent
set foldlevel=99
filetype plugin indent on
syntax on
colo wombat

set incsearch
set hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

let Tlist_Ctags_Cmd='/opt/local/bin/ctags'
call pathogen#infect('~/.vim/submodules/')

source ~/.vim/conf/neocomplcache.vim

nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :TlistToggle<CR>
nnoremap <F5> :GundoToggle<CR>
