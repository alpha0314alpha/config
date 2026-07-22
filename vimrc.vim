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
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'folke/tokyonight.nvim'
" Plug 'rebelot/kanagawa.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'rose-pine/vim'
Plug 'nyoom-engineering/oxocarbon.nvim'
Plug 'tomasr/molokai'
Plug 'crusoexia/vim-monokai'
Plug 'ayu-theme/ayu-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'alvan/vim-closetag'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
call plug#end()

augroup CommentStyle
    autocmd!
    autocmd FileType javascript,javascriptreact,typescript,typescriptreact,jsx,tsx setlocal commentstring=//\ %s
    autocmd FileType c,cpp setlocal commentstring=//\ %s
augroup END

let g:closetag_filenames = '*.html,*.jsx,*.tsx'
let g:closetag_xhtml_filenames = '*.jsx,*.tsx'
let g:closetag_filetypes = 'html,jsx,tsx'
let g:indentLine_char = '笏・
let g:closetag_regions = {
    \ 'jsx': 'jsxRegion,jsxExpression',
    \ 'tsx': 'jsxRegion,jsxExpression',
    \ }
let g:mapleader = "\<Space>"

nnoremap <S-Tab> <<
nnoremap <Tab> >>
inoremap <S-Tab> <C-d>
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>
"nnoremap <C-c> ggVGy
nnoremap <C-c> ggVGy:call system('clip.exe', @")<CR>
nnoremap <C-s> :w<CR>

" colorscheme
function! RandomColor() abort
    let colors = getcompletion('', 'color')
    while !empty(colors)
        let i = rand() % len(colors)
        let color = remove(colors, i)
        try
            execute 'colorscheme ' .. color
            echo 'Colorscheme: ' .. g:colors_name
            return
        catch
        endtry
    endwhile
    echoerr 'No usable colorscheme found'
endfunction

command! RandomColor call RandomColor()

command! W w
command! CS colorscheme
command! RC RandomColor

set mouse=a
set clipboard=unnamedplus
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
set omnifunc=syntaxcomplete#Complete
" set completeopt=menu,menuone,noselect

if &term =~# 'xterm'
  let &t_SI = "\<Esc>[6 q"
  let &t_EI = "\<Esc>[2 q"
endif

syntax on
set background=dark
set termguicolors
set guicursor=n-v-c:block,i-ci-ve:ver5,r-cr:hor20,o:hor50

" colorscheme
function! Transparent()
    highlight Normal guibg=NONE ctermbg=NONE
    highlight NonText guibg=NONE ctermbg=NONE
    highlight LineNr guibg=NONE ctermbg=NONE
    highlight SignColumn guibg=NONE ctermbg=NONE
    highlight EndOfBuffer guibg=NONE ctermbg=NONE
endfunction

augroup TransparentBG
    autocmd!
    autocmd ColorScheme * call Transparent()
augroup END

colorscheme molokai
call Transparent()

filetype plugin indent on
set number
