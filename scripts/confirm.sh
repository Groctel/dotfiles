# ==============================================================================
# CONFIRM
# ------------------------------------------------------------------------------
# Prompts the user with a yes/no question. If priority for "yes" or "no" is
# specified, an empty string or any answer other than the not prioritised one
# will be interpreted as the prioritised one.
#
# Returns 0 if the answer is yes and 1 otherwise.
# ------------------------------------------------------------------------------
# ARGS:
# - $1 -> String : Either "yes" or "no" to set the answer priority or the
#                  question string if no priority is specified.
# - $2 -> String : The question string if priority is specified.
# ==============================================================================

confirm () {
	answer=-1

	while [ $answer -eq -1 ]; do
		case "$1" in
		[Yy]*)
			printf "%s? [Y/n]: " "$2"
		;;
		[Nn]*)
			printf "%s? [y/N]: " "$2"
		;;
		*)
			printf "%s? [y/n]: " "$1"
		;;
		esac

		read -r yn

		case $yn in
		[Yy]*)
			answer=0
		;;
		[Nn]*)
			answer=1;
		;;
		*)
			case "$1" in
			[Yy]*)
				answer=0
			;;
			[Nn]*)
				answer=1
			;;
			esac
		esac
	done

	return $answer
}
