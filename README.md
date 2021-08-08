## distribution

Ubuntu20.04

## gnu global

apt install -y global
pip install pygments


## editor

```
VIM - Vi IMproved 8.2 (2019 Dec 12, compiled Oct 12 2020 19:47:19)
Included patches: 1-1838
```

The procedure to build vim
```
git clone https://github.com/vim/vim.git
cd vim
git checkout 93be1644db2848659b0610477968c83f53619da1
./configure  --enable-cscope --with-features=huge --with-x
make
sudo make install
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
tmux 3.0a
```
