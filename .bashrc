export SVN_EDITOR=vim
export GIT_EDITOR=vim
export HG_EDITOR=vim

source ~/dotfiles/liquidprompt/liquidprompt

alias api="ssh-add ~/.ssh/id_bitbucket; cd ~/vapi/src/spynl.tools; source ../../bin/activate"

# two-line prompt to save horizontal space
export PS1="\u@\h:\w\n$ "
# exclude certain things from history
export HISTIGNORE="&:ls:vdir:[bf]g:exit"
# no accidental closing with ctrl-d
export IGNOREEOF=1
# search history with up- and down-key
#"e\[A": history-search-backward
#"e\[B": history-search-forward


