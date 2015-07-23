#!/bin/bash

REL=`git describe | sed 's/release-//'`

NAME="seafile-share-link-$REL"

DIR="downloads/$NAME"
mkdir -p "$DIR/README-pix"

cp -pd $(ls | egrep -v '(build.sh|downloads|README-pix)') "$DIR"
cp -pd README-pix/* "$DIR/README-pix/"
cd downloads
tar cvzf $NAME.tar.gz "$NAME"
rm -r "$NAME"
echo 
echo "Ready in 'downloads/$NAME.tar.gz'"
