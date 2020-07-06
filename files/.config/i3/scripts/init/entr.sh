#!/bin/sh

# ==============================================================================
# ENTR INITIALISER
# ------------------------------------------------------------------------------
# Entr (The Event Notify Test Runner) is a general purpose Unix utility
# intended to make rapid feedback and automated testing natural and completely
# ordinary. It's used to automatically run a command after a file it's updated.
# More information: http://eradman.com/entrproject/
# ==============================================================================

# If entr is running, kill it to prevent multiple instances
pgrep entr && killall -q entr

# Launch a new terminal when zsh's config is updated
echo ~/.zshrc | entr -p kitty &

# Reload i3wm when the config file is updated
echo ~/.config/i3/config | entr -p i3 reload &
