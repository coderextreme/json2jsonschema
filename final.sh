#!/bin/sh
#cat /dev/null > allschema.json
#python ../genSON/bin/genson.py -i 2 -s allschema.json all.json  >> allschema.json
sh jsonschema2pojo.sh -T JSONSCHEMA -t X3D -s ../genSON/x3dmerge.json
