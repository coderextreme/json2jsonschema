#!/bin/bash
DIR=`dirname "$1"`
./jsonschema2pojo.sh -303 -T JSON -t "$DIR" -s "$1" -p "x3djson"
