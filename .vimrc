" Setup vim-plug if it is not already

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'

Plug 'dense-analysis/ale'
let b:ale_fixers=['eslint']
let g:ale_sign_error = '🛑'
let g:ale_sign_warning = '⚠️'

Plug 'editorconfig/editorconfig-vim'
let gEditor_Config_exclude_patterns = ['fugitive://.*', 'scp://.*']

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'install --all' }
Plug 'junegunn/fzf.vim'

nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'neoclide/coc-json'
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc-css'

Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" }}}

" Settings {{{
syntax on
color dracula

set nocompatible

set hidden
set showcmd
set hlsearch
set showmatch

set ignorecase
set smartcase

set scrolloff=3
set cmdheight=2
set number
set signcolumn=yes

" Always show statusline
set laststatus=2
set background=light
set t_Co=256
set noshowmode

set splitright
set splitbelow

set expandtab
set modeline

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" }}}
"
