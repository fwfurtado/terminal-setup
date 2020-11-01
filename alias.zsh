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
alias please='sudo $(fc -ln -1)'
alias ls='lsd --group-dirs first'
alias lt='ls --tree'
alias grep='grep --color'
alias l='ls -lh' 
alias ll='l' 
alias la='ls -lah' 
alias home='cd $HOME' 
alias pacman='sudo pacman' 

# by default some commands does not expand alias, but on alias with trailing space cause the expand next alias of next word
alias xargs='xargs ' 
alias watch='watch ' 
alias sudo='sudo ' 


alias neofetch='neofetch | lolcat'
alias pbcopy='xsel --clipboard --input'
alias pbpast='xsel --clipboard --output'

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

