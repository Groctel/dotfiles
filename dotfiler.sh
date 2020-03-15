#!/bin/sh

# ==============================================================================
# DOTFILER
# ------------------------------------------------------------------------------
# This is a simple script to update  my dotfiles repository or my dotfiles from
# my repository.
#
# ARGUMENTS: DESCRIPTION:
# deploy     Install dotfiles to your system
# pull       Update repository dotfiles with system's
# ==============================================================================

. scripts/confirm.sh
. scripts/filesdeploy.sh
. scripts/filespull.sh

# ==============================================================================
# MAIN ROUTINE
# ------------------------------------------------------------------------------
# Handles the execution of the program based on the args provided to it.
# If none or more than one are provided, it displays the help message.
# ==============================================================================

if [ "$1" = "deploy" ]; then
	filesdeploy;
elif [ "$1" = "pull" ]; then
	filespull;
elif [ "$1" = "pkginstall" ]; then
	pkginstall;
else
	printf "Use with one of two arguments:\n%s\n%s\n%s\n" \
	       "- deploy:     Deploys dotfiles to the system." \
	       "- pull:       Copies dotfiles into the repository." \
	       "- pkginstall: Installs packages and configures the system."
fi
