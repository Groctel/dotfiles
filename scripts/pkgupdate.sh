# ==============================================================================
# PKGUPDATE
# ------------------------------------------------------------------------------
# After receiving confirmation from the user, gets the package list with 'yay'
# (which is considered installed) and updates the 'pkglist' file.
# ==============================================================================

pkgupdate () {
	confirm "yes" "Update package list" && yay -Qe | sed 's/ .*$//g' > pkglist
}
