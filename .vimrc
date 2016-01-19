set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"ColorScheme
Plugin 'sjl/badwolf'

"NerdTree
Plugin 'scrooloose/nerdtree.git'

"Airline
Plugin 'vim-airline/vim-airline'

"YouCompleteMe
"Plugin 'Valloric/YouCompleteMe'

"Git Plugin
Plugin 'tpope/vim-fugitive'

"SuperTap
Plugin 'ervandew/supertab'

"Ctrl-P
Plugin 'ctrlpvim/ctrlp.vim'

"Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

let mapleader=","   " leader is comma

colorscheme badwolf
syntax enable


set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

"set cursorline          " highlight current line

filetype indent on      " load filetype-specific indent files

set wildmenu            " visual autocomplete for command menu

set showmatch           " highlight matching [{()}]

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
nnoremap <leader><space> :nohlsearch<CR>

" highlight last inserted text
nnoremap gV `[v`]

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>


"save Session
nnoremap <leader>s :mksession<CR>

"Open NerdTree
map <C-n> :NERDTreeToggle<CR>

"Open NerdTree if vim is opened with no file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Disable Markdown Folding & Add YAML highlight
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1

"Links: http://dougblack.io/words/a-good-vimrc.html
