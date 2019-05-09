# neoito dotfiles

## Requirements

- Have `curl` or `wget` installed.
```
$ sudo apt install curl wget
```
- Set `zsh` as your default shell.
```
$ sudo apt install zsh
$ chsh -s $(which zsh)
```

- Install [vscode](https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions). This is important, as the script will install a few vscode plugins.

## Install

### via wget
```
$ sh -c "$(wget https://raw.githubusercontent.com/neoito-hub/dotfiles/master/move_in.sh -O -)"
```

### via curl
```
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/neoito-hub/dotfiles/master/move_in.sh)"
```