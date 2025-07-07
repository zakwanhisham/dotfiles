# DOTFILES

This is just a backup and also simple step for configuring the new machine.

To restore this, need to download `stow`

## TODO

- [ ] Need to make sure that `nvidia` stuffs is removed when trying to install on new devices
- [ ] Need to rework file structure for stow

## Install from pkglist.txt

```bash
paru --pacman pacman -S - < pkglist.txt
```

## Link with stow

```bash
cd dotfiles
stow {foldername}
```
