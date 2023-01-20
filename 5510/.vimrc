if exists('g:vscode')
    " VSCode extension
else

" ordinary vim
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'Yggdroot/LeaderF'
Plugin 'airblade/vim-gitgutter'
Plugin 'avakhov/vim-yaml'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'junegunn/fzf.vim'
Plugin 'mkitt/tabline.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ojroques/vim-oscyank'
Plugin 'puremourning/vimspector'
Plugin 'python-mode/python-mode'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-markdown'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chrisbra/recover.vim'
Plugin 'unblevable/quick-scope'
Plugin 'davidhalter/jedi-vim'


call vundle#end()

filetype plugin indent on
syntax on

" vimspector
let g:vimspector_enable_mappings = 'HUMAN'
" packadd! vimspector

" source /home/jeremybr/.vim/lightOrDark.vim
colorscheme solarized
"autocmd vimenter * ++nested colorscheme gruvbox
"set termguicolors

" LeaderF confs
let g:Lf_PopupColorscheme = 'gruvbox_material'
hi link Lf_hl_cursorline None
let g:Lf_WindowPosition = 'popup'
let g:Lf_UseCache = 0
let g:Lf_UseMemoryCache = 0

set nofoldenable
set backspace=indent,eol,start
set backupdir=~/.vim/backups
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
let g:netrw_liststyle = 3
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'yaml']

nnoremap <C-Down> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Up> <C-W><C-K>
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
nnoremap <c-\> :OSCYank<CR>

autocmd BufWritePre * %s/\s\+$//e

let g:NERDCompactSexyComDTreeIgnore=['\.DS_Store$','.idea$']
let NERDTreeShowHidden=1
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

endif


