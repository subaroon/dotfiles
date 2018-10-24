set fileencoding=utf-8
set fileformats=unix,mac,dos

set clipboard=unnamed

inoremap{ {}<LEFT>
inoremap( ()<LEFT>
inoremap[ []<LEFT>
inoremap" ""<LEFT>
inoremap' ''<LEFT>

set tabstop=2
set softtabstop=2
set autoindent
set shiftwidth=2
"set expandtab
"set list
"set listchars=tab:»-,trail:-

"config about search and highlight
"The search by small letter means ignorecase-search,
"that by including uppercase letter means perfect-match-search
"in the case both ignorecase and smartcase are set
set incsearch
set ignorecase
set smartcase
set hlsearch

"two esc allow highlight to switch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"show line number
set number

"highlight cursor
set cursorline
set cursorcolumn
nnoremap <silent><C-m><C-m> :<C-u>setlocal cursorline! cursorcolumn!<CR>

"show the other brackets
set showmatch

"config about command mode
set wildmenu
set history=500

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
" write plugin following
"----------------------------------------------------------
NeoBundle 'tomasr/molokai'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'justmao945/vim-clang'
"NeoBundle 'Yggdroot/indentLine'
"NeoBundle 'fatih/vim-go'
"----------------------------------------------------------
call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"config about molokai
if neobundle#is_installed('molokai')
    colorscheme molokai
endif
set t_Co=256
syntax enable

"config about lightline
set laststatus=2
set showmode
set showcmd
set ruler

set conceallevel=0

"color scheme
highlight Visual term=reverse cterm=bold ctermfg=233 ctermbg=172 gui=bold guifg=#000000 guibg=#FD971F
highlight LineNr term=reverse cterm=bold ctermfg=233 ctermbg=8
