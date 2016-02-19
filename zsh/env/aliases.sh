# apt
alias agi='sudo apt-get install'
alias agu='sudo apt-get update'
alias agr='sudo apt-get remove'
alias acp='apt-cache policy'
alias acse='apt-cache search'
alias acsh='apt-cache show --no-all-versions'

# ls
alias ll='ls -lGh'
alias la='ls -a'
alias lla='ls -lGha'

# Colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
(which colordifff >/dev/null) || alias diff='colordiff -u'

alias please='sudo $(fc -ln -1)'

# Parallellize make
alias make='make -j8'

alias fuck='$(thefuck $(fc -ln -1))'
