set nocompatible

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
" file path autocompelte
set wildmode=longest,list,full
set wildmenu
set ttimeoutlen=100
filetype plugin indent on
colo wombat256mod

runtime macros/matchit.vim

let mapleader = ","
let maplocalleader = "\\"

set wildignore+=*.class,*.o,*.tmp

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

let Tlist_Ctags_Cmd='/opt/local/bin/ctags'
call pathogen#infect('~/.vim/submodules/')
call pathogen#helptags()

source ~/.vim/conf/statusline.vim

" nnoremap <F2> :vertical wincmd f<cr>
nnoremap <F2> :FSSplitRight<CR>
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
  au!
  au FileType vim setlocal foldmethod=marker
augroup END
" }}}

" in next ()
onoremap in( :<c-u>normal! f(vi(<cr>
" in prev ()
onoremap il( :<c-u>normal! F)vi<cr>
" around next ()
onoremap an( :<c-u>normal! f(va(<cr>
" around prev ()
onoremap al( :<c-u>normal! F)va(<cr>
" next abc@abc
onoremap n@ :<c-u>execute "normal! /\\S\\+@\\S\\+\\.\\w\\+\r:nohlsearch\rv5e"<cr>

augroup filetype_mappings
  au!
  au BufEnter,BufNew *.rabl,Gemfile,*.jbuilder,*.god setlocal filetype=ruby
  au BufEnter,BufNew *.html.slim setlocal filetype=slim
  au BufEnter,BufNew *.md setlocal filetype=markdown
  au BufEnter,BufNew *.cuh setlocal filetype=cpp
  au BufEnter,BufNew *.cu setlocal filetype=cpp
  au BufEnter,BufNew *.tex setlocal filetype=tex
augroup END

" I have no idea who breaks <C-G>, but I want it back
inoremap <c-g> <c-g>
inoremap <c-b> <esc>viwUea

" tabs
nnoremap <c-n> gt
nnoremap <c-p> gT
nnoremap <c-j> :tabm +1<CR>
nnoremap <c-k> :tabm -1<CR>

" copy
vnoremap <c-v> "*y
nmap <c-c> :.w !pbcopy<CR><CR>
vmap <c-c> :w !pbcopy<CR><CR>

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
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['cpp', 'java', 'eruby'] }
" let g:syntastic_ruby_checkers = ["rubocop"]
let g:syntastic_html_tidy_ignore_errors = [ 'is not recognized', 'discarding unexpected', 'proprietary attribute', 'trimming empty' ]
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ocaml
au FileType ocaml set commentstring=(*\ %s\ *)

" FSwitch
augroup filetype_mappings
  au!
  au BufEnter,BufNew *.cpp,*cc,*cxx call SetCppSwitch()
  au BufEnter,BufNew *.h,*hh,*hpp call SetHppSwitch()
augroup END
function! SetCppSwitch()
  let b:fswitchdst = 'hpp,h,hh'
  let b:fswitchlocs = '.,../inc'
endfunction
function! SetHppSwitch()
  let b:fswitchdst = 'cpp,cc,cxx'
  let b:fswitchlocs = '.,../src'
endfunction

" ycm
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 0
let g:ycm_key_list_select_completion = ['<c-n>']
let g:ycm_key_list_previous_completion = ['<c-p>']
let g:ycm_filepath_completion_use_working_dir = 0
let g:ycm_show_diagnostics_ui = 0

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" easymotion
map <LocalLeader> <Plug>(easymotion-prefix)
