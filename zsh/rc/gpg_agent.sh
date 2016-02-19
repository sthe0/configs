if [ -f /etc/X11/Xsession.d/90gpg-agent ]; then
    if [ -f $file ] && kill -0 `cut -d: -f2 $file` 2>/dev/null ; then
        export `cat $file`
    else
        eval `gpg-agent --daemon --write-env-file`
        echo "gpg-agent started"
    fi
    export GPG_TTY=`tty`
    unset file
fi
