#!/bin/bash -x
# find good examples and process one for bad stuff
export CLASSPATH=`ls -d $PWD/lib/*jar $PWD | tr '\n\r' ::`
chmod 755 ~/Downloads/jsonschema2pojo-jsonschema2pojo-0.4.16/jsonschema2pojo-cli/target/jsonschema2pojo.sh
ln -s ~/Downloads/jsonschema2pojo-jsonschema2pojo-0.4.16/jsonschema2pojo-cli/target/jsonschema2pojo.sh .
 mkdir All
cp -r www.web3d.org All/.
find All -type f -name "*.json" -print0 | xargs -0 node FindBad.js | xargs rm
find All -type f -name "*.json" -print0 | xargs -L0 -0 -I % ./processOne.sh %
find -X All -type f -name "*.java" > JavaFiles1
./scrub.sh
