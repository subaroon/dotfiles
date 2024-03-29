## distribution

Ubuntu22.04

## Setup

1. install tools

``` bash
sudo apt install -y curl git tmux build-essential ssh nodejs
```

1. copy bashrc tmux.conf
``` bash
cp .bashrc ~/.bashrc
cp .tmux.conf ~/.tmux.conf
```

1. Golang
refer to https://go.dev/doc/install


1. ghq and peco

``` bash
go install github.com/x-motemen/ghq@latest
go install github.com/peco/peco/cmd/peco@latest
```

``` bash
mkdir $HOME/dev

# fix .gitconfig
vi ~/.gitconfig
[ghq]
  root = ~/dev

[core]
  editor = vim
```

1. asdf
```
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
```
update version if you needed.
ref: https://asdf-vm.com/guide/getting-started.html

## vim

``` bashrc
ghq get https://github.com/vim/vim.git
## move vim PROJECT ROOT
### ghql -> vim
git checkout v8.2.5169
sudo apt-get update
sudo apt-get install -y libncurses5-dev \
  libgtk2.0-dev libatk1.0-dev \
  libcairo2-dev libx11-dev libxpm-dev libxt-dev python3-dev \
  ruby-dev lua5.1 liblua5.1-dev libperl-dev git
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=$(python3-config --configdir) \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local
make
sudo make install
```

#### neobundle
``` bash
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

#### plugins installed by vim-plug

1. issue ``:PlugInstall`` on vim to install all plugins using vim-plug as plugin manager.

#### iamcco/markdown-preview.nvim installation

1. run script
    ```
    ~/.vim/bundle/markdown-preview.nvim/app/install.sh
    ```
1. issue ``:call mkdp#util#install()`` on vim
