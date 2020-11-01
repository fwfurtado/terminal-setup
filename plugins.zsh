export ZINIT_HOME=$HOME/.zinit

source $ZINIT_HOME/bin/zinit.zsh 

# Enchanced CD 
#zinit ice atclone'rm -rf conf.d; rm -rf functions; rm -f *.fish;' pick'init.sh' nocompile'!' wait'!0' 
#zinit light b4b4r07/enhancd 
zinit ice atclone'rm -rf conf.d; rm -rf functions; rm -f *.fish;' proto'git' pick'init.sh'
zinit light b4b4r07/enhancd

#Powerlevel10k
zinit ice depth=1
zinit light romkatv/powerlevel10k

#Some other 3rd party plugins 
zinit light zdharma/fast-syntax-highlighting 
zinit light akarzim/zsh-docker-aliases 
zinit light zsh-users/zsh-autosuggestions 
zinit light zsh-users/zsh-completions 
zinit light djui/alias-tips


# Oh-My-zsh plugins 
zinit ice svn; zinit snippet OMZ::plugins/aws 
zinit ice svn; zinit snippet OMZ::plugins/git
zinit ice svn; zinit snippet OMZ::plugins/brew
zinit ice svn; zinit snippet OMZ::plugins/kubectl
zinit ice svn; zinit snippet OMZ::plugins/zsh_reload
zinit ice svn; zinit snippet OMZ::plugins/asdf

#FZF 
zinit ice from"gh-r" as"program"
zinit light junegunn/fzf-bin 

# sharkdp/fd - Enchanced find and cat 
zinit as"command" from"gh-r" light-mode for \
  mv"fd* -> fd" pick"fd/fd" @sharkdp/fd \
  mv"bat* -> bat" pick"bat/bat" @sharkdp/bat 

# nnn - file browser 
zinit ice make as"command" mv"nnn -> nnn" pick"nnn"
zinit light jarun/nnn

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
