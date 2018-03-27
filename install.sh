#!/bin/bash

### --------------------------------------------------------------------
### seafile-share-link
### --------------------------------------------------------------------

if [ "$1" ]
then
    TARGET="$1"
elif [ "$PREFIX" ]
then
    TARGET="$PREFIX/bin"
else
    TARGET="/usr/local/bin"
fi


# check prereqs
[ "`which sqlite3`" ] || { "Error: You need 'sqlite3' to run seafile-share-link" >&2; exit 1; }
[ "`which curl`" ] || { "Error: You need 'curl' to run seafile-share-link" >&2; exit 1; }

SUDO=""
[ -d "$TARGET" ] && [ -w "$TARGET" ] || {
     SUDO="sudo"
}

FILE="seafile-share-link"
${SUDO} install --mode=555 "$FILE" "$TARGET" && echo "$FILE installed"

### --------------------------------------------------------------------
### nautilus-seafile-share-link
### --------------------------------------------------------------------

# prereqs

if [ -z "`which zenity`" ]
then
    echo "The 'nautilus-seafile-share-link' is not installed because it looks like you do" 
    echo "not have 'zenity' installed"
    exit
fi
if [ -z "`which nautilus`" ]
then
    echo "The 'nautilus-seafile-share-link' is not installed because it looks like you do" 
    echo "not have 'nautilus' installed"
    exit
fi

TARGET="$HOME/.local/share/nautilus/scripts/"
[ -d "$TARGET" ] && [ -w "$TARGET" ] || {
    echo "You do not have write-access to $TARGET -- re-run as root or use sudo" >&2
    exit 2
}

FILE='nautilus-seafile-share-link'
install --mode=555 "$FILE" "$TARGET" && {
    echo "$FILE installed for $USER"
}
