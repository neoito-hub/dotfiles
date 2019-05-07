#!/usr/bin/env bash
# CREDITS: https://github.com/jcs/dotfiles/blob/master/move_in.sh

BACKUP_DATE=$(date +"%Y%m%d")
CONF_FILES=".zshrc .vimrc .tmux.conf"

echo "-> Backing up"
[ -f $HOME/.zshrc ] && mv $HOME/.zshrc $HOME/.zshrc.backup.$BACKUP_DATE
[ -f $HOME/.vimrc ] && mv $HOME/.vimrc $HOME/.vimrc.backup.$BACKUP_DATE
[ -f $HOME/.tmux.conf ] && mv $HOME/.tmux.conf $HOME/.tmux.conf.backup.$BACKUP_DATE

echo "-> Making vim dirs"
mkdir -p $HOME/.vim/files/backup
mkdir -p $HOME/.vim/files/swap
mkdir -p $HOME/.vim/files/undo
mkdir -p $HOME/.vim/files/info/viminfo

# check if we have the repo already cloned
# do a pull if present
# do a clone if not present
echo "-> Clonning repo"
if [ -d ~/.dotfiles ]; then
	cd ~/.dotfiles
	git pull --ff-only
	git submodule update --init --recursive
else
	git clone --recursive https://github.com/neoito-hub/dotfiles ~/.dotfiles
fi

echo "-> Installing"
cd ~/.dotfiles
for f in $CONF_FILES; do
	rm -f ~/$f
	(cd ~/; ln -s .dotfiles/$f $f)
done
