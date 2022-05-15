Configuraton files for my machines (mostly works with other Posix systems, but I usually
work on Debian).
Inspired by devs greater than me, who I thank in the files. Installation:

    cd ~  # assume to be in the home dir
    gh repo clone nhoening/dotfiles
    ./dotfiles/install.sh

NOTE: sudo should not be used in order to save typing in a password, as most of
the commands should be run as you, not as root, in order to configure things for
you and not for root...

CAREFUL: Per default, install.sh will not do anything to .bashrc, .zshrc, .vimrc, .gitconfig, .hgrc and .ssh/config if they exist. However, the only option for you to go ahead with it is brutal: You add the -f parameter to force it, and then it overwrites existing configurations.

Using debian testing when stable is installed (e.g. on Bunsenlinux)

$ sudo vim /etc/apt/sources.list
# add deb http://ftp.de.debian.org/debian testing main
$ echo 'APT::Default-Release "stable";' | sudo tee -a /etc/apt/apt.conf.d/00local
$ sudo apt-get update
$ sudo apt-get -t testing install python3.6  # for example
