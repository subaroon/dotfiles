set fileencoding=utf-8
set fileformats=unix,mac,dos

set clipboard=unnamed

inoremap{ {}<LEFT>
inoremap( ()<LEFT>
inoremap[ []<LEFT>
inoremap" ""<LEFT>
inoremap' ''<LEFT>

"config about tab
set tabstop=2
set softtabstop=2
set autoindent
set shiftwidth=2
set expandtab
augroup exTabGroup
  autocmd!
  autocmd BufRead,BufNewFile *.c   setlocal noexpandtab
  autocmd BufRead,BufNewFile *.cpp setlocal noexpandtab
  autocmd BufRead,BufNewFile *.cc  setlocal noexpandtab
  autocmd BufRead,BufNewFile *.go  setlocal noexpandtab
augroup END
"set list
"set listchars=tab:»-,trail:-
"set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%

"config about clipboard
set clipboard=unnamedplus

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

" for quickfix window
set switchbuf+=usetab,newtab
"open quickfix window
nnoremap [o :copen<CR>
"close quickfix window
nnoremap [c :cclose<CR>
"previous jump
nnoremap { :cprevious<CR>
"next jump
nnoremap } :cnext<CR>
"first jump
nnoremap [f :<C-u>cfirst<CR>
"last jump
nnoremap ]l :<C-u>clast<CR>

