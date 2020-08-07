export SVN_EDITOR=vim
export GIT_EDITOR=vim
export HG_EDITOR=vim

. ~/multi-shell-repo-prompt/prompt.sh
. ~/dotfiles/git/git-completion.bash

alias vpn="cd ~/workspace/sw-vpn/vpn_spynl-dev_nicolas && sudo openvpn openvpn-client.cfg"

export PATH="/usr/local/bin:/usr/bin:/bin:$PATH"

export PATH=$PATH:~/.local/bin

# turn off system beep
xset b off

# ---- History settings
# append to same history from all windows
shopt -s histappend
# start commands with a space if they should not get recorded
export HISTCONTROL=ignorespace
# exclude certain things from history
export HISTIGNORE="&:ls:vdir:[bf]g:exit"
# no accidental closing with ctrl-d
export IGNOREEOF=1
# search history with up- and down-key
#"e\[A": history-search-backward
#"e\[B": history-search-forward

# added by Anaconda3 installer
# export PATH="/home/nicolas/anaconda3/bin:$PATH"  # commented out by conda initialize

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/nicolas/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/nicolas/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/nicolas/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/nicolas/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

