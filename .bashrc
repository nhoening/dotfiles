export SVN_EDITOR=vim
export GIT_EDITOR=vim
export HG_EDITOR=vim

. ~/multi-shell-repo-prompt/prompt.sh
. ~/dotfiles/hg-completion.bash
. ~/dotfiles/git-completion.bash

alias vpn="cd ~/workspace/sw-vpn/vpn_spynl-dev_nicolas && sudo openvpn openvpn-client.cfg"

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
export PATH="/home/nicolas/anaconda3/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
