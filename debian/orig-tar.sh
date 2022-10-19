#!/bin/sh -e

VERSION="$2"
TAR=../simple-http_$VERSION.orig.tar.gz
DIR=simple-http-$VERSION
mkdir -p $DIR

# Unpack ready fo re-packing
tar -xzf $TAR -C $DIR --strip-components=1

GZIP=--best tar -czf $TAR --exclude '*.jar' --exclude '*.swp' \
        --exclude '*.class' --exclude 'CVS' --exclude '.svn' \
        --exclude "$DIR/javadoc" --exclude "$DIR/test/report" $DIR

rm -rf $DIR
