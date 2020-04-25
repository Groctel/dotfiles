# ==============================================================================
# INSTALL
# ------------------------------------------------------------------------------
# Installs the dotfiles' dependencies and every other package located at
# 'pkglist', then copies the files located at 'files-root' to their respective
# locations.
# ==============================================================================

pkginstall () {
	printf "\033[1;31mThis will install lots of programs that you may not want "
	printf "to have in your machine.\n\n\033[0mIf you're not Groctel or don't "
	printf "want to have every program he has \n(including 'yay', the AUR "
	printf "manager ), please check the 'pkglist'\nfile at the root of the "
	printf "repository for all the installed packages\nand delete the ones you "
	printf "don't want installed.\n"

	if confirm "no" "Proceed with the dependency installation"; then
		sudo cp files-root/etc/pacman.conf         /etc/pacman.conf
		sudo cp files-root/etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist

		git --version 1>/dev/null 2>&1 || sudo pacman --noconfirm -S git;

		rm -rf yay 1>/dev/null 2>&1;
		git clone https://aur.archlinux.org/yay.git;
		cd yay && \
		makepkg --noconfirm -si && \
		cd .. && \
		rm -rf yay;

		yay --noconfirm --answerclean All --answerdiff None --answeredit None \
		    --needed -S - < pkglist

		git clone https://github.com/jeremija/unipicker && (
			(cd unipicker || return) && \
			sudo make install && \
			(cd .. || return) && \
			rm -rf unipicker;
		)

		filesinstall
	fi
}
