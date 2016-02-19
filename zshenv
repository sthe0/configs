#This variable can be used in other rc scripts
export DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

export ZENV=1

for file in "$DOTFILES"/zsh/env/*; do
    source "$file"
done

if [[ -d "$DOTFILES/zsh/env_local" ]]; then
    for file in "$DOTFILES"/zsh/env_local/*; do
        source "$file"
    done
fi

