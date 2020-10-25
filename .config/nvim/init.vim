" NeoVim Configuration from Scratch
" --- Line Numbers --- 
set number relativenumber
set numberwidth=6
set cursorline
" --- Color Scheme
"  https://github.com/altercation/vim-colors-solarized
syntax enable
set background=light
colorscheme solarized
" TODO makesure it syncs with os dark mode
" --- Bottom Status bar
set showcmd
set ruler
" --- Plugins ---
call plug#begin('~/.vim/plugged')
"  Toggle relative line numbers
"  https://github.com/jeffkreeftmeijer/vim-numbertoggle
Plug 'jeffkreeftmeijer/vim-numbertoggle'
call plug#end()
