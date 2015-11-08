#!/bin/sh
#cat /dev/null > allschema.json
#genson -i 2 -s allschema.json all.json  >> allschema.json
./createmerge.sh
./jsonschema2pojo.sh -T JSONSCHEMA -t X3DMERGE -s x3dmerge.json
