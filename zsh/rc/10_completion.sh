[[ -o interactive ]] || exit

fpath=("$DOTFILES/zsh/completions" /usr/local/share/zsh-completions $fpath)

# Menu
zstyle ':completion:*' menu select=long-list select=0

# Colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Imporove processes completion
zstyle ':completion:*:processes' command 'ps -xuf'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'

# Try to speed up
zstyle -e ':completion:*' users 'reply=(timofey ...)'
zstyle ':completion:*' completer _complete
__git_files () {
    _wanted files expl 'local files' _files
}

# Enable autocomplete
autoload -U compinit
compinit -C


compdef tmuxto=ping
compdef setup_new_host.sh=ping
