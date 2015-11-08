#!/bin/sh
ulimit -n 4096
rm x3d*json
brew install python
brew linkapps python
sudo easy_install pip
sudo pip install genson
cat /dev/null > x3d.json
find www.web3d.org -name '*json' -print0| xargs -0 node FindGood.js | sed 's/ /\\ /g'| xargs genson -i 2 -s x3d.json >> x3d.json
split -p '^{' x3d.json x3d.json
genson -i 2 -s x3d.jsonaa -s x3d.jsonab www.web3d.org/x3d/content/examples/X3dForWebAuthors/Chapter02-GeometryPrimitives/Box.json > x3dmerge.json 
