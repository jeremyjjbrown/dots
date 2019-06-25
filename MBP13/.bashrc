#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTIGNORE="ls:cd:cd -:pwd:exit:date";
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
#export PROMPT_COMMAND="history -a; history -c; history -r $PROMPT_COMMAND"

###############################################
# bash options
###############################################

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;
# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

#################################################
# Envs
#################################################

export BROWSER=/usr/bin/firefox
export VISUAL=nvim
export EDITOR=nvim


export GOPATH=/home/jeremybr/dev
export PATH="$HOME/.local/bin:$HOME/bin:$GOPATH/bin:$PATH";

#################################################
# Aliases
#################################################

alias yim="vim +'set ft=yaml' -"
alias proxy-notebooks='ssh -L 8888:localhost:8888 lake'


#################################################
# Prompt is best at the end
#################################################
#export PS1="\[\033[38;5;75m\]\u@\h:\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;157m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\] "
source ~/.bash_prompt


# source fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash

# https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings
# export FZF_DEFAULT_OPTS="--bind 'ctrl-y:execute( echo  {} | xclip -r -sel clip )+abort'"
# export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"


# added by Anaconda2 2018.12 installer
# # >>> conda init >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$(CONDA_REPORT_ERRORS=false '/home/jeremybr/anaconda2/bin/conda' shell.bash hook 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     \eval "$__conda_setup"
# else
#     if [ -f "/home/jeremybr/anaconda2/etc/profile.d/conda.sh" ]; then
#         . "/home/jeremybr/anaconda2/etc/profile.d/conda.sh"
#         CONDA_CHANGEPS1=false conda activate base
#     else
#         \export PATH="/home/jeremybr/anaconda2/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda init <<<
# export PATH="$PATH:/home/jeremybr/anaconda3/bin"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/jeremybr/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/jeremybr/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/jeremybr/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/jeremybr/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

