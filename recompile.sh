#!/bin/bash
find Merged -name '*java' | xargs perl -p -i -e 's/([A-Za-z0-9])_+([^A-Za-z0-9])/$1$2/g'
find Merged -name '*java' | xargs perl -p -i -e 's/package x3djson.*;/package x3djson;/g'
find Merged -name '*java' | xargs perl -p -i -e 's/x3djson[A-Za-z0-9_.]*\.([A-Za-z0-9_]*)/x3djson.$1/g'
find Merged -name '*java' | xargs javac -cp lib/validation-api-1.1.0.Final.jar:lib/jackson-annotations-2.6.3.jar:lib/commons-lang-2.6.jar Merged/*java
