set RANGER_LOAD_DEFAULT_RC=FALSE

# ANTIGEN SETTINGS

source ~/.antigen.zsh

antigen use oh-my-zsh

antigen bundle adb
antigen bundle alias-finder
antigen bundle battery
antigen bundle cargo
antigen bundle colored-man-pages
antigen bundle command-not-found
antigen bundle copybuffer
antigen bundle copyfile
antigen bundle fancy-ctrl-z
antigen bundle git
antigen bundle ripgrep
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen theme denysdovhan/spaceship-prompt

antigen apply

# CUSTOM ALIASES

# Zip arguments
alias ziptelegram="zip -9rv -s 1500m"

# Misc
alias l="ls -lahX --group-directories-first"
alias ll="ls -lhX --group-directories-first"
alias p3="python3"
alias sudo="sudo "
alias t="tree -a"
alias tt="tree"
alias ytdl="youtube-dl -f bestvideo+bestaudio -o '~/Videos/YouTube/%(title)s.%(ext)s'"
alias ytdlm="youtube-dl -x --audio-format mp3 -o '~/Music/_new/%(title)s.%(ext)s'"

eval $(thefuck --alias)

# Constants exporting
export PATH=$HOME/.config/scripts/path:$PATH
export HOSTNAME="grocpc"
export PF_INFO="ascii title os kernel wm pkgs shell uptime"

# History
SAVEHIST=100000
HISTFILE=~/.zsh_history
