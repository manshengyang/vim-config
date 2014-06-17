set nocompatible
source ~/.vim/conf/google.vim

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
set backspace=2 " make backspace work like most other apps
set ic
filetype plugin indent on
set cc=80
colo wombat

let mapleader = ","
let maplocalleader = "\\"

syntax on
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
autocmd Syntax * syn match ExtraWhitespace /\s\+$/

set incsearch
set hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

let Tlist_Ctags_Cmd='/opt/local/bin/ctags'
call pathogen#infect('~/.vim/submodules/')
call pathogen#helptags()

source ~/.vim/conf/neocomplcache.vim
source ~/.vim/conf/statusline.vim
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

nnoremap <F2> :vertical wincmd f<cr>
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :TlistToggle<CR>
nnoremap <F5> :GundoToggle<CR>

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

nnoremap H ^
nnoremap L $

" Leader shortcuts {{{
nmap <leader>" ysiw"
nmap <leader>' ysiw'
vnoremap <leader>" <esc>a"<esc>`<i"<esc>`>ll
vnoremap <leader>' <esc>a'<esc>`<i'<esc>`>ll
nnoremap <leader>s :%s/
nnoremap <leader>q :q<cr>
nnoremap <Leader>w :w<cr>
nnoremap <Leader>qa :qa<cr>
nnoremap <Leader>wq :wq<cr>
" reload this file
nnoremap <Leader>rl :e %<cr>
" edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>G
" source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>
" }}}

iabbrev @@ mansheng@google.com

inoremap <c-d> <esc>dd
inoremap <c-b> <esc>viwUea

" Command+T {{{
nnoremap <silent> <leader>t :CommandT<CR>
nnoremap <silent> <leader>b :CommandTBuffer<CR>
" }}}

" Vimscript file settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi<cr>
onoremap an( :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F)va(<cr>
onoremap n@ :<c-u>execute "normal! /\\S\\+@\\S\\+\\.\\w\\+\r:nohlsearch\rv5e"<cr>
