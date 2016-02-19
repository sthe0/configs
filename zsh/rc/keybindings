# Strange, but sometimes 'delete' key does not work
# Improve it
bindkey "^[[3~" delete-char

# Forward and backward kill word. This works, but I don't know how.
bindkey "[H" kill-word
bindkey "\e\e[H" kill-word

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

# Search history with arrow keys
autoload -U  history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# Comment current line
bindkey '\e#' pound-insert
