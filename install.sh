#!/bin/bash

cd ~

DOIT=1

# TODO: paths are not checked this way
for D in .bashrc .vimrc .gitconfig .ssh/config .vim/bundle/Vundle.vim 
do
    echo "checking $D ..."
    if [ -f "$D" ]; then
        if [ "$1" == "-F" ]; then
            printf '%s\n' "Removing File/Folder: ($D)"
            rm -rf "$D"
        else
            printf '%s\n' "Existing: ($D). To force overwrite, call with -F option"
            DOIT=0
        fi
    fi
done

if [ $DOIT -eq 1 ]; then
    ln -s dotfiles/.bashrc
    ln -s dotfiles/.vimrc
    ln -s dotfiles/.gitconfig
    ln -s dotfiles/.sshconfig .ssh/config

    git clone https://github.com/gmarik/Vundle.vim.git .vim/bundle/Vundle.vim

    #echo "[INFO] To set up your vim environment, run the command :PluginInstall after launching vim."
    #echo
    #echo "[INFO] The YouCompleteMe feature for vim needs to be installed, see https://valloric.github.io/YouCompleteMe/"
fi

# install vim bundles (vundle Plugins)
vim +PluginInstall +qall

# install YouCompleteMe
sudo apt-get install build-essential cmake python-dev
cd ~/.vim/bundle/YouCompleteMe
./install.sh

