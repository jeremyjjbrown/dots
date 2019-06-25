set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'ajh17/VimCompletesMe'
Plugin 'avakhov/vim-yaml'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'janko-m/vim-test'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'junegunn/fzf.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'python-mode/python-mode'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'w0rp/ale'

call vundle#end()

filetype plugin indent on
syntax on

source $HOME/.vim/lightOrDark.vim
colorscheme solarized

set nofoldenable
"set backspace=indent,eol,start
"set backupdir=~/.vim/backups
set clipboard+=unnamed
set colorcolumn=80
if &term=~'linux'
  " This is the console on linux. I don't know for FreeBSD
  highlight ColorColumn ctermbg=16 guibg=#05252D
elseif &term=~'xterm'
  " Put your settings for X11 mode here
  highlight ColorColumn guibg=#05252D
endif

highlight ColorColumn  guibg=#073642
let &colorcolumn="80,".join(range(120,999),",")
set cursorline!
set directory=~/.vim/swaps
set encoding=utf-8 nobomb
set expandtab
set hlsearch
set incsearch
set laststatus=2
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
set mouse=a
set number
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
set ruler
set shiftwidth=4
set showcmd
set splitbelow
set splitright
set tabstop=4

nnoremap <C-Down> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Up> <C-W><C-K>
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

autocmd BufWritePre * %s/\s\+$//e

let NERDTreeIgnore=['\.DS_Store$','.idea$']
let NERDTreeShowHidden=1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_paste=1
let g:airline_theme='solarized'

if has('unix')
  if has('mac')       " osx
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  else                " linux, bsd, etc
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
  endif
endif
