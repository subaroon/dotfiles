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
  autocmd BufRead,BufNewFile *.md setlocal noexpandtab
augroup END
""set list
""set listchars=tab:»-,trail:-
""set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%


"********** tab configuration ********"

"use system clipboard
set clipboard=unnamed
"set clipboard=unnamedplus


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


"********** plugin configuration ********"

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif

    set runtimepath+=~/.vim/autoload/
    if !filereadable(expand("~/.vim/autoload/plug.vim"))
        echo "install vim-plug..."
        :call system("curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
    endif
endif

"==============neobundle plugin setting==============
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
"----------------------------------------------------------
NeoBundle 'tomasr/molokai'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'vim-scripts/gtags.vim'
NeoBundle 'iamcco/markdown-preview.nvim'
"NOTE: Execute ~/.vim/bundle/markdown-preview.nvim/app/install.sh
"      to complete installing markdown-preview.nvim
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle "lepture/vim-jinja"
NeoBundle 'scrooloose/syntastic'
NeoBundle 'w0rp/ale'
"----------------------------------------------------------
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"==============vim-plug plugin setting==============
call plug#begin(expand('~/.vim/plugged/'))
"----------------------------------------------------------
"Isuue PlugInstall after you update the following
Plug 'psf/black', { 'branch': 'stable' }
Plug 'nathanalderson/yang.vim'
Plug 'prabirshrestha/asyncomplete.vim'
"----------------------------------------------------------
call plug#end()

"==============Vundle plugin setting==============
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"----------------------------------------------------------
"Isuue PluginInstall after you update the following
Plugin 'davidhalter/jedi-vim'
"----------------------------------------------------------
call vundle#end()
filetype plugin indent on


"********** plugin dedicated configuration ********"

"molokai plugin configuration "
if neobundle#is_installed('molokai')
    colorscheme molokai
endif

"open-browser plugin configuration"
let g:openbrowser_browser_commands = [ {'name': 'google-chrome-stable',  'args': ['{browser}', '{uri}']} ]

"nerdtree plugin configuration
nnoremap <C-i><C-i> :NERDTreeToggle<CR>

"syntastic plugin configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_post_args="--max-line-length=100 --ignore E266,W503"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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

"show search count message
set shortmess-=S

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
nnoremap [l :<C-u>clast<CR>

"highlight switch
nnoremap <Esc><Esc> :<C-u>set nohlsearch!<CR>

"cursor pointer switch
nnoremap <C-m><C-m> :<C-u>setlocal cursorline! cursorcolumn!<CR>

"paste mode switch
nnoremap <C-p><C-p> :<C-u>set paste!<CR>

"horizontal split
nnoremap <C-w>- :split<CR>

"vertical split
nnoremap <C-w><bar> :vsplit<CR>

