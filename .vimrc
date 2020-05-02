"********** file configuration ********"
"
"set fileencoding to utf-8
set fileencoding=utf-8

"set new linecode corresponding to platform automatically
set fileformats=unix,mac,dos


"********** tab configuration ********"

"config about tab
set tabstop=2
set softtabstop=2
set autoindent
set shiftwidth=2
set expandtab
augroup exTabGroup
  autocmd!
  autocmd BufRead,BufNewFile *.go  setlocal noexpandtab
augroup END
""set list
""set listchars=tab:»-,trail:-
""set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%


"********** tab configuration ********"

"use system clipboard
set clipboard=unnamed
"config about clipboard
set clipboard=unnamedplus


"********** search configuration ********"

set incsearch
set hlsearch
set ignorecase
set smartcase


"********** command configuration ********"

"config about command complement
set wildmenu
set wildmode=longest,full

"config about command history
set history=500


"********** NeoBundle configuration ********"

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
NeoBundle 'vim-scripts/gtags.vim'
NeoBundle 'iamcco/markdown-preview.nvim'
"NOTE: Execute ~/.vim/bundle/markdown-preview.nvim/app/install.sh
"      to complete installing markdown-preview.nvim
NeoBundle 'tyru/open-browser.vim'
"----------------------------------------------------------
call neobundle#end()

filetype plugin indent on
NeoBundleCheck


"********** molokai plugin configuration ********"

if neobundle#is_installed('molokai')
    colorscheme molokai
endif


"********** open-browser plugin configuration ********"
let g:openbrowser_browser_commands = [ {'name': 'google-chrome-stable',  'args': ['{browser}', '{uri}']} ]


"********** quickfix window configuration ********"
set switchbuf+=usetab,newtab


"********** visual configuration ********"

"show line number
set number

"show cursor pointer
set cursorline
set cursorcolumn

"show the match bracket to close
set showmatch

"show some meta character
set conceallevel=0

set laststatus=2
set showmode
set showcmd
set ruler

set t_Co=256
syntax enable

"color scheme
highlight Visual term=reverse cterm=bold ctermfg=233 ctermbg=172 gui=bold guifg=#000000 guibg=#FD971F
highlight LineNr term=reverse cterm=bold ctermfg=233 ctermbg=8


"********** map configuration ********"

" branckets and so on.
inoremap{ {}<LEFT>
inoremap( ()<LEFT>
inoremap[ []<LEFT>
inoremap" ""<LEFT>
inoremap' ''<LEFT>

" quickfix window.
nnoremap [o :copen<CR>
nnoremap [c :cclose<CR>
nnoremap { :cprevious<CR>
nnoremap } :cnext<CR>
nnoremap [f :<C-u>cfirst<CR>
nnoremap ]l :<C-u>clast<CR>

"highlight switch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"cursor pointer switch
nnoremap <silent><C-m><C-m> :<C-u>setlocal cursorline! cursorcolumn!<CR>

"paste mode switch
nnoremap <silent><C-p><C-p> :<C-u>set paste!<CR>

