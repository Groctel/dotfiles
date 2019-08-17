source $HOME/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Zsh auto-suggestions.
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme denysdovhan/spaceship-prompt

# Tell Antigen that you're done.
antigen apply

neofetch --color_blocks off
#figlet Descarga Lineage para Ari y Montse

#Usamos la propia variable $PATH, para evitar que si en algun momento alguna aplicacion modifica PATH no hay errores al exportarlo
export PATH="$PATH:$HOME/.antigen/bundles/robbyrussell/oh-my-zsh/lib:$HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git:$HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/heroku:$HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pip:$HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/lein:$HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/command-not-found:$HOME/.antigen/bundles/zsh-users/zsh-syntax-highlighting:$HOME/.antigen/bundles/zsh-users/zsh-autosuggestions:$HOME/.antigen/bundles/denysdovhan/spaceship-prompt:$HOME/.vimpkg/bin:$HOME/.vimpkg/bin"

stty -ixon

alias please=sudo
