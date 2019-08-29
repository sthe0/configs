if which zsh 1>/dev/null 2>&1  && [ -z $SIMPLE_BASH ]; then
    zsh
    exit 0
fi
