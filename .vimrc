" basic config
set encoding=utf-8
set number
set relativenumber
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set switchbuf=useopen
set foldmethod=indent
set foldlevel=99
" make backspace work like most other apps
set backspace=2
set ic
set cc=80
filetype plugin indent on
colo wombat

syntax on
augroup trailing_space_syntax
  au!
  au Syntax * syn match ExtraWhitespace /\s\+$/
augroup END

highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

set incsearch
set hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

let mapleader = ','
let maplocalleader = '\\'

let Tlist_Ctags_Cmd='/opt/local/bin/ctags'
call pathogen#infect('~/.vim/submodules/')

source ~/.vim/conf/neocomplcache.vim

nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :TlistToggle<CR>
nnoremap <F5> :GundoToggle<CR>

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

" powerline config
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
set noshowmode
let g:Powerline_symbols = 'fancy'

" Command+T
nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>

augroup filetype_mappings
  au!
  au BufEnter,BufNew *.rabl setlocal filetype=ruby
  au BufEnter,BufNew Gemfile setlocal filetype=ruby
  au BufEnter,BufNew *.jbuilder setlocal filetype=ruby
  au BufEnter,BufNew *.html.slim setlocal filetype=slim
augroup END

" edit and source vimrc
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" start substitution
nnoremap <Leader>s :%s/

" beginning and end of the line
nnoremap H ^
nnoremap L $

iabbrev @@ mansheng.yang@gmail.com

" ---- Insert Mode ----
" delete to the beginning/end of the line
inoremap <C-h> <Esc>d^xi
inoremap <C-l> <Esc>ld$a
" delete backward
inoremap <C-b> <BS>
