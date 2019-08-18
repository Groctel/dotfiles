#!/bin/sh

  # UPDATE ALL MY DOTFILES #
  # ########################
  # 
  # This is a simple script to update my dotfiles repository or my dotfiles from
  # my repository.
  #
  # ARGUMENTS:           USE:
  # -h || --help         Show a help text (also shows if no args are provided)
  # from                 Copy dotfiles FROM system to repository
  # to                   Copy dotfiles TO system from repository

_help() {
	printf " \033[1;34m==============================\n"
	printf " # \033[1;32mGROCTEL'S DOTFILES UPDATER \033[1;34m#\n"
	printf " ==============================\033[0m\n"

	printf " This is a simple script to update my dotfiles repository or my "
	printf "dotfiles from my repository.\n\n"
	printf " ARGUMENTS:           USE:\n"
 	printf " -h || --help         Show a help text (also shows if no args are \
provided)\n"
	printf " from                 Copy dotfiles FROM system to repository\n"
	printf " to                   Copy dotfiles TO system from repository\n\n"
	printf " Use only one argument and enjoy.\n"
}

_from() {
	rm -rf \~ # DO NOT TOUCH THIS LINE EVER AGAIN IN YOUR LIFE
	mkdir \~ && cd \~
		cp ~/.vimrc .
		cp ~/.zshrc .
		mkdir .config && cd .config
			cp -r ~/.config/compton .
			cp -r ~/.config/i3 .
			cp -r ~/.config/kitty .
			cp -r ~/.config/neofetch .
			cp -r ~/.config/rofi .
			cd ..
		mkdir .vim && cd .vim
			cp -r ~/.vim/colors .
			cd ..	
		cd ..
}

_to() {
	cd \~
	cp -rf . ~
	printf "\033[1;32mSuccessfully copied to system!\n"
}

if [ "$1" == "from" ]; then
	_from;
elif [ "$1" == "to" ]; then
	_to;
else
	_help;
fi
