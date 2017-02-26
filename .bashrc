export SVN_EDITOR=vim
export GIT_EDITOR=vim
export HG_EDITOR=vim

. ~/multi-shell-repo-prompt/prompt.sh
. ~/dotfiles/hg-completion.bash
. ~/dotfiles/git-completion.bash

alias vpn="cd ~/workspace/sw-vpn/vpn_spynl-dev_nicolas && sudo openvpn openvpn-client.cfg"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

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

