call plug#begin()

Plug '42Paris/42header'
Plug 'scrooloose/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Jorengarenar/COBOL.vim'

call plug#end()

let g:user42 = 'nranna'
let g:mail42 = 'nranna@student.42.rio'

colorscheme darkblue
syntax on
filetype plugin indent on
set number
set relativenumber
set colorcolumn=80
set ts=4 sw=4
set expandtab
set linebreak
set smartcase
set autoindent
set smartindent
set noswapfile
set wildmenu
set showcmd
set mouse=a

let mapleader = " "
nmap <leader>t :botright terminal<CR>
nmap <leader>e :Vexplore<CR>
nmap <leader>E :Explore<CR>
nmap <leader>q :q<CR>

let g:cobol_line_format = 'free'
let g:cobol_dialect = 'default'
let g:cobol_syntax_checking = 1
let g:cobol_tab_stop = 1
let g:cobol_compiler = 'gnucobol'
let g:cobol_autoupper = 1
