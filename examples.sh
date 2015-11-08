#!/bin/bash -x
# find good examples and process one for bad stuff
mkdir All
cp -r www.web3d.org All/.
find All -type f -name "*.json" -print0 | xargs -0 node FindBad.js | xargs rm
find All -type f -name "*.json" -print0 | xargs -L0 -0 -I % ./processOne.sh %
find -X All -type f -name "*.java" > JavaFiles1
./scrub.sh
