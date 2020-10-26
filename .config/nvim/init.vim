" NeoVim Configuration from Scratch
" --- Line Numbers --- 
set number relativenumber
set numberwidth=6
set cursorline
" --- Color Scheme
"  https://github.com/altercation/vim-colors-solarized
syntax enable
colorscheme solarized
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
call plug#end()

" --- coc configuration
" https://github.com/neoclide/coc.nvim
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

