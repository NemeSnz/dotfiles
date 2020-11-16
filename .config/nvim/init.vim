" NeoVim Configuration from Scratch
let mapleader="\<Space>"
set nocompatible
" --- Line Numbers --- 
set number
set relativenumber
set numberwidth=6
set cursorline
set cursorcolumn
" --- Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" --- Splits
set splitbelow
set splitright

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>

noremap <silent> <Right> :vertical resize +3 <CR>
noremap <silent> <Left> :vertical resize -3 <CR>
noremap <silent> <Up> :resize +3 <CR>
noremap <silent> <Down> :resize -3 <CR>
" --- Color Scheme
" https://github.com/overcache/NeoSolarized
syntax enable
set termguicolors
colorscheme NeoSolarized
" --- Autoswtich to dark mode
function! SetBackgroundMode(...)
    let s:mode = systemlist("defaults read -g AppleInterfaceStyle")[0]
    if s:mode ==? "dark"
        set background=dark
    else
        set background=light
    endif
endfunction
call SetBackgroundMode()
call timer_start(3000, "SetBackgroundMode", {"repeat": -1})
" --- Bottom Status bar
set showcmd
set ruler
" --- Plugins ---
call plug#begin('~/.vim/plugged')
"  Toggle relative line numbers
"  https://github.com/jeffkreeftmeijer/vim-numbertoggle
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" -- Conquer of completion
"  https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" -- fzf - fuzzy finder
"  https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" -- NERDTree
"  https://github.com/preservim/nerdtree
"  https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'preservim/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin'
"  Graphql syntax
"  https://github.com/jparise/vim-graphql
Plug 'jparise/vim-graphql'
"  GitGutter
"  https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'
call plug#end()

" --- coc configuration
" https://github.com/neoclide/coc.nvim
source ~/.config/nvim/coc.vim
" -- NERDTree config
map <C-b> :NERDTreeToggle<CR>
