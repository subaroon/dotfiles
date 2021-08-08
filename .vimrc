"********** file configuration ********"
set fileencoding=utf-8
set fileformats=unix,mac,dos


"********** tab configuration ********"
set tabstop=4
set softtabstop=4
set autoindent
set shiftwidth=4
set expandtab
augroup exTabGroup
  autocmd!
  autocmd BufRead,BufNewFile *.go,MakeFile setlocal noexpandtab
augroup END


"********** clipboard configuration ********"
set clipboard=unnamedplus


"********** search configuration ********"
set incsearch
set hlsearch
set ignorecase
set smartcase


"********** command configuration ********"
set wildmenu
set wildmode=longest,list
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
"  NOTE: Execute ~/.vim/bundle/markdown-preview.nvim/app/install.sh to complete
"        installing iamcco/markdown-preview.nvim
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'scrooloose/nerdtree'
"----------------------------------------------------------
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"==============vim-plug plugin setting==============
call plug#begin(expand('~/.vim/plugged/'))
"----------------------------------------------------------
"Isuue PlugInstall after you update the following
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'mattn/vim-lsp-settings'
"----------------------------------------------------------
call plug#end()


"********** plugin dedicated configuration ********"
"=====molokai plugin configuration=====
if neobundle#is_installed('molokai')
    colorscheme molokai
endif

"=====open-browser plugin configuration=====
let g:openbrowser_browser_commands = [ {'name': 'google-chrome-stable',  'args': ['{browser}', '{uri}']} ]

"=====nerdtree plugin configuration=====
nnoremap <C-i><C-i> :NERDTreeToggle<CR>


"********** quickfix window configuration ********"
set switchbuf+=usetab,newtab


"********** visual configuration ********"
set number
set cursorline
set cursorcolumn
set showmatch
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

"clone tab
nnoremap gsp :tab sp<CR>
