# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# some more ls aliases
alias ls='ls --color=auto -F'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias snoop='find . -type f | xargs grep -i --color=auto $1'
alias gtags_py='gtags --gtagslabel=pygments'
alias gcd='cd `git rev-parse --show-toplevel`'

# for git
source /usr/share/bash-completion/completions/git
source $HOME/.git-prompt.sh
export PS1='[\u \W$(__git_ps1 " (%s)")]\$ '

# for Golang
export GOPATH=$HOME/dev
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# for kurbenetes
source <(kubectl completion bash)

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

