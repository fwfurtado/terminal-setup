# Don't close terminal when press CTRL+D
set -o ignoreeof


# Compile completions if .zcompdump not exits
__compile_completions_if_necesary

# Load oh-my-zsh 
source $ZSH/oh-my-zsh.sh

# Load asdf 
source  $ASDF_HOME/asdf.sh

# Set JAVA_HOME to current asdf java 
source ~/.asdf/plugins/java/set-java-home.zsh

# Load SCM_Breeze 
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"


poetry completions zsh > "$ZINIT_HOME/completions/_poetry" && compinit 
