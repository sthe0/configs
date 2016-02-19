[[ -o interactive ]] || exit

# Newer version of git can dramatically speed up git status
# So try it if user placed it into ~/bin/git.d
git_binary="$HOME/bin/git.d/git"
if ! [[ -x "$git_binary" ]]; then
    git_binary=git
fi

_simple_git_prompt() {
    # exit if no git found in system
    [[ -z $(which "$git_binary" -s) ]] && return 1

    # exit if not in git repo
    [ "$("$git_binary" rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ] || return 1

    # TODO: More beautyfull way to select branch?
    git_branch=$("$git_binary" symbolic-ref -q HEAD)
    git_branch=${git_branch##refs/heads/}
    git_branch=${git_branch:-"$(git rev-parse --short HEAD)..."}

    echo " (${git_branch})"
}


_colored_git_prompt() {
    git_status_clear="%F{green}"
    git_status_dirty="%F{red}"
    git_status_staged="%F{yellow}"
    git_status_end="%f"

    git_status=$("$git_binary" status --porcelain --untracked-files=no 2>/dev/null)
    if [[ -z "$git_status" ]]; then
        git_status_color="$git_status_clear"
    elif [[ -z $(echo "$git_status"| sed  "/^[^ ] /d") ]]; then
        git_status_color="$git_status_staged"
    else
        git_status_color="$git_status_dirty"
    fi

    echo "$git_status_color$(_simple_git_prompt)$git_status_end"
}


_mapsmobi_pkg_root() {
    if [[ -n "$PKG_ROOT" ]]; then
        echo "%F{magenta} ($(basename "$PKG_ROOT"))%f"
    fi
}

# Set up title
case $TERM in
    *xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
    ;;
esac

# Set up prompt
setopt prompt_subst
PROMPT=$'%F{green}%n%f@%F{yellow}%m%f:%B%F{blue}%~%f%b$(_mapsmobi_pkg_root)$(_colored_git_prompt)%# '
RPROMPT="%F{black}%B%*%f%b"
