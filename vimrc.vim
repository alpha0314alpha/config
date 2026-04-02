call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'dracula/vim'
Plug 'sainnhe/everforest'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'projekt0n/github-nvim-theme'
Plug 'tomasr/molokai'
Plug 'ayu-theme/ayu-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'alvan/vim-closetag'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
call plug#end()

let g:closetag_filenames = '*.html,*.jsx,*.tsx'
let g:closetag_xhtml_filenames = '*.jsx,*.tsx'
let g:closetag_filetypes = 'html,jsx,tsx'
let g:indentLine_char = '│'
let g:closetag_regions = {
    \ 'jsx': 'jsxRegion,jsxExpression',
    \ 'tsx': 'jsxRegion,jsxExpression',
    \ }

nnoremap <S-Tab> <<
nnoremap <Tab> >>
inoremap <S-Tab> <C-d>
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>

command! W w

set expandtab
set rnu
set updatetime=300
set signcolumn=yes
set guioptions-=T
autocmd FileType javascript,jsx,typescript,tsx setlocal expandtab
set formatoptions-=cro
set shiftwidth=4
set softtabstop=4
set tabstop=4
set backspace=indent,eol,start
set number
set omnifunc=syntaxcomplete#Complete
" set completeopt=menu,menuone,noselect

syntax on
set background=dark
set termguicolors

colorscheme koehler
filetype plugin indent on