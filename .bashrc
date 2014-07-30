export SVN_EDITOR=vim
export GIT_EDITOR=vim
export HG_EDITOR=vim

. ~/multi-shell-repo-prompt/prompt.sh

alias sw="ssh-add ~/.ssh/id_bitbucket; cd ~/workspace/softwear.tools; source ../env/bin/activate"
alias api="ssh-add ~/.ssh/id_bitbucket; cd ~/vapi/src/spynl.tools; source ../../bin/activate"


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

