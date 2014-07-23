#!/bin/bash

cd ~

DOIT=1

# check if files exist
for F in .bashrc .vimrc .gitconfig .hgrc .ssh/config  
do
    echo "checking $F ..."
    if [ -f "$F" ]; then
        if [ "$1" == "-f" ]; then
            printf '%s\n' "Removing File/Folder: ($F)"
            rm -rf $D
        else
            printf '%s\n' "Existing: ($F). I will not do anything. To force overwrite, call with -f option"
            DOIT=0
        fi
    fi
done

if [ $DOIT -eq 1 ]; then
    ln -fs dotfiles/.bashrc
    ln -fs dotfiles/.vimrc
    ln -fs dotfiles/.gitconfig
    ln -fs dotfiles/.gitignore_global
    ln -fs dotfiles/.hgrc
    mkdir -p ~/.ssh
    ln -fs ~/dotfiles/.sshconfig ~/.ssh/config

    if [ -d ".vim/bundle/Vundle.vim" ]; then
        cd .vim/bundle/Vundle.vim; git pull; cd ../../..
    else
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi

    if [ -d "hg-prompt" ]; then
        cd hg-prompt; hg pull; hg update; cd ..
    else
        hg clone http://bitbucket.org/sjl/hg-prompt/
    fi
    if [ -d "multi-shell-repo-prompt" ]; then
        cd multi-shell-repo-prompt; git pull; cd ..
    else
        git clone https://github.com/dotcode/multi-shell-repo-prompt.git
    fi
    
    # install YouCompleteMe
    #sudo apt-get install build-essential cmake python-dev vim-gtk
    #cd ~/.vim/bundle/YouCompleteMe
    #./install.sh
    #cd ~

    # install vim bundles (vundle Plugins)
    vim +PluginInstall +qall

    source ~/.bashrc
fi
