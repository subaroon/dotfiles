"********** file configuration ********"
set fileencoding=utf-8
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
  autocmd BufRead,BufNewFile *.go,MakeFile setlocal noexpandtab
augroup END
""set list
""set listchars=tab:»-,trail:-
""set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%


"********** clipboard configuration ********"
"use system clipboard
set clipboard=unnamed


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
NeoBundle 'iamcco/markdown-preview.nvim'
"NOTE: Execute ~/.vim/bundle/markdown-preview.nvim/app/install.sh
"      to complete installing markdown-preview.nvim
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle "lepture/vim-jinja"
"----------------------------------------------------------
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"==============vim-plug plugin setting==============
call plug#begin(expand('~/.vim/plugged/'))
"----------------------------------------------------------
"Isuue PlugInstall after you update the following
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'nathanalderson/yang.vim'
"----------------------------------------------------------
call plug#end()


"********** plugin dedicated configuration ********"
"=====tomasr/molokai=====
if neobundle#is_installed('molokai')
    colorscheme molokai
endif

"=====tyru/open-browser.vim=====
let g:openbrowser_browser_commands = [ {'name': 'google-chrome-stable',  'args': ['{browser}', '{uri}']} ]

"=====scrooloose/nerdtree=====
nnoremap <C-i><C-i> :NERDTreeToggle<CR>

"=====prabirshrestha/vim-lsp=====
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_signs_error = {'text': '✗'}
let g:lsp_diagnostics_signs_warning = {'text': '‼'}
let g:lsp_diagnostics_signs_hint = {'text': '?'}
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_popup_delay = 200
let g:lsp_insert_text_enabled = 0
let g:lsp_text_edit_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
nnoremap <Leader>d :tab LspDefinition<CR>
nnoremap <Leader>t :tab LspTypeDefinition<CR>
nnoremap <Leader>i :LspImplementation<CR>
nnoremap <Leader>r :LspReference<CR>
nnoremap <Leader>R :LspRename<CR>
nnoremap <Leader>f :LspDocumentFormat<CR>
nnoremap <Leader>h :LspHover<CR>

"********** for pyls plugin ********"
let g:lsp_settings = {
\   'pyls-all': {
\     'workspace_config': {
\       'pyls': {
\         'configurationSources': ['flake8']
\       }
\     }
\   },
\}
let g:syntastic_python_pylint_post_args="--max-line-length=120 --ignore W503"

augroup LspAutoFormatting
    autocmd!
    autocmd BufWritePre *.py LspDocumentFormatSync
augroup END
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
