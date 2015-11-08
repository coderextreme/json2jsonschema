#!/bin/bash -x
ulimit -n 4096
mkdir x3djson
export CLASSPATH=`ls -d $PWD/lib/*jar $PWD | tr '\n\r' ::`
cp -r Merged2/*class x3djson/.
javac JsonGenerationFromJaxbClasses.java
find x3djson -name '*class'| sed 's/.class//' | sed 's/\//./' | xargs java JsonGenerationFromJaxbClasses
mkdir schema
mv x3djson.*.json schema
find schema -type f -name "*.json" -print0 | xargs -0 node FindBad.js | xargs rm
# ./jsonschema2pojo.sh -303 -T JSONSCHEMA -t schema.json -s schema
(ls schema/* | sed 's/^/ -s /';  echo www.web3d.org/x3d/content/examples/X3dForWebAuthors/Chapter02-GeometryPrimitives/Box.json) | xargs genson -i 2 > schema.json

