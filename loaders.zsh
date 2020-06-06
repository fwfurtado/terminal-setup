# Don't close terminal when press CTRL+D
set -o ignoreeof

# Compile completions if .zcompdump not exits
__compile_completions_if_necesary

# Load oh-my-zsh 
source $ZSH/oh-my-zsh.sh

# Load asdf 
source $(brew --prefix asdf)/asdf.sh

# Set JAVA_HOME to current asdf java 
source ~/.asdf/plugins/java/set-java-home.sh

# Load SCM_Breeze 
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

if [[ __docker_is_running -eq 0 ]]; then
  eval $(minikube -p minikube docker-env) 
else 
  __unset_if_defined 'DOCKER_TLS_VERIFY'
  __unset_if_defined 'DOCKER_HOST'
  __unset_if_defined 'DOCKER_CERT_PATH'
  __unset_if_defined 'MINIKUBE_ACTIVE_DOCKERD'
fi

