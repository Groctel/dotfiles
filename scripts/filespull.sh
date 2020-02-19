# ==============================================================================
# FILESPULL
# ------------------------------------------------------------------------------
# After receiving confirmation from the user, removes the repository's dotfiles
# directory, then copies all known dotfiles from the system into the repository
# to update them for a new commit.
# The files are read one by one from the "filelist" file located at the root of
# the repository.
# ==============================================================================

filespull () {
	if confirm "yes" "Copy dotfiles from system to repository"; then
		rm -rf files
		mkdir files

		while read -r line; do
			directory="$(echo "$line" | sed 's/'"$(basename "$line")"'//')"

			mkdir -p files/"$directory"
			cp ~/"$line" files/"$directory"/"$(basename "$line")"
		done < filelist
	fi
}

