#!/usr/bin/env bash
# CREDITS: https://github.com/jcs/dotfiles/blob/master/move_in.sh

printf -v BACKUP_DATE "%(%Y%m%d)T"
CONF_FILES=".zshrc .vimrc .tmux.conf"

echo "-> Backing up"
for FILE in $HOME/.{zshrc,vimrc,tmux.conf}; {
	[ -f "$FILE" ] && mv "$FILE" "$HOME/${FILE##*/}.backup.$BACKUP_DATE"
}

echo "-> Making vim dirs"
mkdir -p $HOME/.vim/files/{backup,swap,undo,info/viminfo}
touch $HOME/.zshrc.mystuff.zsh

# check if we have the repo already cloned
# do a pull if present
# do a clone if not present
echo "-> Clonning repo"
if cd ~/.dotfiles 2>&-; then
	git pull --ff-only
	git submodule update --init --recursive
else
	git clone --recursive https://github.com/neoito-hub/dotfiles ~/.dotfiles
fi

echo "-> Installing dotfiles"
cd ~/.dotfiles
for f in $CONF_FILES; do
	rm -f ~/$f
	(cd ~/; ln -s .dotfiles/$f $f)
done

echo "-> Installing vscode config and plugins"
cp ~/.dotfiles/settings.json $HOME/.config/Code/User/settings.json
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode

echo "-> All done."
