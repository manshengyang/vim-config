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

runtime macros/matchit.vim

let mapleader = ","
let maplocalleader = "\\"

set wildignore+=*.class,*.o,*.tmp

" ruby slowness fix
au FileType ruby set re=1

" some filetype settings
au FileType python setlocal shiftwidth=4 tabstop=4
au FileType proto setlocal tabstop=2 shiftwidth=2
au BufEnter,BufNew prelude_bazel set filetype=bzl
au FileType bzl setlocal tabstop=4 shiftwidth=4
au FileType java setlocal tabstop=2 shiftwidth=2
au FileType sh setlocal tabstop=2 shiftwidth=2

" better indent for C++ lamdas
au FileType cpp setlocal cindent cinoptions=j1,h1,l1,g1,t0,i4,+4,(0,w1,W4

syntax on

" trailing spaces
augroup trailing_space_syntax
  au!
  au Syntax * syn match ExtraWhitespace /\s\+$/ containedin=ALL
augroup END

set incsearch
set hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

let Tlist_Ctags_Cmd='/opt/local/bin/ctags'
call pathogen#infect('~/.vim/submodules/')
call pathogen#helptags()

set background=dark
colo solarized

highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

source ~/.vim/conf/statusline.vim

" nnoremap <F2> :vertical wincmd f<cr>
nnoremap <F2> :FSSplitRight<CR>
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :TlistToggle<CR>
nnoremap <F5> :GundoToggle<CR>
" remove trailing space
nnoremap <F11> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <F12> :SyntasticCheck<CR>

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
" edit vimrc
nnoremap <Leader>ev :rightbelow vsplit $MYVIMRC<CR>G
" source vimrc
nnoremap <Leader>sv :source $MYVIMRC<CR>
" append ; at the end of current line
nnoremap <Leader>a; mqA;<Esc>`q
" new tab
nnoremap <Leader>T :tabnew<CR>
" write
nnoremap <Leader>w :w<CR>
" quit
nnoremap <Leader>q :q<CR>
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
  au BufEnter,BufNew *.cuh setlocal filetype=cuda
  au BufEnter,BufNew *.cu setlocal filetype=cuda
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

" up, down in cmdline
cnoremap <c-n> <Down>
cnoremap <c-p> <Up>
cnoremap <c-j> <Left>
cnoremap <c-l> <Right>

"===============================================================================
" foldcolumn
"===============================================================================
nnoremap <Leader>fc :call FoldColumnToggle()<CR>
function! FoldColumnToggle()
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=4
  endif
endfunction

"===============================================================================
" quickfix window
"===============================================================================
nnoremap <Leader>fq :call QuickfixToggle()<CR>
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

"===============================================================================
" sideways
"===============================================================================
nnoremap <c-h> :SidewaysLeft<CR>
nnoremap <c-l> :SidewaysRight<CR>

"===============================================================================
" syntastic
"===============================================================================
let g:syntastic_mode_map = {
      \'mode': 'active',
      \ 'passive_filetypes': ['cpp', 'java', 'eruby', 'slim', 'scala', 'typescript', 'html'] }
" let g:syntastic_ruby_checkers = ["rubocop"]
let g:syntastic_html_tidy_ignore_errors = [
      \ 'is not recognized', 'discarding unexpected', 'proprietary attribute', 'trimming empty',
      \ 'is invalid']
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_typescript_tsc_args = "--experimentalDecorators"

"===============================================================================
" ocaml
"===============================================================================
au FileType ocaml set commentstring=(*\ %s\ *)

"===============================================================================
" FSwitch
"===============================================================================
augroup fswitch
  au!
  au BufEnter,BufNew *.cpp,*cc,*cxx call SetCppSwitch()
  au BufEnter,BufNew *.h,*hh,*hpp call SetHppSwitch()
augroup END
" FSwitch
function! SetCppSwitch()
  let b:fswitchdst = 'h,hpp,hh'
  let b:fswitchlocs = '.,../inc'
endfunction
function! SetHppSwitch()
  let b:fswitchdst = 'cpp,cc,cxx'
  let b:fswitchlocs = '.,../src'
endfunction

"===============================================================================
" ycm
"===============================================================================
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 0
let g:ycm_key_list_select_completion = ['<c-n>']
let g:ycm_key_list_previous_completion = ['<c-p>']
let g:ycm_filepath_completion_use_working_dir = 0
let g:ycm_show_diagnostics_ui = 0

"===============================================================================
" ultisnips
"===============================================================================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"===============================================================================
" easymotion
"===============================================================================
map <LocalLeader> <Plug>(easymotion-prefix)

"===============================================================================
" Command+T
"===============================================================================
nnoremap <silent> <Leader>t :CommandT<CR>
" nnoremap <silent> <Leader>bt :CommandTBuffer<CR>

"===============================================================================
" Unite
"===============================================================================
let g:unite_update_time = 500
let g:unite_source_history_yank_enable = 1
let g:unite_source_grep_max_candidates = 1000

" do not use unite history
let g:unite_source_history_source_enable = 0

" do not search all files - too slow, use CommandT for that
let g:unite_source_file_rec_max_cache_files = 10000
call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 10000)

" ignore_globs is slow and it's redundant when already using ag
call unite#custom#source('file_rec,file_rec/async', 'ignore_globs', '')

call unite#custom#source('buffer,file,file_rec,file_rec/async,file_rec/git', 'matchers',
      \ ['converter_relative_word', 'matcher_selecta'])
call unite#custom#source('buffer,file,file_rec,file_rec/async,file_rec/git', 'sorters',
      \'sorter_selecta')

if executable('ag')
  let g:unite_source_rec_async_command = ['ag',
        \ '--follow', '--nocolor', '--nogroup', '--hidden', '--ignore', '.git', '-m', '1000',
        \ '-g', '']
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '--line-numbers --nocolor --nogroup -i --vimgrep --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
elseif executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '-i --nogroup --no-heading --no-color -k -H'
endif

au FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
endfunction

nnoremap <space>u :Unite -no-restore -start-insert file_rec/git buffer<CR>
nnoremap <space>t :Unite -no-restore -start-insert file_rec/async<CR>
nnoremap <space>d :Unite -no-restore -start-insert directory directory/new<CR>
nnoremap <space>y :Unite -no-restore -start-insert history/yank register<CR>
nnoremap <space>f :Unite -no-restore -start-insert -no-empty grep:%<CR>
nnoremap <space>g :Unite -no-restore -no-empty grep:.<CR>
nnoremap <space>a :Unite tab window<CR>
nnoremap <space>b :Unite -no-restore -start-insert buffer<CR>

"===============================================================================
" Scala
"===============================================================================
" function! SortScalaImportOnWrite()
"   au BufWritePre * :SortScalaImports
" endfunction

augroup filetype_actions
  au!
  au FileType vim setlocal foldmethod=marker
  " au FileType scala call SortScalaImportOnWrite()
augroup END

autocmd CompleteDone * pclose

"===============================================================================
" Rust
"===============================================================================
let g:rustfmt_autosave = 1
