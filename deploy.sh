#!/bin/bash
echo "Deploy from what source folder?"
read SOURCE
echo "What's the version number?"
read VERSION
echo "What environment?"
read ENV
NOW=$(date +"%m.%d.%Y")
DEST="$SOURCE-$ENV-$NOW-$VERSION"
echo "Building $DEST"
rm -rf $DEST
mkdir $DEST

cp -r deploy_assets/$ENV/$SOURCE/ $DEST/.
cd $SOURCE
cp -rf * ../$DEST
rm -rf ../$DEST/vendor
mkdir ../$DEST/vendor
cd ../$DEST/
composer update

cd ../
echo "Packaging $DEST"
cd $DEST
zip ../$DEST.zip -r * .[^.]*
echo "Done Packaging $DEST!"
