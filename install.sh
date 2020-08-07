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
    sudo apt-get install zsh vim-gtk git tmux

    # Get ZSH configured
    if [ -d ".oh-my-zsh" ]; then
        cd .oh-my-zsh; git pull; cd ..
    else
        git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    fi
    if [ -d ".oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
        cd .oh-my-zsh/custom/plugins/zsh-syntax-highlighting; git pull; cd ../../../..
    else
        git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    fi
  
    # Get VIM bundle (plugin) infrastructure
    if [ -d ".vim/bundle/Vundle.vim" ]; then
        cd .vim/bundle/Vundle.vim; git pull; cd ../../..
    else
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
   
    # Get a repository-centric prompt
    if [ -d "multi-shell-repo-prompt" ]; then
        cd multi-shell-repo-prompt; git pull; cd ..
    else
        git clone https://github.com/dotcode/multi-shell-repo-prompt.git
    fi
    
    # install YouCompleteMe
    sudo apt-get install build-essential cmake python-dev python3-dev
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py
    cd ~

    # install vim bundles (vundle Plugins)
    vim +PluginInstall +qall

    # configure tmux
    sudo apt-get install python3 python3-pip
    sudo pip3 install powerline_status
    if [ -f "~/.tmux.conf" ]; then
        ln -s dotfiles/.tmux.conf
    fi

    # I currently want to use ZSH
    chsh -s /bin/zsh
fi
