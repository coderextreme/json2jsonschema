#!/bin/bash -x
ulimit -n 4096
mkdir x3djson
export CLASSPATH=`ls -d $PWD/lib/*jar $PWD | tr '\n\r' ::`
cp -r Merged2/*class x3djson/.
javac -cp lib/jackson-core-2.6.3.jar:lib/jackson-databind-2.6.3.jar:lib/jackson-module-jsonSchema-2.6.3.jar:lib/jackson-module-jaxb-annotations-2.6.3.jar:lib/jackson-annotations-2.6.3.jar JsonGenerationFromJaxbClasses.java
find x3djson -name '*class'| sed 's/.class//' | sed 's/\//./' | xargs java -cp .:lib/jackson-core-2.6.3.jar:lib/jackson-databind-2.6.3.jar:lib/jackson-module-jsonSchema-2.6.3.jar:lib/jackson-module-jaxb-annotations-2.6.3.jar:lib/jackson-annotations-2.6.3.jar JsonGenerationFromJaxbClasses
mkdir schema
mv x3djson.*.json schema
find schema -type f -name "*.json" -print0 | xargs -0 node FindBad.js | xargs rm
# ./jsonschema2pojo.sh -303 -T JSONSCHEMA -t schema.json -s schema
(ls schema/* | sed 's/^/ -s /';  echo ../x3djson/Box.output.json) | xargs genson -i 2 > schema.json
