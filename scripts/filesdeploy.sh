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
	overwrite="false"

	confirm "yes" "Copy dotfiles fom repository to system" && {
		confirm "no" "Overwrite existing files in system" && overwrite="true"

		while read -r line; do
			printf "\033[1;35mDeploying \033[0m%s...\n" "$line";

			directory="$(echo "$line" | sed 's/'"$(basename "$line")"'//')"
			base="$(basename "$line")"

			[ "$overwrite" = "true" ] && {
				if [ "$directory" != "" ] && [ -e ~/"$directory" ]; then
					directory="$(echo "$directory" | sed 's/\/$/_\//')";
				elif [ -e ~/"$line" ]; then
					base="$(echo "$base" | sed 's/$/_/')";
				fi
			}

			mkdir -p ~/"$directory"

			cp files/"$line" ~/"$directory$base"
		done < filelist
	}

# Dependencies deploy
	confirm "Install dotfiles' missing dependencies" && {
		curl -fLo ~/.antigen.zsh git.io/antigen
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

		vim +"so ~/.vimrc" +PlugInstall +qall
	}
}
