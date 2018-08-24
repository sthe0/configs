#! /bin/bash
set -e

if [[ "$#" != 1 ]]; then
    echo "Usage: $0 remote_host_name"
    exit 1
fi

remote_host=$1

#ssh-copy-id "$remote_host"
ssh -t "$remote_host" bash -c "\"curl -L 'https://raw.githubusercontent.com/sthe0/configs/master/install.sh' | bash\""
