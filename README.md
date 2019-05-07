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

## Install

### via wget
```
$ sh -c "$(wget https://raw.githubusercontent.com/neoito-hub/dotfiles/master/move_in.sh -O -)"
```

### via curl
```
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/neoito-hub/dotfiles/master/move_in.sh)"
```