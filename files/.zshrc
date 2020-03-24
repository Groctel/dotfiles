# ==============================================================================
# GROCTEL'S ZSHRC
# ==============================================================================

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# ==============================================================================
# ENVIRONMENT VARIABLES
# ==============================================================================

set RANGER_LOAD_DEFAULT_RC=FALSE

# ==============================================================================
# ANTIGEN SETTINGS
# ==============================================================================

# Antigen loader location
source ~/.antigen.zsh

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

# Automatic suggestions bundle
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme denysdovhan/spaceship-prompt

# Tell Antigen that you're done.
antigen apply

# ==============================================================================
# CUSTOM ALIASES
# ==============================================================================

# Dotfiles
alias entrconf="vim ~/.config/i3/launchscripts/entr.sh"
alias i3conf="vim ~/.config/i3/config"
alias kittyconf="vim ~/.config/kitty/kitty.conf"
alias rangerconf="vim ~/.config/ranger/rc.conf"
alias mimeconf="vim ~/.config/mimeapps.list"
alias roficonf="vim ~/.config/rofi/config.rasi"
alias vimconf="vim ~/.vimrc"
alias zshconf="vim ~/.zshrc"

# For loop macros
alias forall="for i in *; do"
alias form4a="for i in *.m4a; do"
alias formkv="for i in *.mkv; do"
alias formp3="for i in *.mp3; do"
alias formp4="for i in *.mp4; do"
alias forpdf="for i in *.pdf; do"
alias fortxt="for i in *.txt; do"
alias forwebm="for i in *.webm; do"
alias forzip="for i in *.zip; do"

# i3lock
alias lock="i3lock --image=/home/groctel/Pictures/i3lock.png"

# Ranger (based con $meta+e for "explorer" + locations in my computer)
alias e="ranger"

alias edoc="ranger ~/Documents"
alias edown="ranger ~/Downloads"
alias em="ranger ~/Music"
alias ep="ranger ~/Pictures"
alias ev="ranger ~/Videos"

alias er="ranger ~/Documents/Repositorios"
alias eui="ranger ~/Documents/UGR/ugr-informatica"

# Vim commands (I use them by mistake more than I would admit while sober)
alias q="exit"
alias qa="poweroff"
alias wqa="yes | sudo pacman -Syu && poweroff"

# Zip arguments
alias ziptelegram="zip -9rv -s 1500m"

alias cal=calcurse

# Misc
alias antonio="man" # Shoutouts to @advy99!
alias l="ls -lahX --group-directories-first"
alias ll="ls -lhX --group-directories-first"
alias please="sudo"
alias t="tree -a"
alias tt="tree"

eval $(thefuck --alias)

# Fetch properties
export HOSTNAME="grocpc"
export PF_INFO="ascii title os kernel wm pkgs shell uptime"
pfetch

# History
SAVEHIST=100000
HISTFILE=~/.zsh_history
