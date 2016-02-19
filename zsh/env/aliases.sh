# apt
alias agi='sudo apt-get install'
alias agu='sudo apt-get update'
alias agr='sudo apt-get remove'
alias acp='apt-cache policy'
alias acse='apt-cache search'
alias acsh='apt-cache show --no-all-versions'

# ls
alias ll='ls -olhF'
alias la='ls -A'
alias l='ls -CF'

alias gp='git pkg'
alias api='sudo apt-get install'
alias apc='apt-cache'
alias make='make -j12'
alias diff="diff -u"
alias got="git"
alias gti="git"
alias v="vim"

# Colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
(which colordifff >/dev/null) || alias diff='colordiff -u'

alias please='sudo $(fc -ln -1)'
alias fuck='$(thefuck $(fc -ln -1))'

if [ $(uname) = "Darwin" ] ;then
    alias l="ls -G"
    alias p="ps -ef"
fi

if ! which vim > /dev/null; then alias v="vi"; fi
