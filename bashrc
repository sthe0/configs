# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Start zsh if possible
if which zsh 1>/dev/null 2>&1  && [ -z $SIMPLE_BASH ]; then
    exec zsh -l
    exit 0
fi

# Apply common sh settrings
[ -r $HOME/.shrc ] && . $HOME/.shrc

# don't put duplicate lines in the history
export HISTCONTROL=ingnoreboth,erasedups
export HISTSIZE=1000000

# append to the history file, don't overwrite it
shopt -s histappend
# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize
# correct minor errors in the spelling of a directory component in a cd command
shopt -s cdspell
# save all lines of a multiple-line command in the same history entry (allows easy re-editing of multi-line commands)
shopt -s cmdhist
# use **
shopt -s globstar

export PAGER=less
export EDITOR=vim
export LANG=en_US.UTF-8
unset LC_CTYPE

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions
[ -r $HOME/.shrc_aliases ] && . $HOME/.shrc_aliases
[ -r $HOME/.shrc_local_aliases ] && . $HOME/.shrc_local_aliases
[ -r $HOME/.bashrc_aliases ] && . $HOME/.bashrc_aliases
[ -r $HOME/.bashrc_local_aliases ] && . $HOME/.bashrc_local_aliases

# Enable color support of ls
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
fi

# Enable completion
[ -r /etc/bash_completion ] && . /etc/bash_completion

function gpg_update() { eval `cat ~/.gpg-agent-info`; }
function gpg_restart() { killall pinentry; killall gpg-agent; gpg-agent --daemon --write-env-file; gpg_update; }

