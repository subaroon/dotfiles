## distribution

Ubuntu18.04.5

## editor

```
VIM - Vi IMproved 8.2 (2019 Dec 12, compiled Oct 12 2020 19:47:19)
Included patches: 1-1838
```

### vim plugins Installation

My vimrc use both neobundle and vim-plug as plugin manager.  
These plugin manager and most plugins are installed automatically when you load my vimrc for the first time.  

Some plugins require you to issue some commands manually to install them.  
The procedure is the following.

#### iamcco/markdown-preview.nvim installation

1. run script
    ```
    ~/.vim/bundle/markdown-preview.nvim/app/install.sh
    ```
1. install nodejs
1. issue ``:call mkdp#util#install()`` on vim

#### all plugins using vim-plug as plugin manager

1. issue ``:PlugInstall`` on vim to install all plugins using vim-plug as plugin manager.

## terminal multiplexer

```
tmux 2.6
```
