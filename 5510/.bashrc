# ~/.bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTIGNORE="ls:cd:cd -:pwd:exit:date";
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# force history update
shopt -s histappend

###############################################
# bash options
###############################################

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;
# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

#################################################
# Envs
#################################################

# export BROWSER=/usr/bin/firefox
export VISUAL=vim
export EDITOR=vim


# export GOPATH=$HOME/dev
export PATH="$HOME/.local/bin:$HOME/bin:$GOPATH/bin:$PATH";

#################################################
# Aliases
#################################################

alias ls='ls --color=auto'
alias yim="vim +'set ft=yaml' -"
alias pbcopy="xclip -sel clip"
alias virsh="virsh -c qemu:///system"


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
export FZF_DEFAULT_OPTS="--bind 'ctrl-y:execute( echo  {} | xclip -r -sel clip )+abort'"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"


# update xmodmap

xmodmap ~/.xmodmap
xcape -e 'Mode_switch=Escape'
# xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
