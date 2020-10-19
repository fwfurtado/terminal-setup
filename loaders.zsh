# Don't close terminal when press CTRL+D
set -o ignoreeof


# Compile completions if .zcompdump not exits
__compile_completions_if_necesary

# Load oh-my-zsh 
source $ZSH/oh-my-zsh.sh

# Load asdf 
source $(brew --prefix asdf)/asdf.sh

# Set JAVA_HOME to current asdf java 
source ~/.asdf/plugins/java/set-java-home.zsh

# Load SCM_Breeze 
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"


poetry completions zsh > "$ZINIT_HOME/completions/_poetry" && compinit 

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/fernando.furtado/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/fernando.furtado/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/fernando.furtado/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/fernando.furtado/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

launchctl setenv PATH $PATH 
