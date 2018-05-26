
. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

source $HOME/.git-completion.bash
source $HOME/.git-prompt.sh

alias ls='ls -F'
alias ll='ls -al'
alias gtxt='open -a TextEdit'
alias chrome='open -a Google\ Chrome'
alias gcd='cd `git rev-parse --show-toplevel`'
alias snoop='find . -type f | xargs grep -i --color=auto $1'
alias gtags_py='gtags --gtagslabel=pygments'
alias rm='rmtrash'
virt_manager() {
  virt-manager -c qemu+ssh://${1}@${2}/system?socket=/var/run/libvirt/libvirt-sock
}
#e.g.: $ virt-manager -c qemu+ssh://root@10.12.25.41/system?socket=/var/run/libvirt/libvirt-sock
export PS1='[\u \W$(__git_ps1 " (%s)")]\$ '
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/binutils/bin
export PATH=$PATH:/usr/local/go/bin

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

function ghql() {
  local selected_file=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$selected_file" ]; then
    if [ -t 1 ]; then
      echo ${selected_file}
      cd ${selected_file}
      pwd
    fi
  fi
}

bind -x '"\201": ghql'
bind '"\C-g":"\201\C-m"'

syntax enable
