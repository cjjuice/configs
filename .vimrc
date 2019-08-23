" PLUGIN MANAGEMENT
" =========================
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-sensible'
Plug 'junegunn/vim-easy-align'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'
Plug 'bronson/vim-trailing-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'drewtempelmeyer/palenight.vim'

call plug#end()

" GENERAL CONFIG
" ===================
set number
set directory=~/.vim/tmp/
set guifont=Anonymous\ Pro:h12
map <C-o> :NERDTreeToggle<CR>
map ; :Files<CR>
colorscheme made_of_code

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled     = 1
let g:airline_theme                      = 'raven'

" Nerdtree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Ale config
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'javascript' : ['prettier'],
\   'css'        : ['prettier'],
\   'scss'       : ['prettier'],
\   'md'         : ['prettier']
\}
let g:ale_linters = {
\   'javascript': ['eslint']
\}

" use spaces instead of tabs
set expandtab
set tabstop=2

" RSpec.vim
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
