# aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls -F'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias snoop='find . -type f | xargs grep -i --color=auto $1'
alias gtags_py='gtags --gtagslabel=pygments'
alias gcd='cd `git rev-parse --show-toplevel`'
alias python='python3'
alias chrome='open /Applications/Google\ Chrome.app'
alias vks-setup='source /opt/vksctl/openrc-581ae28fb158415b890f24ab841132c6-jp2'
alias md5sum='md5'

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

# environemntal variable
export GOPATH=$HOME/dev
export PATH=$PATH:$GOPATH/bin:$HOME/.nodebrew/current/bin:$HOME/.poetry/bin:/usr/local/opt/mysql-client/bin:$HOME/.local/bin

# zsh completion
#fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
#fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
source <(kubectl completion zsh)

# git prompt
source ~/.zsh/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
setopt PROMPT_SUBST
PROMPT='%F{green}%n@%m%f:%F{cyan}%1d%f\$ '
RPROMPT='%F{red}$(__git_ps1 "(%s)")%f'



#autoload -Uz vcs_info
#precmd_vcs_info() { vcs_info }
#precmd_functions+=( precmd_vcs_info )
#setopt prompt_subst
#RPROMPT=\$vcs_info_msg_0_
#zstyle ':vcs_info:git:*' formats '%b'

# load secrets file
. ~/.zsh_secrets

# asdf
#. /usr/local/opt/asdf/libexec/asdf.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/llvm/bin:$PATH"
