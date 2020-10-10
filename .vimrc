" my vimrc
" skeletons for code filetypes
autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
autocmd BufNewFile *.java 0r ~/.vim/templates/skeleton.java
autocmd BufNewFile *.txt setlocal textwidth=80

set nocompatible

syntax enable
filetype plugin on

" vim coding preferences 
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set expandtab
set softtabstop=4
set smartcase
set ruler
set history=1000
set laststatus=2
set showcmd


" turning on mouse: because I suck at keyboard
set mouse=a
" enabling kite to use tab completion within vim files for coding
let g:kite_tab_complete=1

"
" opening nerdtree automatically if no files specified in vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set exrc
set secure

" setting a column that shows 100 characters linelength
" to avoid lengthy lines of code
set colorcolumn=100
highlight ColorColumn ctermbg=blue

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" color scheme
Plug 'pgavlin/pulumi.vim'
" javascript plugs
Plug 'yuezk/vim-js'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" file organization within vim
Plug 'preservim/nerdtree'

call plug#end()

" set colorscheme
colorscheme pulumi

" for youcompleteme
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" kind of functional fuzzy search / finding functions from vim command line: 
" set recursive searching through filepaths within vim
set path+=**

" set optional menu based on tab completion
set wildmenu

" tag jumping 
" create the 'tags' file 
command! MakeTags !ctags -R .

" enables using the following: 
" ^] to jump to the tag under cursor
" use g^] for ambiguous tags
" use ^t to jump back up the tag stack

" File browsing: 
" using netrw and tweaking to optimize
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3

" NORMAL MODE
" snippets to create new html mappings within any file
" creates an html skeleton within file, positions cursor at the beginning of
" title
nnoremap ,html :-1read ~/.vim/templates/skeleton.html<CR>3jwf>a

" setting up hotkey to quickly display files in current directory
nnoremap ,show :e <C-d>

" jumping to the bottom of a file

" INSERT MODE 
" setting up hotkey to function as esc key
inoremap jj <Esc>
inoremap { {<CR>}<up><end><CR>

