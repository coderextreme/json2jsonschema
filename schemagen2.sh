#!/bin/bash -x
ulimit -n 4096
rm -r x3djson
mkdir x3djson
export CLASSPATH=`ls -d $PWD/lib/*jar $PWD | tr '\n\r' ::`
cp -r Merged2/*class x3djson/.
javac JsonGenerationFromJaxbClasses.java
find x3djson -name '*class'| sed 's/.class//' | sed 's/\//./' | xargs java JsonGenerationFromJaxbClasses
mkdir schema1
mv x3djson.*.json schema1
find schema1 -type f -name "*.json" -print0 | xargs -0 node FindBad.js | xargs rm
# ./jsonschema2pojo.sh -303 -T JSONSCHEMA -t schema1.json -s schema1
(ls schema1/* | sed 's/^/ -s /';  echo www.web3d.org/x3d/content/examples/X3dForWebAuthors/Chapter02-GeometryPrimitives/Box.json) | xargs genson -i 2 > schema1.json

