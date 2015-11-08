#!/bin/bash -x
ulimit -n 4096
mkdir x3djson
cp -r Merged2/*class x3djson/.
javac -cp lib/jackson-core-2.6.3.jar:lib/jackson-databind-2.6.3.jar:lib/jackson-module-jsonSchema-2.6.3.jar:lib/jackson-module-jaxb-annotations-2.6.3.jar:lib/jackson-annotations-2.6.3.jar JsonGenerationFromJaxbClasses.java
find x3djson -name '*class'| sed 's/.class//' | sed 's/\//./' | xargs java -cp .:lib/jackson-core-2.6.3.jar:lib/jackson-databind-2.6.3.jar:lib/jackson-module-jsonSchema-2.6.3.jar:lib/jackson-module-jaxb-annotations-2.6.3.jar:lib/jackson-annotations-2.6.3.jar JsonGenerationFromJaxbClasses
mkdir schema
mv x3djson.*.json schema
find schema -type f -name "*.json" -print0 | xargs -0 node FindBad.js | xargs rm
# sh jsonschema2pojo.sh -T JSONSCHEMA -t schema.json -s schema
(ls schema/* | sed 's/^/ -s /';  echo ../x3djson/Box.output.json) | xargs python ../GenSON/bin/genson.py -i 2 > schema.json
