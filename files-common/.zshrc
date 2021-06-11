set RANGER_LOAD_DEFAULT_RC=FALSE

PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
PATH="$PATH:$HOME/.local/bin"

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
antigen bundle git
antigen bundle ripgrep
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# antigen theme denysdovhan/spaceship-prompt

antigen apply

alias l="ls -lahX --group-directories-first"
alias ll="ls -lhX --group-directories-first"
alias sudo="sudo "
alias t="tree -a"
alias tt="tree"
alias ytdl="youtube-dl -f bestvideo+bestaudio -o '~/Videos/YouTube/%(title)s.%(ext)s'"
alias ytdlm="youtube-dl -x --audio-format mp3 -o '~/Music/_new/%(title)s.%(ext)s'"
alias ziptelegram="zip -9rv -s 1500m"

eval $(thefuck --alias)
eval $(starship init zsh)
