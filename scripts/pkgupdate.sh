# ==============================================================================
# PKGUPDATE
# ------------------------------------------------------------------------------
# After receiving confirmation from the user, gets the package list with 'yay'
# (which is considered installed) and updates the 'pkglist' file.
# ==============================================================================

pkgupdate () {
	if confirm "yes" "Update package list"; then
		yay -Qe | sed 's/ .*$//g' > pkglist;
	fi
}
