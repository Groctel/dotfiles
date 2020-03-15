# ==============================================================================
# FILESDEPLOY
# ------------------------------------------------------------------------------
# Forcibly deploys all the available dotfiles to the machine with the
# repositorie's file structure after a warning. Also deploys any missing
# dependencies from external sources.
# Use if you use the same structure as I do and have previously backed up your
# dotfiles.
# ==============================================================================

filesdeploy () {
	overwrite=0

	if confirm "yes" "Copy dotfiles fom repository to system"; then
	#	Confirm overwriting
		if confirm "no" "Overwrite existing files in system"; then
			overwrite=1;
		fi
	#	Deploy dotfiles line by line
		while read -r line; do
			printf "\033[1;35mDeploying \033[0m%s...\n" "$line";
			directory="$(echo "$line" | sed 's/'"$(basename "$line")"'//')"
			base="$(basename "$line")"

			if [ $overwrite = 0 ]; then
				if [ "$directory" != "" ] && [ -e ~/"$directory" ]; then
					directory="$(echo "$directory" | sed 's/\/$/_\//')";
				elif [ -e ~/"$line" ]; then
					base="$(echo "$base" | sed 's/$/_/')";
				fi
			fi

			mkdir -p ~/"$directory"

			cp files/"$line" ~/"$directory$base"
		done < filelist

		ln -s ~/.vim/UltiSnips/tex.snippets ~/.vim/UltiSnips/plaintex.snippets
	fi

#	Dependencies deploy
	if confirm  "Install dotfiles' missing dependencies"; then
	#	Antigen (zsh plugin manager)
		curl -L git.io/antigen > ~/.antigen.zsh;
	#	Plug (vim plugin manager)
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		vim +"so ~/.vimrc" +PlugInstall +qall
	fi
}
