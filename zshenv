#This variable can be used in other rc scripts
export DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

export ZENV=1

for file in "$DOTFILES"/zsh/env/*.sh; do
    source "$file"
done

if [[ -d "$DOTFILES/zsh/local_env" ]]; then
    for file in "$DOTFILES"/zsh/local_env/*.sh; do
        source "$file"
    done
fi

