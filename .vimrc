set nocompatible
source ~/.vim/conf/google.vim

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
set cc=100
filetype plugin indent on
colo wombat256mod

let mapleader = ","
let maplocalleader = "\\"

" ruby slowness fix
au FileType ruby set re=1

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

" beginning and end of the line
nnoremap H ^
nnoremap L $

" Leader shortcuts {{{
nmap <Leader>" ysiw"
nmap <Leader>' ysiw'
vnoremap <Leader>" <esc>a"<esc>`<i"<esc>`>ll
vnoremap <Leader>' <esc>a'<esc>`<i'<esc>`>ll
" start substitution
nnoremap <Leader>s :%s/
" reload this file
nnoremap <Leader>rl :e %<cr>
" edit vimrc
nnoremap <Leader>ev :rightbelow vsplit $MYVIMRC<CR>G
" source vimrc
nnoremap <Leader>sv :source $MYVIMRC<CR>
" Command+T
nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>bt :CommandTBuffer<CR>
nnoremap <silent> <Leader>ft :CommandTFlush<CR>
" edit prev buffer
nnoremap <Leader>eb :execute "rightbelow vsplit " . bufname("#")<cr>
" append ; at the end of current line
nnoremap <Leader>a; mqA;<Esc>`q
" remove trailing space
nnoremap <Leader>d<Space> mq^$bldw`q
" new tab
nnoremap <Leader>T :tabnew<CR>
" help
nnoremap <Leader>h :help 
" write
nnoremap <Leader>w :w<CR>
" quit
nnoremap <Leader>q :q<CR>

nnoremap <Leader>fc :call FoldColumnToggle()<CR>
nnoremap <Leader>fq :call QuickfixToggle()<CR>
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

augroup filetype_mappings
  au!
  au BufEnter,BufNew *.rabl setlocal filetype=ruby
  au BufEnter,BufNew Gemfile setlocal filetype=ruby
  au BufEnter,BufNew *.jbuilder setlocal filetype=ruby
  au BufEnter,BufNew *.god setlocal filetype=ruby
  au BufEnter,BufNew *.html.slim setlocal filetype=slim
  au BufEnter,BufNew *.md setlocal filetype=markdown
  au BufEnter,BufNew *.cuh setlocal filetype=cpp
  au BufEnter,BufNew *.cu setlocal filetype=cpp
augroup END

" I have no idea who breaks <C-G>, but I want it back
inoremap <c-g> <c-g>
inoremap <c-b> <esc>viwUea

" tabs
nnoremap <c-n> gt
nnoremap <c-p> gT

" copy
vnoremap <c-v> "*y

" magic search
nnoremap / /\v
nnoremap ? ?\v

" cnext, cprevious
" nnoremap <c-N> :cn<CR>
" nnoremap <c-P> :cp<CR>

" up, down in cmdline
cnoremap <c-n> <Down>
cnoremap <c-p> <Up>
cnoremap <c-j> <Left>
cnoremap <c-l> <Right>

" foldcolumn
function! FoldColumnToggle()
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=4
  endif
endfunction

" quickfix window
let g:quickfix_is_open = 0
function! QuickfixToggle()
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open = 0
    execute g:quickfix_return_to_window . "wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen
    let g:quickfix_is_open = 1
  endif
endfunction

" sideways
nnoremap <c-h> :SidewaysLeft<CR>
nnoremap <c-l> :SidewaysRight<CR>

" syntastic
let g:syntastic_cpp_compiler = "clang++"
let g:syntastic_cpp_compiler_options = " -std=c++11 -stdlib=libc++"
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['java'] }

" ocaml
autocmd FileType ocaml set commentstring=(*\ %s\ *)
let s:ocamlmerlin=substitute(system('opam config var share'),'\n$','','''') .  "/merlin"
execute "set rtp+=".s:ocamlmerlin."/vim"
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.ocaml = '[^. *\t]\.\w*\|\h\w*|#'
