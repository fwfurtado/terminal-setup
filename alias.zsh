function _edit_file() { file_name=$1

  ${=EDITOR} $file_name
}

alias nvimrc='_edit_file ~/.dotfiles/nvim/nvimrc' 
alias aliasrc='_edit_file ~/.dotfiles/alias.zsh'
alias pluginrc='_edit_file ~/.dotfiles/plugins.zsh'
alias envrc='_edit_file ~/.dotfiles/envs.zsh' 
alias zshrc='_edit_file ~/.zshrc' # Quick access to the ~/.zshrc file
alias bindkeysrc='_edit_file ~/.dotfiles/bindkeys.zsh'
alias dotfilesrc='_edit_file ~/.dotfiles/dotfiles.zsh'
alias pathrc='_edit_file ~/.dotfiles/paths.zsh'
alias loaderrc='_edit_file ~/.dotfiles/loaders.zsh'
alias p10krc='_edit_file ~/.dotfiles/p10k.zsh'
alias funrc='_edit_file ~/.dotfiles/functions.zsh'


#commons
alias vim=nvim
alias ls='lsd --group-dirs first'
alias lt='ls --tree'
alias grep='grep --color'
alias l='ls -lh' 
alias ll='l' 
alias la='ls -lah' 
alias home='cd $HOME' 
alias xargs='xargs ' # by default xargs does not expand alias, but on alias with trailing space cause the expand next alias of next word

alias watch='watch ' # by default watch does not expand alias, but on alias with trailing space cause the expand next alias of next word
alias neofetch='neofetch | lolcat'

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'


#my git alias
alias gbc="git rev-parse --abbrev-ref HEAD"
alias gmf='git diff --name-only $(gbc) $(git merge-base $(gbc) master)'

function __gdt() {
  if [ -z "$1" ]; then
    git difftool -y -x icdiff $(gbc) | less
  else
    git difftool -y -x icdiff $@ | less
  fi
}

alias gdt='__gdt'


function __k8s() {

  case "$1" in 
    'stop')
      minikube stop

      unset DOCKER_TLS_VERIFY
      unset DOCKER_HOST
      unset DOCKER_CERT_PATH
      unset MINIKUBE_ACTIVE_DOCKERD
      
      hostess del k8s.local.techonolgy > /dev/null 2>&1 
      ;;
    'start')
      minikube start

      eval $(minikube -p minikube docker-env)

      local k8s_ip=$(minikube ip)

      hostess add k8s.local.technology $k8s_ip > /dev/null 2>&1
      ;;
    'restart')
      __k8s stop
      __k8s start
      ;;
    *)
      minikube $@
      ;;
  esac    
  
}

if hash minikube 2>/dev/null; then
  alias k8s='__k8s $@'
fi

alias kgj='kubectl get jobs'
alias kgnsc='kubens -c'

function gi() { curl -sLw n https://www.gitignore.io/api/$@ ;}

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

function __lctl() {

  if [ $# = 0 ]; then
    launchctl 
    return 0
  fi

  local action=$1
  shift 
  
  local length=${#/0/1}
  local params=''
  local target=''

  for index in $(seq $length); do
    if [ $index = $length ]; then
      target=$1
    else
      params="$params $1"
      shift
    fi
  done

  params=${params## }
  params=${params%% }

  case "$action" in
    'load')
      launchctl $action "$HOME/Library/LaunchAgents/$target.plist"
      ;;
    'unload')
      launchctl $action "$HOME/Library/LaunchAgents/$target.plist"
      ;;
    'reload')
      __lctl unload $params $target > /dev/null 2>&1
      __lctl load $params $target
      ;;
    *)
      launchctl $action $params $target
      ;;
  esac
}

alias lctl='__lctl'
