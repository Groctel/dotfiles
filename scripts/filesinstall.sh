# ==============================================================================
# FILESINSTALL
# ------------------------------------------------------------------------------
# Forcibly deploys all the available dotfiles to the machine with the
# repositorie's file structure after a warning. Also deploys any missing
# dependencies from external sources.
# Use if you use the same structure as I do and have previously backed up your
# dotfiles.
# ==============================================================================

filesinstall () {
	overwrite=0

	if confirm "yes" "Copy dotfiles fom repository to system root"; then
	#	Confirm overwriting
		if confirm "no" "Overwrite existing files in system"; then
			overwrite=1;
		fi
	#	Deploy dotfiles line by line
		while read -r line; do
			printf "\033[1;35mInstalling \033[0m%s...\n" "$line";
			directory="$(echo "$line" | sed 's/'"$(basename "$line")"'//')"
			base="$(basename "$line")"

			if [ $overwrite = 0 ]; then
				if [ "$directory" != "" ] && [ -e ~/"$directory" ]; then
					directory="$(echo "$directory" | sed 's/\/$/_\//')";
				elif [ -e ~/"$line" ]; then
					base="$(echo "$base" | sed 's/$/_/')";
				fi
			fi

			sudo mkdir -p /"$directory"

			sudo cp files-root/"$line" /"$directory$base"
		done < filelist
	fi
}
