Configuraton files for my machines (mostly works with other Posix systems, but I usually
work on Debian).
Inspired by devs greater than me, who I thank in the files. Installation:

    git clone https://github.com/nhoening/dotfiles
    ./dotfiles/install.sh

CAREFUL: Per default, install.sh will not do anything to .bashrc, .zshrc, .vimrc, .gitconfig, .hgrc and .ssh/config if they exist. However, the only option for you to go ahead with it is brutal: You add the -F parameter to force it, and then it overwrites existing configurations.
