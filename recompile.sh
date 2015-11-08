#!/bin/bash -x
export CLASSPATH=`ls -d $PWD/lib/*jar $PWD | tr '\n\r' ::`
find Merged2 -name '*.java' > JavaFiles3
cat JavaFiles3 | xargs perl -p -i -e 's/([A-Za-z0-9])_+([^A-Za-z0-9])/$1$2/g'
cat JavaFiles3 | xargs perl -p -i -e 's/package x3djson.*;/package x3djson;/g'
cat JavaFiles3 | xargs perl -p -i -e 's/x3djson[A-Za-z0-9_.]*\.([A-Za-z0-9_]*)/x3djson.$1/g'
cat JavaFiles3 | xargs javac
