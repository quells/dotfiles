
" remap leader to comma
let mapleader=","
" ,sv reloads vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

" colors
syntax enable

" ui
" show line numbers
set number
" show command in bottom bar
set showcmd
" tab completion for filenames
set wildmenu
" reduce screen redraws
set lazyredraw
" highlight matching [{()}]
set showmatch

" spaces & tabs
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
filetype plugin indent on

" search
" search while typing
set incsearch
" highlight matches
set hlsearch
" turn off highlighting with ,<space>
nnoremap <leader><space> :nohlsearch<CR>
