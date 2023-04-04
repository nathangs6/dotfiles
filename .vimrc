" BASICS {{{
" Disable compatibility with vi which can cause unexpected issues
set nocompatible

" Set shift width to 4 columns
set shiftwidth=4

" Set tabwidth to 4 columns
set tabstop=4

" Enable file type detection. Vim will be able to try to detect the type of file in use
filetype on

" Enable plugins and load plugin for the detected file type
filetype plugin on

" Load an indent file for the detected file type
filetype indent on

" Turn line numbers on
set number


" Use space characters instead of tab
set expandtab

" Ignore capital letters during search
set ignorecase

" Find specifically capital letters
set smartcase

" Show partial command you type in the last line of the screen
set showcmd

" Show the mode you are in on the last line
set showmode

" Show matching words during a search
set showmatch

" Use highlighting when doing a search
set hlsearch

" Do not save backup files
set nobackup

" Ignore the following files, you shouldn't edit them
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
"}}}

" Set folding
set foldmethod=marker

" PLUGINS {{{
" Install plug.vim:w
if empty(glob('~/.vim/autoload/plug.vim'))
      silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins
call plug#begin()

" Vim Polygot {{{
Plug 'sheerun/vim-polyglot'
" }}}

" VimTex {{{
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" }}}

" UltiSnips {{{
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsEditSplit='vertical'
" }}}

" Install gruvbox {{{
Plug 'morhetz/gruvbox'
"}}}
call plug#end()
" }}}

" COLOURS {{{
if has('termguicolors')
  set termguicolors
endif
colorscheme gruvbox
set bg=dark
"}}}

syntax enable

setlocal spell
set spelllang=en_ca
inoremap <C-l> <C-g>u<Esc>[s1z=`]mla<C-g>u
noremap <C-l> [s1z=`]ml
