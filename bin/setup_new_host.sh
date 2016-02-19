#! /bin/bash
set -e

if [[ "$#" != 1 ]]; then
    echo "Usage: $0 remote_host_name"
    exit 1
fi

remote_host=$1

ssh-copy-id "$remote_host"
ssh -t "$remote_host" bash -c "\"curl -L 'https://git.yandex.ru/gitweb/timofey/configs.git?a=blob_plain;f=install.sh;hb=HEAD' | bash\""
