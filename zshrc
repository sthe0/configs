function die() {
    echo $@
    exit 1
}

[[ -n "$ZENV" ]] || die ".zshrc shell be run after .zshenv"

for file in "$DOTFILES"/zsh/rc/*; do
    source "$file"
done

if [[ -d "$DOTFILES/zsh/rc_local" ]]; then
    for file in "$DOTFILES"/zsh/rc_local/*; do
        source "$file"
    done
fi



source $HOME/.yql/shell_completion
