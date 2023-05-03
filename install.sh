#!/bin/bash

cd ~

DOIT=1

# check if files exist
for F in .bashrc .zshrc .vimrc .gitconfig .gitignore_global .gitattributes_global .hgrc .ssh/config  
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
    echo "Copying over configs ..."
    ln -fs dotfiles/.bashrc
    ln -fs dotfiles/.zshrc
    ln -fs dotfiles/.vimrc
    ln -fs dotfiles/git/.gitconfig
    ln -fs dotfiles/git/.gitignore_global
    ln -fs dotfiles/git/.gitattributes_global
    ln -fs dotfiles/.pdbrc.py
    mkdir -p ~/.ssh
    ln -fs ~/dotfiles/.sshconfig ~/.ssh/config

    # make sure necessary tools are there
    sudo apt-get install zsh vim-gtk git gh python3-pip # tmux
    pip3 install virtualenvwrapper

    # Get ZSH configured
    if [ -d ".oh-my-zsh" ]; then
        cd .oh-my-zsh; git pull; cd ..
    else
        git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
    fi
    for PL in zsh-syntax-highlighting zsh-completions
    do
        if [ -d ".oh-my-zsh/custom/plugins/$PL" ]; then
            cd .oh-my-zsh/custom/plugins/$PL; git pull; cd ../../../..
        else
            gh repo clone zsh-users/$PL ~/.oh-my-zsh/custom/plugins/$PL
        fi
    done

    # Get a repository-centric prompt
    if [ -d "multi-shell-repo-prompt" ]; then
        cd multi-shell-repo-prompt; git pull; cd ..
    else
        gh repo clone dotcode/multi-shell-repo-prompt
    fi
    
    # I currently want to use ZSH
    chsh -s $(which zsh)

fi
