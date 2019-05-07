#!/usr/bin/env bash
# CREDITS: https://github.com/jcs/dotfiles/blob/master/move_in.sh


echo "-> Backing up"
[ -f $HOME/.zshrc ] && cp $HOME/.zshrc $HOME/.zshrc.backup
[ -f $HOME/.vimrc ] && cp $HOME/.zshrc $HOME/.vimrc.backup
[ -f $HOME/.tmux.conf ] && cp $HOME/.zshrc $HOME/.tmux.conf.backup

# check if we have the repo already cloned
# do a pull if present
# do a clone if not present
if [ -d ~/.dotfiles ]; then
	cd ~/.dotfiles
	git pull --ff-only
	git submodule update --init --recursive
else
	git clone --recursive https://github.com/neoito-hub/dotfiles ~/.dotfiles
fi
