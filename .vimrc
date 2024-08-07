set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

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
set showmode
set fileencodings=utf-8,gbk
set guicursor=i:block
set signcolumn=yes
set mouse=
filetype plugin indent on

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

let mapleader = ","

set wildignore+=*.class,*.o,*.tmp

" ruby slowness fix
au FileType ruby setlocal re=1

" some filetype settings
au FileType python setlocal shiftwidth=4 tabstop=4
au FileType proto setlocal tabstop=2 shiftwidth=2
au FileType java setlocal tabstop=2 shiftwidth=2
au FileType sh setlocal tabstop=2 shiftwidth=2

" better indent for C++ lamdas
au FileType cpp setlocal cindent cinoptions=j1,h1,l1,g1,t0,i4,+4,(0,w1,W4

autocmd BufRead,BufNewFile *.bzl,BUILD,*.BUILD,BUILD.bazel,WORKSPACE setfiletype bzl
au FileType bzl setlocal shiftwidth=4 tabstop=4
let g:no_google_python_indent = 1

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

call plug#begin()
Plug 'AndrewRadev/sideways.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'lifepillar/vim-solarized8', { 'branch': 'neovim' }
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'derekwyatt/vim-fswitch'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'lervag/vim-latex'
Plug 'xolox/vim-misc'
Plug 'simnalamburt/vim-mundo'
Plug 'hynek/vim-python-pep8-indent'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'cespare/vim-toml'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'folke/which-key.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind.nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'tzachar/fuzzy.nvim'
Plug 'tzachar/cmp-fuzzy-buffer'
Plug 'manshengyang/copilot.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.11.0'}
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim', {'branch': 'v3.x'}
call plug#end()

set termguicolors
set background=dark
colo solarized8

highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
highlight SpellBad cterm=underline gui=undercurl

nnoremap <F2> :FSSplitRight<CR>
nnoremap <F3> :Neotree toggle<CR>
nnoremap <F4> :CopilotChatToggle<CR>
nnoremap <F7> :MundoToggle<CR>
" remove trailing space
nnoremap <F11> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

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
" new tab
nnoremap <Leader>t :tabnew<CR>
" quit
nnoremap <Leader>q :q<CR>
" }}}

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

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" magic search
nnoremap / /\v
nnoremap ? ?\v

" up, down in cmdline
cnoremap <c-n> <Down>
cnoremap <c-p> <Up>
cnoremap <c-j> <Left>
cnoremap <c-l> <Right>

" use esc to exit terminal mode
tnoremap <Esc> <C-\><C-n>

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
" easymotion
"===============================================================================
map - <Plug>(easymotion-prefix)

"===============================================================================
" Searches
"===============================================================================
let $FZF_DEFAULT_OPTS="--bind ctrl-b:page-up,ctrl-f:page-down,
      \ctrl-u:half-page-up,ctrl-d:half-page-down,
      \ctrl-k:up,ctrl-j:down"
let g:fzf_preview_window = ['up,40%', 'ctrl-/']

function! s:fzfdir(dir)
  let wrapped = fzf#wrap('dir', {
  \ 'source':  'find . -type d',
  \ 'dir':     a:dir,
  \ 'options': '-m --prompt "Dir> "'
  \}, 0)
  return fzf#run(wrapped)
endfunction
:command -nargs=? -complete=dir -bang Dirs call s:fzfdir(<q-args>)
:command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, "-U --follow", fzf#vim#with_preview(), <bang>0)

nnoremap <space>u :GFiles<CR>
nnoremap <space>t :Files<CR>
nnoremap <space>g :Ag 
nnoremap <space>b :Buffers<CR>
nnoremap <space>h :History<CR>
nnoremap <space>c :Commands<CR>
nnoremap <space>/ :BLines<CR>
nnoremap <space>d :Dirs<CR>

lua require('nvim')
