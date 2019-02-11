# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git,mercurial,aws,virtualenv,jira,python,docker)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='gvim'
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
#
# Nics additions
#
# Turn off system beep
xset b off

export PATH=$PATH:~/.local/bin  # used this when installing flux locally

source ~/multi-shell-repo-prompt/prompt.sh
#source ~/dotfiles/hg-completion.bash  # is bash-specific
source ~/dotfiles/git-completion.bash

function setGitNicSeita(){
    if [[ "$1" == "" ]]; then
        echo "Usage: setGitNicSeita [github|bitbucket]"
        return 2
    fi
    echo "Configuring git for Nicolas @ Seita ..."
    if [[ "$1" == "bitbucket" ]]; then
        echo "Setting bitbucket key ..."
        ssh-add -D
        ssh-add ~/.ssh/id_rsa_bitbucket
    elif [[ "$1" == "github" ]]; then
        echo "Setting github key ..."
        ssh-add -D
        ssh-add ~/.ssh/id_github
    else
        echo "$1 is not a supported host. Exiting ..."
        return 2
    fi
    git config --global user.name "Nicolas Höning"
    git config --global user.email "nicolas@seita.nl"
}

function setGitPrivateNicolas(){
    ssh-add -D
    echo "Configuring git for Nic private ..."
    ssh-add ~/.ssh/id_github
    git config --global user.name "Nicolas Höning"
    git config --global user.email "iam@nicolashoening.de"
}

function setGitLegoLas(){
    ssh-add -D
    echo "Configuring git for Lego Las ..."
    ssh-add ~/.ssh/id_gitlab_lego
    git config --global user.name "Lego Las"
    git config --global user.email "legoactionstorm@gmail.com"
}

alias bvp="setGitNicSeita bitbucket; cd ~/workspace/seita/bvp; git pull; source activate bvp-venv"
alias ttm="setGitNicSeita github; cd ~/workspace/seita/ttm; source activate ts-fi-venv; git pull"
alias tb="setGitNicSeita github; cd ~/workspace/seita/timely-beliefs; source activate tb-venv; git pull"
alias ail="cd ~/workspace/seita/aileen; setGitNicSeita github; git pull; source activate aileen-django-venv; export HASH_MAC_ADDRESSES=false; export DISABLE_AUTO_TITLE=true; export WIFI_INTERFACES=wlx00c0ca979d1c,wlx00c0ca97227c,wlx00c0ca97227d; cd aileen"
alias hiil="cd ~/workspace/seita/atlantis; setGitLegoLas; git pull; source activate hiil-venv"
export PATH=$PATH:/home/nicolas/software/Cbc-2.9/bin;

# US keyboard layout plus special characters (e.g. Umlauts) with Shift-Alt-" [o|u|a] 
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl

# added by Anaconda3 installer
export PATH="/home/nicolas/anaconda3/bin:$PATH"

# added by nvm install script
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
