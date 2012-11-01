set number
set tabstop=4
set shiftwidth=4
set cindent
set smarttab
set expandtab
set switchbuf=useopen
set foldmethod=indent
set foldlevel=99
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

autocmd FileType scss setlocal shiftwidth=4 tabstop=4
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType mustache setlocal shiftwidth=2 tabstop=2

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
