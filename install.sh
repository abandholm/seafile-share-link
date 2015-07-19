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

[ -d "$TARGET" ] && [ -w "$TARGET" ] || {
    echo "You do not have write-access to $TARGET -- re-run as root or use sudo" >&2
    exit 2
}

FILE="seafile-share-link"
install --mode=555 "$FILE" "$TARGET" && echo "$FILE installed"

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
if [ -z "`which nautilus-script-manager`" ] && [ -z "`which nautilus-scripts-manager`" ]
then
    echo "The 'nautilus-seafile-share-link' is not installed because it looks like you do" 
    echo "not have 'nautilus-script-manager' or 'nautilus-scripts-manager' installed"
    exit
fi

TARGET="/usr/share/nautilus-scripts"
[ -d "$TARGET" ] && [ -w "$TARGET" ] || {
    echo "You do not have write-access to $TARGET -- re-run as root or use sudo" >&2
    exit 2
}

FILE='nautilus-seafile-share-link'
install --mode=555 "$FILE" "$TARGET" && {
    echo "$FILE installed"
    echo
    echo "You can now activate the script in Nautilus by using"
    echo
    echo "    nautilus-script-manager"
    echo "or"
    echo "    nautilus-scripts-manager"
}
