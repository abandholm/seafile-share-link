#!/bin/bash

REL=`git describe | sed 's/release-//'`

NAME="seafile-share-link-$REL"

DIR="downloads/$NAME"
mkdir -p "$DIR"
cp -p $(ls | egrep -v '(build.sh|downloads)') "$DIR"
cd downloads
tar cvzf $NAME.tar.gz "$NAME"
rm -r "$NAME"
echo 
echo "Ready in 'downloads/$NAME.tar.gz'"
