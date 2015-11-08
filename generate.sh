#!/bin/sh
find www.web3d.org -name '*json' -print0 | xargs -0 node concat.js > all.json
vi all.json  # edit because concat.js runs twice
./jsonschema2pojo.sh -s all.json -T JSON -t X3DALL
