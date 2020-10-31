# distribution

macOS Catalina

# brew

Install the following using brew.

* tmux
* ghq
* peco
* git
* zsh-git-prompt

# vim

```
VIM - Vi IMproved 8.2 (2019 Dec 12, compiled Oct 30 2020 21:58:50)
macOS version
Included patches: 1-1923
```

The procedure to build vim
```
git clone https://github.com/vim/vim.git
cd vim
git checkout 4f6b6ed208a15552f0eb7f27b7ca945f59f22c1d
make
sudo make install
```

## plugins Installation

My vimrc use both neobundle and vim-plug as plugin manager.  
These plugin manager and most plugins are installed automatically when you load my vimrc for the first time.  

Some plugins require you to issue some commands manually to install them.  
The procedure is the following.

### iamcco/markdown-preview.nvim installation

1. run script
    ```
    ~/.vim/bundle/markdown-preview.nvim/app/install.sh
    ```
1. install nodejs
1. issue ``:call mkdp#util#install()`` on vim

### all plugins using vim-plug as plugin manager

1. issue ``:PlugInstall`` on vim to install all plugins using vim-plug as plugin manager.

# tmux

```
tmux 3.1b
```
