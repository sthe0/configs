[[ -o interactive ]] || exit

setopt nobeep

# History ----------------------------------------------------------

# Where it gets saved
HISTFILE=~/.history

# Remember about a years worth of history (AWESOME)
SAVEHIST=10000
HISTSIZE=10000

# Don't overwrite, append!
setopt APPEND_HISTORY

# Write after each command
# setopt INC_APPEND_HISTORY

# Killer: share history between multiple shells
setopt SHARE_HISTORY

# If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS

# Even if there are commands inbetween commands that are the same, still only save the last one
setopt HIST_IGNORE_ALL_DUPS

# Pretty    Obvious.  Right?
setopt HIST_REDUCE_BLANKS

# If a line starts with a space, don't save it.
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

# When using a hist thing, make a newline show the change before executing it.
setopt HIST_VERIFY

# Save the time and how long a command ran
setopt EXTENDED_HISTORY

setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# Other --------------------------------------------------------

# Stuff
setopt autocd
setopt extended_glob
#setopt correct

# Don't abort command if globbing failed (for git HEAD^)
setopt NO_NOMATCH

# Prompts for confirmation after 'rm *' etc
setopt RM_STAR_WAIT
# Report status of bg jobs immediately
setopt notify
# Report status of bg jobs if exiting
setopt check_jobs

# Set time command output format
export TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'

# Force emacs readline mode (override mode set from $EDITOR variable)
set -o emacs

# Use bash-style comments
setopt interactivecomments

autoload -U select-word-style
select-word-style bash

