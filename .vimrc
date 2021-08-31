" Setup vim-plug if it is not already
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'     " Show git diff of lines edited
Plug 'tpope/vim-fugitive'         " :Gblame
Plug 'tpope/vim-rhubarb'          " :GBrowse
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'
Plug 'jiangmiao/auto-pairs'
Plug 'samoshkin/vim-mergetool'

" Plug 'tpope/vim-endwise'          " Autocomplete end after a do

Plug 'sheerun/vim-polyglot'
" Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
" Plug 'styled-components/vim-styled-components'

Plug 'vim-airline/vim-airline'    " Vim powerline
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'           " Set up fzf and fzf.vim

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'editorconfig/editorconfig-vim'
let gEditor_Config_exclude_patterns = ['fugitive://.*', 'scp://.*']

call plug#end()
set nocompatible
filetype plugin indent on    " required

let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'
" CoC extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-json']

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" }}}

" Settings {{{
syntax on

let mapleader=","
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>p :Rg<CR>
nnoremap <Leader>gg :Git<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gb :GBrowse<CR>
" Toggle speelcheck
nmap <silent> <leader>s :set spell! <CR>
" Faster saving and exiting
nnoremap <silent><leader>ww :w!<CR>
nnoremap <silent><leader>wq :wq<CR>
nnoremap <silent><leader>qq :q!<CR>
nnoremap <silent><leader>qa :qa!<CR>

" Open Vim configuration file for editing
nnoremap <silent><leader>2 :e ~/.vimrc<CR>
" Open zsh configuration file for editing
nnoremap <silent><leader>3 :e ~/.zshrc<CR>
" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader>mt :MergetoolStart<CR>
nnoremap <leader>t :tabnew<CR>

let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

set hidden
set showcmd
set hlsearch
set showmatch

set ignorecase
set smartcase

set scrolloff=3
set cmdheight=1
set shortmess=a
set number
set rnu
set signcolumn=yes

set wrap
set linebreak
set nolist

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Always show statusline
set laststatus=2
set background=light
set t_Co=256
set noshowmode
set termguicolors

set splitright
set splitbelow

set expandtab
set modeline

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set clipboard=unnamed

" Disable the mouse and arrow keys
set mouse=c
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

autocmd InsertEnter,InsertLeave * set cul!

color dracula
hi Normal guibg=NONE ctermbg=NONE

" if hidden is not set, TextEdit might fail.
set hidden

" Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

autocmd CursorHold * silent call CocActionAsync('highlight')

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Fix autofix problem of current line

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
