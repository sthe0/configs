function die() {
    echo $@
    exit 1
}

[[ -n "$ZENV" ]] || die ".zshrc shell be run after .zshenv"

for file in "$DOTFILES"/zsh/rc/*; do
    source "$file"
done

if [[ -d "$DOTFILES/zsh/local_rc" ]]; then
    for file in "$DOTFILES"/zsh/local_rc/*; do
        source "$file"
    done
fi


