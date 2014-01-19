set encoding=utf-8
set number
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set switchbuf=useopen
set foldmethod=indent
set foldlevel=99
set backspace=2 " make backspace work like most other apps
filetype plugin indent on
colo wombat

syntax on
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
autocmd Syntax * syn match ExtraWhitespace /\s\+$/

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

au BufEnter,BufNew *.rabl setlocal filetype=ruby
au BufEnter,BufNew Gemfile setlocal filetype=ruby
au BufEnter,BufNew *.jbuilder setlocal filetype=ruby
au BufEnter,BufNew *.html.slim setlocal filetype=slim
au FileType eruby,ruby,ocaml,yaml,scss,javascript,coffee,mustache,html setlocal shiftwidth=2 tabstop=2

" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%121v.\+/
set cc=120

" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

" powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
set noshowmode
let g:Powerline_symbols = 'fancy'
