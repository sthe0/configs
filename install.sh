#! /bin/bash
set -e

die() {
    echo "ERROR: $1"
    echo "Installation failed"
    exit 1
}


print_and_execute() {
    echo "$@"
    eval "$@"
}


backup() {
    local file="$1"

    local backup_file="$file.$(date +%Y%m%d)"

    if [[ -a "$backup_file" ]]; then
        for ((i=1; ; ++i)); do
            if ! [[ -a "$backup_file.$i" ]]; then
                backup_file="$backup_file.$i"
                break
            fi
        done
    fi

    print_and_execute mv "$file" "$backup_file"
}


link_file() {
    local source_file="$1"
    local destination_file="$2"

    [[ -a "$source_file" ]] || die "Required file $source_file does not exist"

    if [[ -a "$destination_file" ]]; then        
        if [[ "$(realpath "$source_file")" == "$(realpath "$destination_file")" ]]; then
            echo "Link $destination_file is already up-to-date"
            return
        fi
        
        backup "$destination_file"
    fi

    print_and_execute ln -s "$source_file" "$destination_file"
}


clone_repo() {
    git clone git+ssh://git.yandex.ru/timofey/configs.git "$1"
}


update_repo() {
    local dotfiles="$1"

    local git_current_branch="$(cd "$dotfiles"; git rev-parse --abbrev-ref HEAD)"
    if [[ "$git_current_branch" != master ]]; then
        echo "Can operate only in branch 'master'. Update failed"
        exit 1
    fi


    local git_status=$(cd "$dotfiles"; git status --porcelain --untracked-files=no)
    if [[ -n "$git_status" ]]; then
        echo "Working tree in $dotfiles is dirty; please commit changes"
        exit 1
    fi

    (cd "$dotfiles"; git pull --rebase origin master)
}


export DESTDIR=${DESTDIR:-$HOME}
export DOTFILES=${DOTFILES:-$DESTDIR/.dotfiles}

if [[ -d "$DOTFILES" ]]; then
    update_repo "$DOTFILES"
else
    clone_repo "$DOTFILES"
fi

configs=$(cat $DOTFILES/configs.txt)

for file in $configs; do
    echo "Processing $file"
    link_file "$DOTFILES/$file" "$DESTDIR/.$file"
done


for file in "$DOTFILES"/setup/*.sh; do
    bash "$file"
done
