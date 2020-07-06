# Groctel's dotfiles

**Here are my dotfiles.
They are files made out of text on a directory tree with nothing.
Add them to your system if you want, I couldn't care less.** *Ron Swanson*

## Dotfiles manager

The files can be managed with `dotfiler.sh`, which accepts one of two arguments:

| ARGUMENT     | DESCRIPTION                                     |
| :----------- | :---------------------------------------------- |
| `deploy`     | Deploys dotfiles to the system.                 |
| `pkginstall` | Installs packages to the system with `yay`.     |
| `pkgupdate`  | Updates the installed packages list with `yay`. |
| `pull`       | Copies dotfiles into the repository.            |

This script reads the dotfiles from `filelist`, saves them to the repository and copies them into the home directory.
It also reads the packages from `pkglist`.

# Screenshots

![](https://i.imgur.com/ELCiyn4.jpg)

![](https://i.imgur.com/1rmIbj5.jpg)
